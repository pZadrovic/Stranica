<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="UTF-8" />
    <title>Stranica.hr</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
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
<div class="article-container2">
<?php
$kategorija=$_GET['id'];
$query = "SELECT * FROM vijesti WHERE kategorija='$kategorija'";
$result = mysqli_query($dbc, $query);
$i=0;
while($row = mysqli_fetch_array($result)) {
echo '<article>';
echo '<div class="article2">';
echo '<div class="mjau_img">';
echo '<img src="' . UPLPATH . $row['slika'] . '"';
echo '</div>';
echo '<div class="media_body">';
echo '<h4 class="title">';
echo '<a href="clanak.php?id='.$row['id'].'">';
echo $row['naslov'];
echo '</a></h4>';
echo $row['sazetak'];
echo '</div></div>';
echo '</article>';
}?>
</div>
    <footer>
        Petra Zadrović, pzadrovic@tvz.hr, 2024.
    </footer>
</body>
</html>