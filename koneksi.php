<?php

$koneksi = mysqli_connect('localhost', 'root', '', 'db_inventariss');

if (!$koneksi) {
    die ("Koneksi gagal dijalankan" . mysqli_connect_error());
}

?>