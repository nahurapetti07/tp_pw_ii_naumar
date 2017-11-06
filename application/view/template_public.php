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
                <a href="#" class="brand-logo"><i class="large material-icons">local_shipping</i></a>
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