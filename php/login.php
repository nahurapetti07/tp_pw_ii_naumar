<?php

session_start();

$_SESSION["logueado"] = TRUE;

header("Location: /pages/home.php");
?>