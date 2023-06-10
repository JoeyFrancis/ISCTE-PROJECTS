<?php

$con=mysqli_connect("localhost","root","","projeto_parte2") or die("error");

$sql="SELECT p.Nome AS Nomee,p.Capa, p.Data_de_publicacao,p.Qtd_Emprestimos , a.Nome FROM publicacao p, area_tematica a WHERE p.Area_Tematica_Id=a.Id";

    $query=mysqli_query($con, $sql) or die(mysql_error());

?>

<!DOCTYPE html>
<html>
 <head><title>BD Biblioteca - Lista Publicações</title></head>
 <body bgcolor=#6C85D4>
    <center>
    <p><h1>Lista Publicacoes</h1></p>
    <form method="post" action="listar.php" > 
    </form>
    <table width = "50%" border="3" cellspacing="5">
        
        <tr>
            <td>Título<td>
            <td>Área Temática<td>
            <td>Data de Publicação<td>
            <td>Nr Empréstimos<td>
            <td>Capa<td>
            <form action="apagar.php" method=post><td><input type=hidden name=Nome value=$Nome><input type=submit value=Apagar></td></form><form action="alterar.php" method=post><td><input type=hidden name=Nome value=$Nome><input type=submit value=Alterar></td></form>
        </tr>
<?php while ($row = mysqli_fetch_array($query)){ ?>
     <tr>
     <td><a href="listaAvancada.php?Nomee=<?php echo $row['Nomee'] ?> "><?php echo $row['Nomee'] ?></a><td>
     <td><?php echo $row['Nome'] ?> <td>
     <td><?php echo $row['Data_de_publicacao'] ?> <td>
     <td><?php echo $row['Qtd_Emprestimos'] ?> <td>
     <td><?php echo $row['Capa'] ?><td>


</tr> 
<?php } ?>

    


</table>
</body>
    <a href="menu.html">voltar ao menu</a> 
    </center>
</html>