<?php
	error_reporting(E_ALL^E_NOTICE);

	$con=mysqli_connect("localhost","root","admin123","simple_crud");

	$q=mysqli_query($con,"DELETE FROM berobat WHERE No_Transaksi='$_GET[no_transaksi]'");

	mysqli_close($con);

	header('Location: list_berobat.php');
?>
