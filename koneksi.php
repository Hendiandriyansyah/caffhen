<?php
// error_reporting(0);
$koneksi = mysqli_connect("localhost", "root", "", "ukk_kasir_bag02");
if (!$koneksi) {
    echo "<h1 align='center'>Database tidak terhubung!</h1>";
    exit();
}
