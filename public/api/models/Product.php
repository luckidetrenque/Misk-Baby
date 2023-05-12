<?php
require_once "../libraries/Database.php";
class Product
{
    public function getProducts($sql)
    {
      // Ejecuta una consulta a la DB y devuelve un array o un objeto con el resultado
      try {
        $db = Database::getConnection();
        $data = [];
        $data = Database::getData($sql);
        $db = Database::getDisconnection();
        return $data; // Retorna los datos en un array JSON
      } catch (Exception $e) {
        die($e->getMessage());
      }
    }
}
