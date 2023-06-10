/******************************************************************************
 ** ISCTE-IUL: Trabalho prático de Sistemas Operativos
 **
 ** Aluno: Nº:  98647  Nome: João Monteiro
 ** Nome do Módulo: cidadao.c
 ** Descrição/Explicação do Módulo: 
 **
 ** O módulo Cidadão simula, na prática, a chegada do cidadão ao centro de saúde da sua localidade para 
 ** iniciar o processo de vacinação, seguindo as regras do plano de Vacinação
 **
 ******************************************************************************/
#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include "common.h"

Cidadao cidadao;
int valor_da_pausa;
// Pede ao cidadão as informações ao cliente para criar o pedido de vacinação.
// É pedido ao cidadão as informações a partir de "printf" e é guardado nas respetivas variáveis a partir do "scanf".
// Assim serão guardadas no nosso sistema para utiliza-las mais tarde.

//  C1)

void  admissao_cidadao() {

printf("\n");
    
    printf("-------------- <ADMISSÃO CIDADÃOS> -----------\n");


printf("Insira o número do cidadao: \n");
scanf("%i", &cidadao.num_utente);

printf("Insira o nome do cidadão: \n");
scanf("%99s", &cidadao.nome);

printf("Insira a idade do cidadão: \n");
scanf("%i", &cidadao.idade);

printf("Insira a localidade do cidadãos: \n");
scanf("%99s", &cidadao.localidade);

printf("Insira o número de telemóvel do cidadão: \n" );
scanf("%9s", &cidadao.nr_telemovel);

sucesso("C1) Dados Cidadão: %i; %s; %i; %s; %s; 0",cidadao.num_utente,cidadao.nome,cidadao.idade,cidadao.localidade,cidadao.nr_telemovel);

// Cria um cidadao que contém o PID desse cidadão.
//  Igualamos a variável "PID_cidadao" ao getpid() para ir buscar o PID do cidadão e armazena-lo no "getpid()".
// C2)

cidadao.PID_cidadao=getpid();
sucesso("C2) PID Cidadão: %i",getpid());
}

void pausa_a_zero()
{
    valor_da_pausa=0;
}
// Verifica se é ou não possivel criar o pedido de vacinação. Isto é feito com a função "access". Se for possivel então vamos escrever no nosso ficheiro "pedidovacina.txt"
// as variáveis que guardamos em cima com o "scanf" e depois manda um aviso a dizer que o pedido foi criado com sucesso.
// Se não for possivel manda um erro de 5 em 5 segundos, com a função "wait" e "alarm", dizendo que não foi possivel criar o pedido de vacinação, pois já existe um pedido criado.
// O erro desaparece quando o pedidovacina.txt for apagado com sucesso.

// C3) e C4)
void pedido_vacina_erro(){
if ( access(FILE_PEDIDO_VACINA, F_OK ) == 0 ){

erro("C3) Não é possível iniciar o processo de vacinação neste momento");
signal(SIGALRM,pausa_a_zero);
alarm(5);
valor_da_pausa=1;
while(valor_da_pausa){
    pause();
}

}else{

sucesso("C3) Ficheiro FILE_PEDIDO_VACINA pode ser criado");

FILE *f = fopen(FILE_PEDIDO_VACINA, "w");
if(f!=NULL){
fprintf(f, "%i:", cidadao.num_utente);
fprintf(f, "%s:", cidadao.nome);
fprintf(f, "%i:", cidadao.idade);
fprintf(f, "%s:", cidadao.localidade);
fprintf(f, "%s:", cidadao.nr_telemovel);
fprintf(f, "%i:", cidadao.estado_vacinacao);
fprintf(f, "%i\n", cidadao.PID_cidadao);
fclose(f);
sucesso("C4) Ficheiro FILE_PEDIDO_VACINA criado e preenchido");
}else{
    erro("C4) Não é possível criar o ficheiro FILE_PEDIDO_VACINA");
}
}


}

// Arma o sinal que faz com que, se enquando o cidadão estiver a preencher os seus dados fizer CTRL+C então o pedido de vacina 
// feito pelo cidadão é cancelado e manda um aviso a informar que o cidadão cancelou o pedido de vanicação, apagando o pedidovacina.txt até agora criada com a função "remove".

// C5)

void pedido_cancelado(){

erro("C5) O cidadão cancelou a vacinação, o pedido nº %i foi cancelado" ,getpid());
remove(FILE_PEDIDO_VACINA);
exit(0);
}


// Lê o PID servidor do ficheiro servidor.pid a partir do "fscanf" do pointer "file" e envia um sinal ao processo servidor a partir do "kill" para que este o indique se o 
// cidadão será vacinado ou não, enviando um aviso para qualquer um dos casos.

// C6)

void ler_pedido_vacinacao(){
int pid_lido;

if ( access(FILE_PID_SERVIDOR, F_OK ) == 0 ){

FILE *file = fopen(FILE_PID_SERVIDOR, "r");

fscanf(file, "%d", &pid_lido);
fclose(file);
kill(pid_lido,SIGUSR1);
sucesso("C6) Sinal enviado ao Servidor: %i",pid_lido);
}else{
erro("C6) Não existe ficheiro FILE_PID_SERVIDOR!");
}
}
// C7)

// Arma e trata o sinal para que o processo servidor indique que existe um enfemeiro disponível para 
// a vacinação do cidadão logo a vacina vai ser feita. Se o sinal for recebido então manda um aviso
// para a tela a dizer que a vacina poderá ser admistrada ao cidadão e apaga com a função "remove" o pedidovacina.txt.

void vacina_pronta_admistracao(){

sucesso("C7) Vacinação do cidadão com o pedido nº %i em curso" ,getpid());
remove(FILE_PEDIDO_VACINA);
exit(0);

}


// Arma e trata o sinal para que o processo servidor indique que a vacinação terminou.
// Recebendo este sinal é escrito um aviso na tela a informar que a vacinação do cidadão foi concluida.

// C8)

void vacinacao_concluida(){

sucesso("C8) Vacinação do cidadão com o pedido nº %i concluída", getpid());
exit(0);

}

// Arma e trata o sinal para se o processo servidor receber a informação de que não será possivel a admistração da vacina ao cidadão.
// Se receber este sinal avisa no ecrã que não foi possivel admistrar a vacina.
// Elimina o pedidovacina.txt com o "remove" e acaba a operação.

// C9)


void vacinacao_impossivel(){

sucesso("C9) Não é possível vacinar o cidadão no pedido nº %i", getpid());
remove(FILE_PEDIDO_VACINA);
exit(0);

}




//Main 

int main(){

admissao_cidadao(); // C1,C2
pedido_vacina_erro();
signal(SIGINT, pedido_cancelado); // C5


ler_pedido_vacinacao(); // C6

signal(SIGUSR1, vacina_pronta_admistracao); //C7
signal(SIGUSR2,vacinacao_concluida); // C8
signal(SIGTERM,vacinacao_impossivel); //C9


// C10)

while(1) { 
pause();
}
}

