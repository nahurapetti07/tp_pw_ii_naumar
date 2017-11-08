<?php

session_start();

$_SESSION["user_logged"] = TRUE;

header("Location: /");
/*
	$Usuario = '';
	$Clave = '';
	$CargoCredenciales = false;
	$Nombre = '';
    $Apellido = '';
    
	//if(isset($_POST['btnLogIn']))
	//{

		if(isset($_POST['txtUser']) && isset($_POST['txtPassword']))
		{
			$Usuario = $_POST['txtUser'];
			$Clave = $_POST['txtPassword'];
			$CargoCredenciales = strlen(trim($Usuario) . trim($Clave)); 
        }
        

		if($CargoCredenciales > 0)
		{
			$db = new mysqli("localhost","root", "", "pw_ii_tp_final");
			// make sure the above credentials are correct for your environment
			if ($db->connect_error) {
				die("Connect Error ({$db->connect_errno}) {$db->connect_error}");
            }
            
            ////
            $sql = "SELECT 
                        Per.Nombre_RS AS Nombre, 
                        Per.Apellido AS Apellido,  
                        Usu.Usuario AS Usuario 
                    FROM 
                        Persona AS Per 
                            LEFT JOIN Empleado AS Emp ON Emp.ID_Empleado = Per.ID_Persona 
                            LEFT JOIN Usuario AS Usu ON Usu.ID_Usuario = Emp.ID_Usuario 
                    WHERE 
                        Usu.Usuario = ? AND Usu.PassWord = MD5(?);";

            $inst = $db->prepare($sql);
            $inst->bind_param("ss", $Usuario, $Clave);
            $inst->execute();
            $result = $inst->get_result();
            
			if (mysqli_num_rows($result)) 
			{
				$row = $result->fetch_assoc();
				$Usuario = $row['Usuario'];
				$Nombre = $row['Nombre'];
				$Apellido = $row['Apellido'];

				$_SESSION['usuario'] = $Usuario;
				$_SESSION['nombre'] = $Nombre;
				$_SESSION['apellido'] = $Apellido;
				$_SESSION["logueado"] = TRUE;
				header("Location: /product/listProduct");
				exit();

			}
			else
			{
                header("Location: /");
                
				exit();
			}
		}
		else
		{
			header("Location: /");
            			exit();
		}
				
	//}else{ echo "Hola";}
*/
?>