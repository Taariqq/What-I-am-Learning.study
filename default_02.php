<?php
/*
 * for PHP 5, a way to set default values, and for all versions as well
 */
$unit_cost = -0;

if (isset($unit_cost) && $unit_cost) {
  /*
   * what it says is if variable is set (to 0 or ' ') && if variable is
   * 'true' (2nd part checking for true/false).
   */
  $wholesale_price = $unit_cost;
  } else {
    $wholesale_price = 25;  
  }

echo $wholesale_price;
