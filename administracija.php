<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Stranica.hr - administracija</title>

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
                        <a class="nav-link active" href="administracija.php">Administracija</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="unos.html">Unos</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<?php
session_start();
include 'connect.php';

// Putanja do direktorija sa slikama
define('UPLPATH', 'img/');

// Provjera da li je korisnik došao s login forme
if (isset($_POST['prijava'])) {
    // Provjera da li korisnik postoji u bazi uz zaštitu od SQL injectiona
    $prijavaImeKorisnika = $_POST['username'];
    $prijavaLozinkaKorisnika = $_POST['lozinka'];
    $sql = "SELECT korisnicko_ime, lozinka, razina FROM korisnik WHERE korisnicko_ime = ?";
    $stmt = mysqli_stmt_init($dbc);

    if (mysqli_stmt_prepare($stmt, $sql)) {
        mysqli_stmt_bind_param($stmt, 's', $prijavaImeKorisnika);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);
        mysqli_stmt_bind_result($stmt, $imeKorisnika, $lozinkaKorisnika, $levelKorisnika);
        mysqli_stmt_fetch($stmt);

        // Provjera lozinke
        if (mysqli_stmt_num_rows($stmt) > 0 && password_verify($prijavaLozinkaKorisnika, $lozinkaKorisnika)) {
            $uspjesnaPrijava = true;

            // Provjera da li je admin
            if ($levelKorisnika == 1) {
                $admin = true;
            } else {
                $admin = false;
            }

            // Postavljanje session varijabli
            $_SESSION['username'] = $imeKorisnika;
            $_SESSION['level'] = $levelKorisnika;
        } else {
            $uspjesnaPrijava = false;
        }

        mysqli_stmt_close($stmt);
    } else {
        // SQL statement preparation failed
        $uspjesnaPrijava = false;
    }
}
$uspjesnaPrijava = false;
// Pokaži stranicu ukoliko je korisnik uspješno prijavljen i administrator je
if (($uspjesnaPrijava == true && $admin == true) || (isset($_SESSION['username']) && $_SESSION['level'] == 1)) {
    $query = "SELECT * FROM vijesti";
    $result = mysqli_query($dbc, $query);
    while ($row = mysqli_fetch_array($result)) {
 
echo '<form enctype="multipart/form-data" action="" method="POST">
<div class="form-item">
<label for="title">Naslov vjesti:</label>
<div class="form-field">
<input type="text" name="title" class="form-field-textual"
value="'.$row['naslov'].'">
</div>
</div>
<div class="form-item">
<label for="about">Kratki sadržaj vijesti (do 50
znakova):</label>
<div class="form-field">
<textarea name="about" id="" cols="30" rows="10" class="form-
field-textual">'.$row['sazetak'].'</textarea>
</div>
</div>
<div class="form-item">
<label for="content">Sadržaj vijesti:</label>
<div class="form-field">
<textarea name="content" id="" cols="30" rows="10" class="form-
field-textual">'.$row['tekst'].'</textarea>
</div>
</div>
<div class="form-item">
<label for="pphoto">Slika:</label>
<div class="form-field"> 
<input type="file" class="input-text" id="pphoto"
value="'.$row['slika'].'" name="pphoto"/> <br><img src="' . UPLPATH .
$row['slika'] . '" width=100px>
</div>
</div>
<div class="form-item">
<label for="category">Kategorija vijesti:</label>
<div class="form-field">
<select name="category" id="" class="form-field-textual"
value="'.$row['kategorija'].'">
<option value="svijet">Svijet</option>
<option value="hrvatska">Hrvatska</option>
</select>
</div>
</div>
<div class="form-item">
<label>Spremiti u arhivu:
<div class="form-field">';
if($row['arhiva'] == 0) {
echo '<input type="checkbox" name="archive" id="archive"/>
Arhiviraj?';
} else {
echo '<input type="checkbox" name="archive" id="archive"
checked/> Arhiviraj?';
}
echo '</div>
</label>
</div>
</div>
<div class="form-item">
<input type="hidden" name="id" class="form-field-textual"
value="'.$row['id'].'">
<button type="reset" value="Poništi">Poništi</button>
<button type="submit" name="update" value="Prihvati">
Izmjeni</button>
<button type="submit" name="delete" value="Izbriši">
Izbriši</button>
</div>
</form>';

if(isset($_POST['delete'])){
    $id=$_POST['id'];
    $query = "DELETE FROM vijesti WHERE id=$id ";
    $result = mysqli_query($dbc, $query);
    }
   
if(isset($_POST['update'])){
$picture = $_FILES['pphoto']['name'];
$title=$_POST['title'];
$about=$_POST['about'];
$content=$_POST['content'];
$category=$_POST['category'];
if(isset($_POST['archive'])){
$archive=1;
}else{
$archive=0;
}
$target_dir = 'img/'.$picture;
move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir);
$id=$_POST['id'];
$query = "UPDATE vijesti SET naslov='$title', sazetak='$about', tekst='$content',
slika='$picture', kategorija='$category', arhiva='$archive' WHERE id=$id ";
$result = mysqli_query($dbc, $query);
}
}
    }
    // Pokaži poruku da je korisnik uspješno prijavljen, ali nije administrator
 else if ($uspjesnaPrijava == true && $admin == false) {
    echo '<p>Bok ' . $imeKorisnika . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
} else if (isset($_SESSION['username']) && $_SESSION['level'] == 0) {
    echo '<p>Bok ' . $_SESSION['username'] . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
} else if ($uspjesnaPrijava == false) {
    ?>
    <!-- Forma za prijavu -->
    <form action="administracija.php" method="post">
        <div class="container">
            <label for="username"><b>Korisničko ime:</b></label>
            <input type="text" placeholder="Enter Username" name="username" required>
</br>
            <label for="lozinka"><b>Šifra:</b></label>
            <input type="password" placeholder="Enter Password" name="lozinka" required>
            </br>
            <button type="submit" name="prijava">Prijavi se</button>
        </div>
    </form>
    <p> Nemate profil?  <a href="registracija.php">Registrirajte se!</a> 
    <?php
}
?>
    <footer>
        Petra Zadrović, pzadrovic@tvz.hr, 2024.
    </footer>
</body>
</html>
