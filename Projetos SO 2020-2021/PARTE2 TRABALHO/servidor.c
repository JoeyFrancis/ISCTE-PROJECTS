/******************************************************************************
 ** ISCTE-IUL: Trabalho prático de Sistemas Operativos
 **
 ** Aluno: Nº: 98647     Nome: João Monteiro
 ** Nome do Módulo: servidor.c
 ** Descrição/Explicação do Módulo: 
 ** O processo Servidor é responsável pela atribuição de um enfermeiro para administrar as vacinas aos 
 ** cidadãos que chegam aos Centros de Saúde. Este módulo estará sempre ativo, à espera da chegada de 
 ** cidadãos
 **
 ******************************************************************************/
 
#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include "common.h"

Cidadao cidadao;
Enfermeiro *enfermeiro;
Vaga vagas [NUM_VAGAS];
int numero_enfermeiros;
int l ;
int vaga1;

// Regista o PID do servidor no ficheiro servidor.pid. Para isso usei um pointer que abria e escrevia o pid do processo servidor no ficheiro servidor.pid
// Se o servidor.pid exister então aparece um aviso no ecrã avisando que o PID do processo servidor foi escrito no servidor.pid
// Se o servidor.pid não existir então aparece no ecrã um erro de como não é possível registar o PID do processo servidor.

// S1)

void registar_PID(){
if(access(FILE_PID_SERVIDOR, F_OK)==0){
FILE *f = fopen(FILE_PID_SERVIDOR, "w");
fprintf(f, "%d" , getpid());
fclose(f);
sucesso("S1) Escrevi no ficheiro FILE_PID_SERVIDOR o PID: %i",getpid());
}else{
erro("S1) Não consegui registar o servidor!");

}
}


// Define uma estrutura de dados dinâmica em memória com os dados do ficheiro enfermeiros.dat e o tamanho certo para toda a lista de enfermeiros

// S2)

void estrutura_dinamica_enfermeiros(){

FILE* f = fopen(FILE_ENFERMEIROS,"r");
if (f) {
   
   fseek(f,0,SEEK_END);
   
   long filesize = ftell(f);

   int numero_enfermeiros=filesize/sizeof(Enfermeiro);
   sucesso("S2) Ficheiro FILE_ENFERMEIROS tem %zu bytes, ou seja, %d enfermeiros",filesize,numero_enfermeiros);
   enfermeiro=(Enfermeiro *)malloc(numero_enfermeiros*sizeof(Enfermeiro));

   for(int i=0; i<numero_enfermeiros;i++){
   fseek(f,i*sizeof(Enfermeiro),SEEK_SET);
   fread(&enfermeiro[i],sizeof(Enfermeiro),1,f);
   }


   }else{
   erro("S2) Não consegui ler o ficheiro FILE_ENFERMEIROS!");
   }
   fclose(f);
   
}
 
// Inicia a lista de vagas com o index_enfermeiro com o valor -1.
// Isto fará com que a lista dos enfermeiros seja limpa.

// S3)

void limpar_tela(){

for(int i=0; i<NUM_VAGAS;i++){

vagas[i].index_enfermeiro= -1;

}
sucesso (" S3) Iniciei a lista de %d vagas", NUM_VAGAS);
}


// Arma e trata o sinal para que sejam tratados os cidadãos que chegam ao CS
// e lê a informação do cidadão registado do ficheiro pedidovacina.txt e  verifica qual CS desse cidadão
// fazendo "fscanf" de um pointer f que lê o pedidovacina.txt. Se o pedidovacina.txt existir então é mostrado no ecrã um aviso os dados que foram pedidos.
// Se o pedidovacina.txt não existir então mostra um erro no ecrã com um erro de como não é possivel abrir o ficheiro. Se o ficheiro existir e não conseguir ler 
// então é mostrado outro erro que avisa que não é possivel ler o ficheiro pedidovacina.txt.

// S5.6.1)

void acabou(){
  kill(SIGTERM,cidadao.PID_cidadao);
}


// S5.1)

void cidadaos_signal(){
if ( access(FILE_PEDIDO_VACINA, F_OK ) == 0 ){
FILE *f= fopen(FILE_PEDIDO_VACINA, "r");


fscanf(f, "%d:%99[^:]:%d:%99[^:]:%9[^:]:%d:%d", &cidadao.num_utente,cidadao.nome,&cidadao.idade,cidadao.localidade,cidadao.nr_telemovel,&cidadao.estado_vacinacao,&cidadao.PID_cidadao);
sucesso("S5.1) Dados Cidadão: %i; %s; %i; %s; %s; 0",cidadao.num_utente,cidadao.nome,cidadao.idade,cidadao.localidade,cidadao.nr_telemovel);
fclose(f);


}else{
erro("S5.1) Não foi possível abrir o ficheiro FILE_PEDIDO_VACINA");
return;
}

}




// Verifica se os enfermeiros correspondentes a um CS estão disponíveis ou não e se existe vaga num CS.
// Usando um "if" descobrimos se o enfermeiro está disponível ou não. Se não estiver disponível então mostra um erro 
// avisando que o enfermeiro está indisponível para certo CS e um sinal ao PID_cidadao que informa o cidadão que a vacinação não é possivel.
// Se estiver disponível então temos de fazer outro "if" para ver se 
// existe vagas para a vacinação. Se não existir então mostramos no ecrã um erro de como não existe vaga para aquele pedido e enviamos um sinal ao PID_cidadao que informa 
// o cidadão que não existe vaga para vacinação naquele momento. Se houver vaga então vamos usa um "printf" no vetor "vagas" com os dados do enfermeiro e cidadão pedidos. 
// No fim pomos a disponibilidade do enfermeiro que dará a vacina a 0, ficando indisponível.



void vagas_verificacao(int j){

 for(int i=0;i<NUM_VAGAS;i++){
 if(vagas[i].index_enfermeiro==-1){

  sucesso("S5.2.2) Há vaga para vacinação para o pedido %i",cidadao.PID_cidadao);
   vaga1=i;
vagas[i].index_enfermeiro=j;
vagas[i].cidadao=cidadao;
enfermeiro[j].disponibilidade=0;
sucesso("S5.3) Vaga nº %i preenchida para o pedido %i",vaga1,cidadao.PID_cidadao);
return;


 }
}
erro("S5.2.2) Não há vaga para vacinação para o pedido %i",cidadao.PID_cidadao);
kill(cidadao.PID_cidadao,SIGTERM);
return;


}

// Atualiza a entrada das lista de Vagas preenchidas anteriormente pelo cidadão para incluir também a informação do PID desse processo servidor filho
// Se o PID_cidadao do iterador no vetor vagas for igual ao PID_cidadao do cidadão a tomar a vacina então
// o processo filho será igual ao iterador n no PID_filho e o igualamos o nosso iterador n ao num_vaga, que é um itetador
// para contrar o numero de vagas já feitas, fazendo o trabalho de contador.
// O processo servidor pai não fica à espera que o processo servidor filho termine. 
// Em vez disso arma um sinal para acordar o processo servidor quando o processo servidor filho terminar.




// S5.4) e S5.6)

void cria_p_filho(){
int num_vaga;
int processo_filho=fork();
for(int i=0;i<NUM_VAGAS;i++){
vagas[i].PID_filho==processo_filho;
if(processo_filho=-1){
erro(" S5.4) Não foi possível criar o servidor dedicado");
}else{

if(vagas[i].PID_filho == 0){ 
//filho
// S5.6.1)

kill(cidadao.PID_cidadao,SIGTERM);
sucesso("S5.6.1) SIGTERM recebido, servidor dedicado termina Cidadão");

// S5.6.2)
kill(cidadao.PID_cidadao,SIGUSR1);
sucesso("S5.6.2) Servidor dedicado inicia consulta de vacinação");

// S5.6.3)
sleep(TEMPO_CONSULTA);
sucesso("S5.6.3) Vacinação terminada para o cidadão com o pedido nº %i",cidadao.PID_cidadao);

// S5.6.4)

kill(cidadao.PID_cidadao,SIGUSR2);
sucesso("S5.6.4) Servidor dedicado termina consulta de vacinação");
}else{
//pai
// S5.5)
// S5.5.1) e S5.5.2)


vagas[num_vaga].PID_filho=processo_filho;
sucesso("S5.5.1) Servidor dedicado %i na vaga %i",vagas[i].PID_filho,num_vaga);
sucesso("S5.5.2) Servidor aguarda fim do servidor dedicado %i",vagas[i].PID_filho);

}
}
}
}

// S5.2) a S5.3)

void enfermeiro_disponibilidade(){

char CS[15];
strcpy(CS,"CS");
char CS_localidade[20];
strcpy(CS_localidade, cidadao.localidade);
strcat(CS,CS_localidade);
int valor_numero;
for(int i=0;i<numero_enfermeiros;i++){
  char * Centro_Saude=enfermeiro[i].CS_enfermeiro;
  if(strcmp(CS,Centro_Saude)==0){
    if(enfermeiro[i].disponibilidade==0){
      erro("S5.2.1) Enfermeiro %D indisponível para o pedido %d para o Centro de Saúde %S\n",i,cidadao.PID_cidadao,cidadao.localidade);
   kill(cidadao.PID_cidadao,SIGTERM);
   }else{
     sucesso(" S5.2.1) Enfermeiro %d disponível para o pedido %d",i,cidadao.PID_cidadao);
   break;
   }
  }


}
if(valor_numero==1){
  cria_p_filho();
}
}


// S4)

void chegada_do_pedido(){
for(;;){
  sucesso("S4) Servidor espera pedidos");
  signal(SIGUSR1,cidadaos_signal);
  l=1;
  while(l==1){
    pause();
  }
 
}
}







// S5.5.3.1) Quando o processo servidor filho terminar o processo servidor pai limpa a entrada da tabela de vagas
// S5.5.3.2) Atualiza o perfil do enfermeiro que deu a vacina como disponivel.
// S5.5.3.3) Incrementa o nª de vacinas dadas por cada enfermeiro em especifico.
// S5.5.3.4) Atualiza o enfermeiros.dat com a informação do enfermeiro em separado, ou seja de cada enfermeiro
// S5.5.3.5) Volta ao que estava a fazer antes do processo servidor filho terminar

void wake_up(){

  int processo_terminou=wait(NULL);
int vaga1;
int index_enfermeiros;
for(int i=0;i<NUM_VAGAS;i++){
if(vagas[i].PID_filho==processo_terminou){
vaga1=i;
index_enfermeiros=vagas[i].index_enfermeiro;
break;
}



vagas[vaga1].index_enfermeiro=-1;
sucesso("S5.5.3.1) Vaga %i que era do servidor dedicado %i libertada",vaga1,processo_terminou);

// S5.5.3.2)

enfermeiro[index_enfermeiros].disponibilidade=1;
sucesso("S5.5.3.2) Enfermeiro %i atualizado para disponível", index_enfermeiros);

// S5.5.3.3)

enfermeiro[index_enfermeiros].num_vac_dadas++;
sucesso("S5.5.3.3) Enfermeiro %i atualizado para <nº Vacinas> vacinas dadas",index_enfermeiros,enfermeiro[index_enfermeiros].num_vac_dadas);

// S5.5.3.4)

FILE *f = fopen(FILE_ENFERMEIROS,"r+");
fseek(f,(index_enfermeiros-1)*sizeof(Enfermeiro), SEEK_SET);
fwrite(&enfermeiro[index_enfermeiros], sizeof(enfermeiro[index_enfermeiros]),1,f);
fclose(f);
sucesso("Ficheiro FILE_ENFERMEIROS %i atualizado para %i vacinas dadas", index_enfermeiros,enfermeiro[index_enfermeiros].num_vac_dadas);
// S5.5.3.5)
return;
 sucesso(" S5.5.3.5) Retorna");


vagas[i].index_enfermeiro=printf(":%d", vagas[i].PID_filho);
}
}










// O processo arma um sinal para que se possa encerrar o utilizador fazendo CTRL+C 
// Quando isto acontecer é enviando a todos os processos servidor filhos para os terminar.
// Depois remove o ficheiro servidor.pid com a função "remove" e termina o processo servidor.
// Quando o processo servidor terminar aparece no ecrã um aviso a informar que o servidor terminou
// usando a função "sucesso"


// S6)

void atalho_servidor_terminar(){
  sucesso("S6) Servidor terminado");
kill(vagas[vaga1].PID_filho,SIGTERM);
remove(FILE_PID_SERVIDOR);

}



int main () {
  
signal(SIGINT,atalho_servidor_terminar); // S6)

registar_PID(); //S1)
estrutura_dinamica_enfermeiros(); // S2)
limpar_tela(); //S3)
chegada_do_pedido(); // S4)
cidadaos_signal(); // S5)
wake_up(); 
cria_p_filho();


}

