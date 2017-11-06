<?php

class Route
{
    static function start(){
        $routes = Route::parseRoutes();
        $moduleName = Route::extractModuleName($routes);
        $action = Route::extractActionName($routes);

        $controller = Route::createController($moduleName);
        Route::executeActionFromController($controller, $action);
    }

    private static function parseRoutes(){
       return explode('/', $_SERVER['REQUEST_URI']);
    }

    private static function extractModuleName($routes){
        return !empty($routes[1]) ? $routes[1] : "main";
    }

    private static function extractActionName($routes){
        return !empty($routes[1]) ? $routes[2] : "index";
    }

    private static function createController($moduleName){
        $controllerName = 'Controller_' . $moduleName;
        $controllerFile = strtolower($controllerName) . '.php';
        $controllerPath = "application/controller/" . $controllerFile;

        $controller = false;

        if (file_exists($controllerPath)) {
            include $controllerPath;
            $controller = new $controllerName;

            $model = Route::createModel($moduleName);
            if( $model ){
                $controller->model = $model;
            }
        }

        return  $controller;
    }

    private static function createModel($controllerName){
        $model = false;

        $modelName = 'Model_' . $controllerName;
        $modelFile = strtolower($modelName) . '.php';
        $modelPath = "application/model/" . $modelFile;

        if (file_exists($modelPath)) {
            include $modelPath;
            $model = new $modelName;
        }

        return $model;
    }

    private static function executeActionFromController($controller, $action)
    {
        if (method_exists($controller, $action)) {
            //Ejecuto el metodo
            $controller->$action();
        } else {
            Route::ErrorPage404();
        }
    }

    function ErrorPage404(){
        $host = 'http://'.$_SERVER['HTTP_HOST'].'/';
        header('HTTP/1.1 404 Not Found');
        header("Status: 404 Not Found");
        header('Location:'.$host.'404');
        exit();
    }
}