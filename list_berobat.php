<!DOCTYPE html>
<html lang="en">
<head>
	<title>JWP - List Data Berobat</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<?php
	error_reporting(E_ALL^E_NOTICE);

	$con=mysqli_connect("localhost","root","admin123","simple_crud");

	$q=mysqli_query($con,
		"SELECT 
			berobat.No_Transaksi, 
			berobat.Tanggal_Berobat, 
			pasien.Nama_Pasien, 
			TIMESTAMPDIFF(YEAR, pasien.Tanggal_Lahir, NOW()) AS Umur, 
			pasien.Jenis_Kelamin, 
			poli.Nama_Poli, 
			dokter.Nama_Dokter, 
			berobat.Biaya_Adm 
		FROM 
			berobat 
			JOIN pasien ON berobat.Pasien_ID = pasien.Pasien_ID 
			JOIN dokter ON berobat.Dokter_ID = dokter.Dokter_ID 
			JOIN poli ON dokter.Poli_ID = poli.Poli_ID"
	);

	$list_berobat="";
	while($h=mysqli_fetch_array($q)){
		$list_berobat=$list_berobat.
			"<tr>
				<td>$h[No_Transaksi]</td>
				<td>$h[Tanggal_Berobat]</td>
				<td>$h[Nama_Pasien]</td>
				<td>$h[Umur]</td>
				<td>$h[Jenis_Kelamin]</td>
				<td>$h[Nama_Poli]</td>
				<td>$h[Nama_Dokter]</td>
				<td>$h[Biaya_Adm]</td>
				<td>
					<a href='list_berobat_edit.php?status=edit&no_transaksi=$h[No_Transaksi]' class='btn btn-success btn-sm'>Edit</a> 
					<a href='list_berobat_save_delete.php?no_transaksi=$h[No_Transaksi]' class='btn btn-danger btn-sm'>Del</a>
				</td>
			</tr>";
	}
	$list_berobat= 
		"<p><a href='list_berobat_new.php' class='btn btn-info btn-sm'>Add New</a></p>
		<table class='table table-striped'>
			<tr class='table-success'>
				<th>No Transaksi</th>
				<th>Tanggal Berobat</th>
				<th>Nama Pasien</th>
				<th>Umur</th>
				<th>Jenis Kelamin</th>
				<th>Nama Poli</th>
				<th>Nama Dokter</th>
				<th>Biaya Adm</th>
				<th>Action</th>
			</tr>
			$list_berobat
		</table>";

	mysqli_close($con);
?>

<div class="container mt-3">
	<h2>LIST BEROBAT</h2><br>
	<a href='index.php' class='btn btn-warning'>< Back</a><br><br>
	<?php echo $list_berobat ?>
</div>
</body>
</html>