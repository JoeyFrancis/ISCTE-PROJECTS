<html>
<head>
<title>BD Biblioteca - Alterar</title>
</head>
<body bgcolor="#B4CB7B">
  <center>
<p><h3>Alterar uma Publicacao:</h3></p>
<h5> Certifique-se de inserir um Id válido</h5>
<form method="post" action="alterar.php">
<label for="Id">Id:</label>
  <input type=int name="Id" size="20" maxlength="20">
  <br/><br/>
  <label for="Nome">Título:</label>
  <input type=text name="Nome" size="20" maxlength="20">
  <br/><br/>
  <label for="Data_de_publicacao">Data de Publicação:</label><br/>
  <input type="date" name="Data_de_publicacao" size="20" maxlength="20">
  <br/><br/>
  <label for="Area_Tematica_Id">Área Temática Id:</label><br/>
  <input type="int" name="Area_Tematica_Id" size="20" maxlength="20">
  <br/>
  <br/>
  <input type="submit" name="submit" size="20" maxlength="20" value="Alterar">
    <input type="reset" name="Submit2" size="20" maxlength="20" value="Limpar">
</form>
<a href="menu.html">Voltar ao menu</a>
</center>
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

if(isset($_POST['submit'])){
  $id = $_POST['Id'];
  $nome = $_POST['Nome'];
  $data_publicacao = $_POST['Data_de_publicacao'];
  $area_tematica = $_POST['Area_Tematica_Id'];
  $sql="";

  
  if($nome !== "" && $data_publicacao !== "" && $area_tematica !== ""){
    $nome = $_POST['Nome'];
    $data_publicacao = $_POST['Data_de_publicacao'];
    $area_tematica = $_POST['Area_Tematica_Id'];

    $sql = "UPDATE publicacao SET Nome='$nome' , Data_de_publicacao='$data_publicacao' , Area_Tematica_Id='$area_tematica' WHERE Id='$id'";

  }
  if($nome !== "" && $data_publicacao !== "" && $area_tematica === ""){
    $nome = $_POST['Nome'];
    $data_publicacao = $_POST['Data_de_publicacao'];

    $sql = "UPDATE publicacao SET Nome='$nome' , Data_de_publicacao='$data_publicacao' WHERE Id='$id'";

  }
  if($nome !== "" && $data_publicacao === "" && $area_tematica !== ""){
    $nome = $_POST['Nome'];
    $area_tematica = $_POST['Area_Tematica_Id'];

    $sql = "UPDATE publicacao SET Nome='$nome' , Area_Tematica_Id='$area_tematica' WHERE Id='$id'";

  }
  if($nome === "" && $data_publicacao !== "" && $area_tematica !== ""){
    $data_publicacao = $_POST['Data_de_publicacao'];
    $area_tematica = $_POST['Area_Tematica_Id'];

    $sql = "UPDATE publicacao SET Data_de_publicacao='$data_publicacao' , Area_Tematica_Id='$area_tematica' WHERE Id='$id'";

  }
  if($nome !== "" && $data_publicacao === "" && $area_tematica === ""){
    $nome = $_POST['Nome'];

    $sql = "UPDATE publicacao SET Nome='$nome' WHERE Id='$id'";

  }
  if($nome === "" && $data_publicacao !== "" && $area_tematica === ""){
    $data_publicacao = $_POST['Data_de_publicacao'];

    $sql = "UPDATE publicacao SET Data_de_publicacao='$data_publicacao' WHERE Id='$id'";

  }
  if($nome === "" && $data_publicacao === "" && $area_tematica !== ""){
    $area_tematica = $_POST['Area_Tematica_Id'];

    $sql = "UPDATE publicacao SET Area_Tematica_Id='$area_tematica' WHERE Id='$id'";

  }

  if(mysqli_query($conn,$sql)){

    echo "A publicação foi alterada com sucesso!";
  }else{
    echo "Erro: " . $sql . "<br>" . mysqli_error($conn);
  }
  mysqli_close($conn);
  exit;
}
?>