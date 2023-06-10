
<?php

$con=mysqli_connect("localhost","root","","projeto_parte2") or die("error");

    
    $sql = "SELECT * FROM publicacao ";

    if(isset($_POST['searchs'])){

        $term=$_POST['name'];

        $sql .= "WHERE Nome = '{$term}'";
        $sql .= "OR Codigo = '{$term}'";
        $sql .= "OR Data_de_publicacao = '{$term}'";
        $sql .= "OR Area_Tematica_Id = '{$term}'";
        $sql .= "OR relevancia = '{$term}'";

    }

    $query=mysqli_query($con,$sql) or die("error");

?>

<html>
 <head><title>BD Biblioteca - Pesquisa Avançada</title></head>
 <body bgcolor=#92D46C>
    <center>
    <p><h1>Pesquisa Avançada Publicações</h1></p>

    <form  method="post" action="pesquisaAvancada.php" > 
    Search: <input type="text" name="name"  value="" />
    <input type="submit" name="searchs" value="Search"/>
    <a href="<?php $_SERVER['PHP_SELF']; ?>">Refresh</a> 

    </form>

    <table width = "70%" border="3" cellspacing="5">

        <tr>
            <td><strong>Título</strong><td>
            <td><strong>Área Temática</strong><td>
            <td><strong>Data de Publicação</strong><td>
            <td><strong>Nr Empréstimos</strong><td>
            <td><strong>Capa</strong><td>
        </tr>

        <?php while ($row = mysqli_fetch_array($query)){ ?>
    
        <tr>
        <td><?php echo $row['Nome'] ?> <td>
        <td><?php echo $row['Area_Tematica_Id']; ?><td>
        <td><?php echo $row['Data_de_publicacao'] ?> <td>
        <td><?php echo $row['Qtd_Emprestimos']?> <td>
        <td><?php echo $row['Capa']?> <td>

        </tr> 
<?php } ?>

    </table>
    </body>
        <a href="menu.html">voltar ao menu</a>  
        </center>
    </html>
