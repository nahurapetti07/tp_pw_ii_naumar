<?php

session_start();

if($_SESSION["logueado"] == TRUE) {

} else {
		header("Location: /index.php");
	}
?>