<?php
//$unit_cost = 0;

$wholesale_price = $unit_cost ?? $none ?? 25;

echo $wholesale_price;

/*
 * NULL coalesce operator can be chained!
 */
echo '<br>';

echo phpinfo();
