<?php

class Controller_Main extends Controller{
    function index(){
        $this->view->generate('main_view.php', 'template_public.php');
    }

    function logout(){
        header("Location: /application/utils/session_logout.php");
    }

    function login(){

        $Email = '';
        $Clave = '';
        $CargoCredenciales = false;
        $Nombre = '';
        $Apellido = '';

        if(isset($_POST['email']) && isset($_POST['password']))
		{
			$Email = $_POST['email'];
			$Clave = $_POST['password'];
			$CargoCredenciales = strlen(trim($Email) . trim($Clave)); 
        }
        
        include_once( $_SERVER['DOCUMENT_ROOT'].'application/model/model_user.php');

        if($CargoCredenciales > 0)
        {
            $Usuario = new user($Email, $Clave);
            $Existe_Usuario = $Usuario->validarUsuario();
            if($Existe_Usuario[0]["ID_Usuario"]){
                session_start();
                $_SESSION["user_logged"] = TRUE;
				$_SESSION['user_ID'] = $Existe_Usuario[0]["ID_Usuario"];
				$_SESSION['nombre'] = $Existe_Usuario[0]["Nombre"];
                $_SESSION['apellido'] = $Existe_Usuario[0]["Apellido"];
                header("Location: /");
                //$this->view->generate('home_view.php', 'template_private.php');                
            }
            else{
                header("Location: /");
            }

        }
        else
        {
            header("Location: /");
            exit();
        }
                
    }

    function home(){
        $this->view->generate('home_view.php', 'template_private.php');
    }
}