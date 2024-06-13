<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Stranica.hr</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
    <header>

    <div class="container-fluid">
                <h1>STRANICA.hr</h1>
              </div>

        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                     <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="index.php">Naslovnica</a>
                    </li>
                     <li class="nav-item">
                         <a class="nav-link" href="kategorija.php?id=svijet">Svijet</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link" href="kategorija.php?id=hrvatska">Hrvatska</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link" href="administracija.php">Administracija</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link" href="unos.html">Unos</a>
                    </li>
                </ul>

            </div>
          </nav>

    </header>
    <?php
include 'connect.php';
define('UPLPATH', 'img/');
?>
    <section role="main">
<div class="row">
<h2 class="category"><?php
$kategorija=$_GET['id'];
$query = "SELECT * FROM vijesti WHERE id=$kategorija";
$result = mysqli_query($dbc, $query);
$row = mysqli_fetch_array($result);
echo "<span>".$row['kategorija']."</span>";
?></h2>
<h1 class="title"><?php
echo $row['naslov'];
?></h1>
<p>AUTOR:</p>
<p>OBJAVLJENO: <?php
echo "<span>".$row['datum']."</span>";
?></p>
</div>
<section class="slika">
<?php
echo '<img src="' . UPLPATH . $row['slika'] . '">';
?>
</section>
<section class="about">
<p>
<?php
echo "<i>".$row['sazetak']."</i>";
?>
</p>
</section>
<section class="sadrzaj">
<p>
<?php
echo $row['tekst'];
?>
</p>
</section>
</section>
<footer>
        Petra Zadrović, pzadrovic@tvz.hr, 2024.
    </footer>
</body>
</html>