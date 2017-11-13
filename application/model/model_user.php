<?php
	
	require_once 'DB.php';

	class user{
		private $Usr = "";
		private $Pwd = "";

		function __construct($Usr, $Pwd){
			$this->Usr = $Usr;
			$this->Pwd = $Pwd;
		}

		public function validarUsuario(){
			/*$strSQL = "SELECT * FROM Usuario LEFT JOIN WHERE Usuario = ? AND PASSWORD = MD5(?);";*/
			$strSQL = "SELECT
						  ID_Usuario,
						  Apellido,
						  Nombre
						FROM Usuarios 
						WHERE Email = ?
						    AND Clave = MD5(?);";
			return DB::getAssoc($strSQL, array($this->Usr, $this->Pwd));
		}

	}

	$usuario = new user("admin@naumar.com", "admin604");
	$Existe_Usuario = $usuario->validarUsuario();
	//echo var_dump($Existe_Usuario);
	if($Existe_Usuario[0]["ID_Usuario"])
		echo "Existe Usuario";
	else
		echo "NO Existe Usuario";
?>