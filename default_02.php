<?php
/*
 * for PHP 5, a way to set default values, and for all versions as well
 */
$unit_cost = -4;

if (isset($unit_cost) && $unit_cost) {
  $wholesale_price = $unit_cost;
  } else {
    $wholesale_price = 25;  
    }

echo $wholesale_price;
