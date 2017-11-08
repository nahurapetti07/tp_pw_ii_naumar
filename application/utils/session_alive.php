<?php

session_start();

if($_SESSION["user_logged"] != TRUE) {
		session_unset();
		session_destroy();
		header("Location: /");
}

?>