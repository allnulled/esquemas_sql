<?php

$modulos_cargados = array(
    "autentificacion.sql",
    "blog.sql"
);

$get_path = function($path) {
    return dirname(__FILE__)."/".$path;
};

$sql = "";

foreach($modulos_cargados as $modulo) {
    $sql .= file_get_contents($get_path("modulos/{$modulo}")) . "\n";
}

echo "<pre>$sql</pre>";

?>