<?php

    $con=mysqli_connect("localhost","root","","projeto_parte2") or die("error");
    $output="";
    if(isset($_POST['nome'])){
        $search=$_POST['nome'];
        $sql="SELECT * FROM publicacao WHERE Nome LIKE '%$search'";
        $query=mysqli_query($con,$sql) or die("error");
        $nrrows= mysqli_num_rows($query);

        if($nrrows==0){
            $output='Não existe a publicação pretendida, por favor tenha em atenção se o Nome está correto';
        }else{
            while($row=mysqli_fetch_array($query)){
                $Nome = $row['Nome'];
                $output .= '<div>'.$Nome.'</div>';
            }
        }
    }
    ?>

<!DOCTYPE html>
<html>
 <head><title>BD Biblioteca - Pesquisa Basica</title></head>
 <body bgcolor=#CFC06D>
     <center>
    <p><h1>Pesquisa Basica Publicacoes</h1></p>
    <form method="post" action="pesquisaBasica.php"  >
    <input type="text" name="nome" >
    <input type="submit" name="search" value="Search"/>

    <a href="menu.html">voltar ao menu</a>

    </form>
    <?php print("$output"); ?>
</center>
    </body>
</html>