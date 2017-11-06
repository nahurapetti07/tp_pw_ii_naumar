<?php
    //header("Location: /pages/confirm-register.php");
    $nro_dni = $_POST["txtDocReg"];;
    $tip_dni = "1";
    $tip_per = "1";

    $user = $_POST["txtUserReg"];
    $pass = $_POST["txtPasswordReg1"];

    
    $db = new mysqli("localhost","root", "", "pw_ii_tp_final");
    if ($db->connect_error) {
        die("Connect Error ({$db->connect_errno}) {$db->connect_error}");
    }
    $sql_persona = "INSERT INTO PERSONA(ID_Tipo_Persona, ID_Tipo_Documento, Num_Doc)
                    VALUES (?, ?, ?);";
    $inst_persona = $db->prepare($sql_persona);
    $inst_persona->bind_param("iii", $tip_per, $tip_dni, $nro_dni);
    $inst_persona->execute();

    $persona_id = $db->insert_id;

    echo "Persona " . $db->errno . " - " . $db->error;
    $inst_persona->close();
    $db->close();
    
    /////////////////////////

    $db = new mysqli("localhost","root", "", "pw_ii_tp_final");
    if ($db->connect_error) {
        die("Connect Error ({$db->connect_errno}) {$db->connect_error}");
    }
    $sql_empleado = "INSERT INTO EMPLEADO(ID_Empleado, ID_Usuario)
                     VALUES (?, ?);";
    $inst_empleado = $db->prepare($sql_empleado);
    $inst_empleado->bind_param("ii", $persona_id, $persona_id);
    $inst_empleado->execute();
    
    echo "\n Empleado " . $db->errno . " - " . $db->error;
    $inst_empleado->close();
    $db->close();

    //////////////////////////

    $db = new mysqli("localhost","root", "", "pw_ii_tp_final");
    if ($db->connect_error) {
        die("Connect Error ({$db->connect_errno}) {$db->connect_error}");
    }
    $sql_usuario = "INSERT INTO USUARIO(ID_Usuario, Usuario, PassWord, ID_Rol)
                    VALUES (?, ?, ?, ?);";
    $inst_usuario = $db->prepare($sql_usuario);
    $inst_usuario->bind_param("issi", $persona_id, $user, md5($pass), $tip_dni);
    $inst_usuario->execute();
    echo "\n Usuario " . $db->errno . " - " . $db->error;
    $inst_usuario->close();
    $db->close();

    header("Location: /pages/confirm-register.php");

?>