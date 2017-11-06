<?php

session_start();

if($_SESSION["logueado"] == TRUE) {

} else {
		session_unset();
		session_destroy();
		header("Location: /");
	}
?>