<?php
class dbconnect{

    private $handle;
    
    public function __construct() { 
       $this->handle = $this->connect();
    }

    public function connect(){
         $host = 'localhost';
         $user = 'root';
         $pass = '';
         $db = 'tp_pw_ii_naumar';
         $connection = mysqli_connect($host,$user,$pass,$db); 
         return $connection;
    }

    public function simple_select( $table , $where='' , $other='' ){
        if($where != '' ){
          $where = 'where ' . $where;
        }
        $sql = "SELECT * FROM  ".$table." " .$where. " " .$other;
        $result = mysqli_query($this->handle, $sql) or die(mysqli_error($this->handle));
        
        return $result;
    }

    public function prepare($query) {
        $stmt = mysqli_prepare($this->handle, $query) or die(mysqli_error($this->handle));

        return $stmt;
    }

    public function login( $username, $password ) {
		
        $hashedPassword = md5($password);
        $sql =  "SELECT * FROM usuarios WHERE Email = '$username' AND Clave = '$hashedPassword' ";
		$result = mysqli_query($this->handle, $sql);
		
		if ( mysqli_num_rows($result) == 1 ) {
            $row = mysqli_fetch_assoc($result);
            $_SESSION[ "user_first" ] = $row["Nombre"];
            $_SESSION[ "user_last" ] = $row["Apellido"];
            $_SESSION[ "user_id" ] = $row["ID_Usuario"];
            $_SESSION[ "user_rol" ] = $row["Rol_ID"];
            $_SESSION[ "user_logged" ] = TRUE;
			return true;
		} else {
			return false;
		}
	}
     
}