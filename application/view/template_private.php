<?php
    require_once 'application/utils/session_alive.php';
?>

<!DOCTYPE html>
<head>
    <?php
        include 'application/view/template_head.php';
    ?>
</head>
<body>
    <header>
        <nav class="blue darken-1">
            <div class="nav-wrapper container">
            <a href="#" class="brand-logo right"><i class="large material-icons">local_shipping</i></a>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href="#">Inicio</a></li>
                <li><a href="/product/listproduct">Productos</a></li>
                <li><a href="/main/logout">Salir</a></li>
            </ul>
            </div>
        </nav>
    </header>
    <main>
        <div class="section">
        </div>
        <div class="container">
            <div class="row">
        
            <?php //  ******** PHP *********  //
                include 'application/view/'.$content_view;
            ?>

            </div>
        </div>
    </main>
    <footer class="page-footer blue darken-1">
        <?php
            include 'application/view/template_footer.php';
        ?>
    </footer>
</body>
</html>