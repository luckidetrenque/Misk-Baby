<?php
header('Content-Type: application/json');
require_once "../config/config.php";
require_once "../helpers/functions.php";

// Conexión con el servidor MySQL y selección de la base de datos
$connection = new mysqli(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

// Verificar la conexion
if ($connection->connect_errno) {
  echo "No se puede conectar con la base de datos, vuelva a intentar mas tarde. Gracias: $connection->connect_error";
  die();
} else {
  $connection->set_charset("utf8mb4");
}

// Ejecuta una consulta a la DB y devuelve un array con el resultado
$sql = "SELECT categorys.id AS idCat, categorys.name AS Category, subcategorys.id AS idSub, subcategorys.name AS Subcategory FROM subcategorys INNER JOIN categorys ON subcategorys.category_id = categorys.id ORDER BY categorys.id, subcategorys.name";
$data = array();
$result = $connection->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $data[] = $row;
  }
}

// var_dump($data);

// Convertir el array en formato JSON para devolverlo a la petición ajax
$json = json_encode($data, JSON_UNESCAPED_UNICODE);
echo $json;