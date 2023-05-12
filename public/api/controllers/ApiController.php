<?php
header('Content-Type: application/json');
require_once "../models/Product.php";
require_once "../helpers/functions.php";
if ($_REQUEST) {
  // Se define la consulta por defecto para traer los productos DESTACADOS
  $sql = "SELECT products.id, products.name, products.description, ROUND(products.sale_price, 0) AS price, brands.name AS Brand, categorys.name AS Category, subcategorys.name AS Subcategory FROM products INNER JOIN subcategorys ON products.subcategory_id = subcategorys.id INNER JOIN categorys ON subcategorys.category_id = categorys.id INNER JOIN brands ON products.brand_id = brands.id WHERE state = 'featured'";

  // Si se solicita desplegar una categoría se setea la consulta
  if (isset($_GET["category"])) {
    $category = cleanQuery($_GET["category"]);
    $sql = "SELECT categorys.name AS Category, subcategorys.name AS Subcategory FROM categorys INNER JOIN subcategorys ON subcategorys.category_id = categorys.id WHERE category_id = $category";
    // $sql = "SELECT products.id, products.name, products.description, ROUND(products.sale_price, 0) AS price, brands.name AS Brand, categorys.name AS Category, subcategorys.name AS Subcategory FROM products INNER JOIN subcategorys ON products.subcategory_id = subcategorys.id INNER JOIN categorys ON subcategorys.category_id = categorys.id INNER JOIN brands ON products.brand_id = brands.id WHERE category_id = $category";
  }

  // Si se solicitan los productos de una subcategoría se setea la consulta
  if (isset($_GET["subcategory"])) {
    $subcategory = cleanQuery($_GET["subcategory"]);
    $sql = "SELECT products.id, products.name, products.description, ROUND(products.sale_price, 0) AS price, brands.name AS Brand, categorys.name AS Category, subcategorys.name AS Subcategory FROM products INNER JOIN subcategorys ON products.subcategory_id = subcategorys.id INNER JOIN categorys ON subcategorys.category_id = categorys.id INNER JOIN brands ON products.brand_id = brands.id WHERE subcategory_id = $subcategory";
  }

  $json = new Product();
  echo $json->getProducts($sql);
}


// https://gabrieleromanato.wordpress.com/2011/05/28/php-ajax-and-the-mvc-pattern/
// https://victorroblesweb.es/2014/07/15/ejemplo-php-poo-mvc/