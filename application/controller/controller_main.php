<?php

class Controller_Main extends Controller{
    function index(){
        $this->view->generate('main_view.php', 'template_public.php');
    }

    function logout(){
        header("Location: /application/utils/session_logout.php");
    }

    function login(){
        $username = $_POST['username'];
        $password = $_POST['password'];
                
    }

    function home(){
        $this->view->generate('home_view.php', 'template_private.php');
    }
}