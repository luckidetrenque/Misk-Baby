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

// if ($_REQUEST) {
  // Se define la consulta por defecto para traer los productos DESTACADOS
  $sql = "SELECT products.id, products.name, products.description, ROUND(products.sale_price, 0) AS price, brands.name AS Brand, categorys.name AS Category, subcategorys.name AS Subcategory FROM products INNER JOIN subcategorys ON products.subcategory_id = subcategorys.id INNER JOIN categorys ON subcategorys.category_id = categorys.id INNER JOIN brands ON products.brand_id = brands.id WHERE state = 'featured'";

  // Si se solicita desplegar una categoría se setea la consulta
  if (isset($_GET["category"])) {
    $category = cleanQuery($_GET["category"]);
    // $sql = "SELECT categorys.name AS Category, subcategorys.name AS Subcategory FROM categorys INNER JOIN subcategorys ON subcategorys.category_id = categorys.id WHERE category_id = $category";
    $sql = "SELECT products.id, products.name, products.description, ROUND(products.sale_price, 0) AS price, brands.name AS Brand, categorys.name AS Category, subcategorys.name AS Subcategory FROM products INNER JOIN subcategorys ON products.subcategory_id = subcategorys.id INNER JOIN categorys ON subcategorys.category_id = categorys.id INNER JOIN brands ON products.brand_id = brands.id WHERE category_id = $category";
  }

  // Si se solicitan los productos de una subcategoría se setea la consulta
  if (isset($_GET["subcategory"])) {
    $subcategory = cleanQuery($_GET["subcategory"]);
    $sql = "SELECT products.id, products.name, products.description, ROUND(products.sale_price, 0) AS price, brands.name AS Brand, categorys.name AS Category, subcategorys.name AS Subcategory FROM products INNER JOIN subcategorys ON products.subcategory_id = subcategorys.id INNER JOIN categorys ON subcategorys.category_id = categorys.id INNER JOIN brands ON products.brand_id = brands.id WHERE subcategory_id = $subcategory";
  }

  // Ejecuta una consulta a la DB y devuelve un array con el resultado
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
// }