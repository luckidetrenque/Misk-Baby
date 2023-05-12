<?php
require_once "../config/config.php";
class Database
{
  // Connection with the database
  public function getConnection()
  {
    // Conexion el servidor MySQL y seleccion de la base de datos
    $connection = new mysqli(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

    if ($connection->connect_errno) {
      echo "No se puede conectar con la base de datos, vuelva a intentar mas tarde. Gracias: $connection->connect_error";
      die();
    }
    return $connection->set_charset("utf8mb4");
  }
  // Disconnection with the database
  public function getDisconnection()
  {
    if (isset($connection)) {
      return $connection->close();
    }
  }
  //Ejecuta una consulta a la DB y devuelve un array con el resultado
  public function getData($sql)
  {
    $data = [];
    $connection = $getConnection();

    $result = $connection->query($sql);
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
        $data[] = $row;
      }
    }
    $result->free();
    $connection->getDisconnection();
    // Convertir el array en formato JSON para devolverlo a la petición ajax
    return json_encode($data, JSON_UNESCAPED_UNICODE);
  }
}

$conn = New Database();

$conn->getData("SELECT products.id, products.name, products.description, ROUND(products.sale_price, 0) AS price, brands.name AS Brand, categorys.name AS Category, subcategorys.name AS Subcategory FROM products INNER JOIN subcategorys ON products.subcategory_id = subcategorys.id INNER JOIN categorys ON subcategorys.category_id = categorys.id INNER JOIN brands ON products.brand_id = brands.id WHERE subcategory_id = 1");
echo $conn;
