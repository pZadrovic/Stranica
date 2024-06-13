<!DOCTYPE html>
<head>
	<title>PWA vježba</title>

    <meta charset="UTF-8" />


</head>
<body>
	


<?php
include 'connect.php';
$picture = $_FILES['slika']['name'];
$title=$_POST['title'];
$about=$_POST['about'];
$content=$_POST['content'];
$category=$_POST['category'];
$date=date('d.m.Y.');
if(isset($_POST['archive'])){
$archive=1;
}else{
$archive=0;
}
$target_dir = 'img/'.$picture;
move_uploaded_file($_FILES["slika"]["tmp_name"], $target_dir);
$query = "INSERT INTO Vijesti (datum, naslov, sazetak, tekst, slika, kategorija,
arhiva ) VALUES ('$date', '$title', '$about', '$content', '$picture',
'$category', '$archive')";
$result = mysqli_query($dbc, $query) or die('Error querying databese.');
$query = "SELECT * FROM vijesti WHERE naslov='$title'";
$result = mysqli_query($dbc, $query);
$row = mysqli_fetch_array($result);

?>

<script>
      let url = "<?php echo "clanak.php?id='" . $row['id'] . "'"; ?>";
      window.location.href = url;
    </script>
<noscript>
        <meta http-equiv="refresh" content="3;URL=<?php>echo "clanak.php?id='" . $row['id'] . "'";mysqli_close($dbc);?>" >
    </noscript>



    

</body>
</html>