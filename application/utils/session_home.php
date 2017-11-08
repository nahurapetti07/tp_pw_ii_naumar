<?php

session_start();

if(isset($_SESSION["user_logged"])) {
		header("Location: /main/home");
}else{
    session_destroy();
}

?>