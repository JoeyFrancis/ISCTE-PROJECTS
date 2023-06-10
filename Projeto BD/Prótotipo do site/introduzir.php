<html>
<head>
<title>BD Biblioteca - Introduzir</title>
</head>
<style>
    h2 { color: #ffffff; }
  </style>
  <style>
    text { color: #ffffff; }
  </style>
<body bgcolor="#4A6C93">
    <center>
<p><h2>Introduzir nova Publicação:</h2></p>
<form method="post" action="introduzir.php">
  
	<label for="Id">Id:</label><br/>
    <input type="int" name="Id" size="20" maxlength="11">
    <br>
    <label for="Nome">Nome:</label><br/>
    <input type="varchar" name="Nome" size="20" maxlength="250" >
    <br>
    <label for="Nome_abreviado">Nome Abreviado:</label><br/>
    <input type="varchar" name="Nome_abreviado" size="20" maxlength="100">
    <br>
    <label for="Codigo">Código:</label><br/>
    <input type="int" name="Codigo" size="20" maxlength="11">
    <br>
    <label for="Data_de_publicacao">Data de Publicação:</label><br/>
    <input type="date" name="Data_de_publicacao">
    <br>
    <label for="Ano_de_publicacao">Ano de Publicação:</label><br/>
    <input type="smallint" name="Ano_de_publicacao" size="6" maxlength="6">
    <br>
    <label for="Nr_Pags">Número de Páginas:</label><br/>
    <input type="smallint" name="Nr_Pags" size="6" maxlength="6">
    <br>
    <label for="Capa">Capa:</label><br/>
    <input type="varchar" name="Capa" size="20" maxlength="255">
    <br>
    <label for="Capa_em_miniatura">Capa em Miniatura:</label><br/>
    <input type="varchar" name="Capa_em_miniatura" size="20" maxlength="255">
    <br>
    <label for="Qtd_Emprestimos">Quantidade de Empréstimos:</label><br/>
    <input type="smallint" name="Qtd_Emprestimos" size="5" maxlength="6">
    <br>
    <label for="Qtd_Acessos">Quantidade de Acessos:</label><br/>
    <input type="smallint" name="Qtd_Acessos" size="5" maxlength="6">
    <br>
    <label for="Data_de_aquisicao">Data de Aquisição:</label><br/>
    <input type="date" name="Data_de_aquisicao">
    <br>
    <label for="Area_Tematica_Id">Área Temática ID:</label><br/>
    <input type="int" name="Area_Tematica_Id" size="20" maxlength="11">
    <br>
    <label for="relevancia">Relevância:</label><br/>
    <input type="tinyint" name="relevancia" size="5" maxlength="4">
    <br>
    <br>
	  <input type="submit" name="Submit" value="Introduzir">
		<input type="reset" name="Submit2" value="Limpar">
    <input type="button" name="Submit3" value="Voltar atrás" onclick="history.back()">
    <a href="menu.html">voltar ao menu</a>

    </center>
</p>
</form>

<p>&nbsp; </p>

</body>
</html>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "projeto_parte2";

$conn = mysqli_connect($servername,$username,$password,$dbname);
if(!$conn)  {
    die("Connection failed: " . mysqli_connect_error($conn));
}

$Id=$_POST['Id'];
$Nome=$_POST['Nome'];
$Nome_abreviado=$_POST['Nome_abreviado'];
$Codigo=$_POST['Codigo'];
$Data_de_publicacao=$_POST['Data_de_publicacao'];
$Ano_de_publicacao=$_POST['Ano_de_publicacao'];
$Nr_Pags=$_POST['Nr_Pags'];
$Capa=$_POST['Capa'];
$Capa_em_miniatura=$_POST['Capa_em_Miniatura'];
$Qtd_Emprestimos=$_POST['Qtd_Emprestimos'];
$Qtd_Acessos=$_POST['Qtd_Acessos'];
$Data_de_aquisicao=$_POST['Data_de_aquisicao'];
$Area_Tematica_Id=$_POST['Area_Tematica_Id'];
$relevancia=$_POST['relevancia'];

$sql = "INSERT INTO publicacao (Id,Nome,Nome_abreviado,Codigo,Data_de_publicacao,Ano_de_publicacao,Nr_Pags,Capa,Capa_em_miniatura,Qtd_Emprestimos,Qtd_Acessos,Data_de_aquisicao,Area_Tematica_Id,relevancia) VALUES ('$Id','$Nome','$Nome_abreviado','$Codigo','$Data_de_publicacao','$Ano_de_publicacao','$Nr_Pags','$Capa','$Capa_em_miniatura','$Qtd_Emprestimos','$Qtd_Acessos','$Data_de_aquisicao','$Area_Tematica_Id','$relevancia')";
if(mysqli_query($conn,$sql)){
    echo "Nova publicação inserida com sucesso";
}else{
    
}

mysqli_close($conn);
exit;
?>
