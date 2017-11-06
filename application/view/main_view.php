<div class="col s6">
    <h4>Ingrese</h4>
    <form action="/php/login.php" method="POST">
        <div class="row">
            <div class="input-field col s12">
                <input id="email" type="text" class="validate" name="txtUser">
                <label for="email">Usuario</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input id="password" type="password" class="validate" name="txtPassword">
                <label for="password">Contraseña</label>
            </div>
        </div>
        <!--<button class="btn waves-effect waves-light" type="submit" name="btnLogIn">Ingresar</button>-->
        <a class="btn waves-effect waves-light" href="/application/utils/session_login.php">Ingresar</a>
    </form>
</div>
<div class="col s6">
    <p>No tiene usuario?</p>
    <a  class="btn waves-effect waves-light" href="/pages/register.php" >Registrese</a>
    
</div>