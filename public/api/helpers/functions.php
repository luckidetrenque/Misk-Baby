<?php
// Función para limpiar strings
function cleanQuery($string)
{
  // Elimina espacios en blanco (u otro tipo de caracteres) del inicio y el final de la cadena
  $string = trim($string);
  // Retira las etiquetas HTML y PHP de una cadena
  $string = strip_tags($string);
  // Convierte caracteres especiales en entidades HTML
  $string = htmlspecialchars($string);
  // Si están activas las magic_quotes revierte su acción mediante stripslashes
  // if (get_magic_quotes_gpc()) {
  //   $string = stripslashes($string);
  // }
  // Escapa los caracteres especiales de una cadena para usarla en una sentencia SQL
  $string = (!is_numeric($string)) ? $mysqli->real_escape_string($string) : $string = (int) $string;
     if (!is_numeric($string)) {
    $string = $mysqli->real_escape_string($string);
  } else {
    $string = (int) $string;
  }
  return ($string);
}