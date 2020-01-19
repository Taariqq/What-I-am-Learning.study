<?php

$unit_cost = 20;
  
$wholesale_price = $unit_cost ?: 25;
  
echo $wholesale_price;

/*
 * FLAWS with this technique. If $unit_cost = 0 it evaluates to false!
 * #2 - if $unit_cost is not present it would produce a warning.
 * #3 - there are more robust solutions.
 * 
 * DO USE ternary to assign different values to a variable. Good idea.
 */