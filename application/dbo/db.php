<?php

    class DB
    {
        const server = "localhost";
        const usr = "root";
        const pwd = "";
        const bdd = "tp_pw_ii_naumar";
        //const bdd = "pw_ii_tp_final";
        static private $con;

        static private function cnnOpen()   //Pasaje por Referencia de la Conexion/BdD
        {
            try
            {
                self::$con = new mysqli(self::server, self::usr, self::pwd, self::bdd);
            }
            catch (Exception $e)
            {
                echo 'Excepción capturada: ',  $e->getMessage(), "\n";
            }
        }

        static private function cnnClose()
        {
            try
            {
                self::$con->Close();
            }
            catch (Exception $e)
            {
                echo 'Excepción capturada: ',  $e->getMessage(), "\n";
            }
        }

        static private function cmdSQL($strSQL, $a_bind_params)
        {
            //$a_bind_params is the array of the parameters you want to bind
            //$a_param_type is an array with the type of each parameter (Types: s = string, i = integer, d = double, b = blob). 
            //This is another disadvantage of MySQLi API. You have to maintain this array some way in your application. 
            $s_param_type = "";
            $cant_bind_params = count($a_bind_params);
            for($i = 0; $i < $cant_bind_params; $i++) {
              $s_param_type .= 's';
            }
            $a_param_type = str_split($s_param_type);

            /* Bind parameters. Types: s = string, i = integer, d = double,  b = blob */
            $a_params = array();
            $param_type = '';
            $n = count($a_param_type);
            for($i = 0; $i < $n; $i++) {
              $param_type .= $a_param_type[$i];
            }
            /* with call_user_func_array, array params must be passed by reference */
            $a_params[] = & $param_type;
            
            //Array de Parametros a Bindear: $a_bind_params
            $n = count($a_bind_params);
            for($i = 0; $i < $n; $i++) {
              /* with call_user_func_array, array params must be passed by reference */
              $a_params[] = & $a_bind_params[$i];
            }
             
            /* Prepare statement */
            self::cnnOpen();
            $stmt = self::$con->prepare($strSQL);
            if ($stmt == false) {
                throw new Exception('Error: ' . self::$con->errno . ' - ' . self::$con->error);
            }
            /* use call_user_func_array, as $stmt->bind_param('s', $param); does not accept params array */
            call_user_func_array(array($stmt, 'bind_param'), $a_params);
             
            /* Execute statement */
            //echo var_dump($stmt) . "<br>";
            $stmt->execute();
            return $stmt;

        }

        static public function getAssoc($strSQL, $a_bind_params)
        {
            try
            {
                //return self::cmdSQL($strSQL, $a_bind_params)->get_result()->fetch_all(MYSQLI_ASSOC);
                //echo var_dump($strSQL . " " . $a_bind_params) . "<br>";
                return self::cmdSQL($strSQL, $a_bind_params)->get_result()->fetch_all(MYSQLI_ASSOC);
            }
            catch (Exception $e)
            {
                echo 'Excepción capturada: ',  $e->getMessage(), "\n";
            }
        }

        static public function cmdNonQuery($strSQL, $a_bind_params)
        {
            $result = self::cmdSQL($strSQL, $a_bind_params);
            if(ISSET($result->errno))
                return 'Error: ' . $result->errno . ' - ' . $result->error;
            else
                return true;
        }

    }

?>