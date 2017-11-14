<?php
	
	require_once $_SERVER['DOCUMENT_ROOT'].'application/dbo/db.php';

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

	
?>