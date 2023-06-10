
<?php
   
$Nome = $_GET['Nomee'];

$con=mysqli_connect("localhost","root","","projeto_parte2") or die("error");

$sql= "SELECT * FROM publicacao WHERE Nome='$Nome'";
$sqlLivro = "SELECT l.Id,l.Nome,l.Editora_Nome FROM livro l, edicao_de_livro el, publicacao p WHERE l.Id=el.Livro_Id AND el.Publicacao_Id=p.Id AND p.Nome='$Nome'";
$sqlPeriodico="SELECT pe.Editora_Nome,pe.Editora_ou_Periodico_Id,pe.Periodicidade_Nome,pe.ISSN,pe.Sigla,pe.Nome FROM periodico pe , edicao_de_periodico ep, publicacao p WHERE p.Id=ep.Publicacao_Id AND p.Nome='$Nome'";
$sqlMonografia="SELECT m.Tipo_de_monografia_Nome FROM monografia m , publicacao p WHERE p.Id=m.Publicacao_Id AND p.Nome='$Nome'";

$query=mysqli_query($con,$sql);
$queryPeriodico=mysqli_query($con,$sqlPeriodico);
$queryLivro=mysqli_query($con,$sqlLivro);
$queryMonografia=mysqli_query($con,$sqlMonografia);

$nrrows0=mysqli_num_rows($query);
$nrrows1=mysqli_num_rows($queryLivro);
$nrrows2=mysqli_num_rows($queryMonografia);
$nrrows3=mysqli_num_rows($queryPeriodico);

if($nrrows0==0){
   
}else {
    while ($row = mysqli_fetch_array($query)){  
    $Id=$row['Id'];
    $Nome=$row['Nome'];
    $Nome_abreviado=$row['Nome_abreviado'];
    $Codigo=$row['Codigo'];
    $Data_de_publicacao=$row['Data_de_publicacao'];
    $Ano_de_publicacao=$row['Ano_de_publicacao']; 
    $Nr_Pags = $row['Nr_Pags'];
    $Capa= $row['Capa'];
    $Capa_em_miniatura=$row['Capa_em_miniatura'];
    $Qtd_Emprestimos=$row['Qtd_Emprestimos'];
    $Qtd_Acessos= $row['Qtd_Acessos'];
    $Data_de_aquisicao=$row['Data_de_aquisicao']; 
    $Area_Tematica_Id=$row['Area_Tematica_Id'];
    $relevancia=$row['relevancia'];

    }
}
if($nrrows3==0){
}else{
    while($row = mysqli_fetch_array($queryPeriodico)){
        $EditoraRevistaNome=$row['Editora_Nome'];
        $IdEditora=$row['Editora_ou_Periodico_Id'];
        $Periodicidade=$row['Periodicidade_Nome'];
        $ISSN=$row['ISSN'];
        $Sigla=$row['Sigla'];
        $NomeRevista=$row['Nome'];
    }
}
if($nrrows1==0){
}else{
    while($row = mysqli_fetch_array($queryLivro)){
        $IdLivro=$row['Id'];
        $NomeLivro=$row['Nome'];
        $EditoraNome=$row['Editora_Nome'];
    }
}
if($nrrows2==0){
}else{
    while($row = mysqli_fetch_array($queryMonografia)){
        $NomeMonografiaTipo=$row['Tipo_de_monografia_Nome'];
        if($NomeMonografiaTipo==""){
        print("Não Existe");
        }
    }
}



?>
<!DOCTYPE html>
<html>
<head><title>BD Biblioteca - Lista Avançada</title></head>
<body bgcolor=#6C85D4>
<center>
<h1>Lista Avancada</h1>
   <form method="post" action="listaAvancada.php" >  

            <label>Id: <?php print("$Id"); ?>  </label> <br><br>
            <label>Nome:<?php print ("$Nome") ?> </label> <br><br>
            <label>Nome Abreviado: <?php print ("$Nome_abreviado") ?> </label><br> <br>
            <label>Código: <?php print ("$Codigo") ?> </label> <br><br>
            <label>Data de Publicação: <?php print ("$Data_de_publicacao") ?> </label> <br><br>
            <label>Ano de Publicação :<?php print ("$Ano_de_publicacao") ?> </label> <br><br>
            <label>Número de Páginas :<?php print ("$Nr_Pags") ?> </label><br> <br>
            <label>Capa :<?php print ("$Capa") ?>  </label> <br><br>
            <label>Capa em Miniatura: <?php print ("$Capa_em_miniatura") ?> </label> <br><br>
            <label>Quantidade de Empréstimos :<?php print ("$Qtd_Emprestimos") ?> </label> <br><br>
            <label>Quantidade de Acessos :<?php print( "$Qtd_Acessos") ?> </label> <br><br>
            <label>Data de Aquisição :<?php print ("$Data_de_aquisica") ?> </label> <br><br>
            <label>Área Temática ID :<?php print(" $Area_Tematica_Id ")?>  </label> <br><br>
            <label>Relevância :<?php print ("$relevancia") ?> </label> <br><br>
            <label>IdLivro :<?php print ("$IdLivro") ?> </label> <br><br>
            <label>Nome do Livro :<?php print ("$NomeLivro") ?> </label> <br><br>
            <label>Editora Nome :<?php print ("$EditoraNome") ?> </label> <br><br>
            <label>Nome Tipo de monografia :<?php print ("$NomeMonografiaTipo") ?> </label> <br><br>
            <label>Editora da Revista :<?php print ("$EditoraRevistaNome") ?> </label> <br><br>
            <label>Id da Editora :<?php print ("$IdEditora") ?> </label> <br><br>
            <label>Periodicidade :<?php print ("$Periodicidade") ?> </label> <br><br>
            <label>ISSN :<?php print ("$ISSN") ?> </label> <br><br>
            <label>Sigla :<?php print ("$Sigla") ?> </label> <br><br>
            <label>Nome Revista :<?php print ("$NomeRevista") ?> </label> <br><br>




            <a href="menu.html">voltar ao menu</a>
</center>
</body>


</html>
