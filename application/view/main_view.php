<div class="col s6">
    <h4>Ingrese</h4>
    <form action="/main/login" method="POST">
        <div class="row">
            <div class="input-field col s12">
                <input id="email" type="text" class="validate" name="email">
                <label for="email">Usuario</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input id="password" type="password" class="validate" name="password">
                <label for="password">Contraseña</label>
            </div>
        </div>
        <button class="btn waves-effect waves-light" type="submit" name="btnLogIn">Ingresar</button>
        <!--<a class="btn waves-effect waves-light" href="/main/login">Ingresar</a>-->
    </form>
</div>
<div class="col s6">
    <p>No tiene usuario?</p>
    <a  class="btn waves-effect waves-light" href="/pages/register.php" >Registrese</a>
    
</div>