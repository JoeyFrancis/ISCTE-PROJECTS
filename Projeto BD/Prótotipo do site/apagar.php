<!DOCTYPE html>
<html>
<head>
<title>BD Biblioteca - Apagar</title></head>

<body bgcolor=#CFC06D>
<center>
<p><h3>Apagar publicações</h3></p>
<form action="apagar.php" method="post" >
    <input type="int" name="Id">
    <input type="submit" value="Introduzir"/>
    <a href="<?php $_SERVER['PHP_SELF']; ?>">Refresh</a>
    

</form>
<a href="menu.html">voltar ao menu</a>
</center>
</body>
</html>

<?php

$con =mysqli_connect("localhost", "root","", "projeto_parte2") or die("error");

$output = "";

if(isset($_POST['Id'])){
    $search =$_POST['Id'];
    $sql="DELETE FROM publicacao WHERE Id ='$search'";
    $query=mysqli_query($con,$sql)or die("error");

    if(mysqli_query($con,$sql)){
        echo " A publicação '$search' foi apagada com sucesso";
    }else{
        echo " Ocorreu um erro ao apagar a publicação, verifique se o nome $search está correto";
    }
}

?>

