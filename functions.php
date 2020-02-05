<?php

$version = phpversion();

$name = 'DAVID';
echo $name . '<br>';
echo strtolower($name) . '<br>';
echo $name . '<br>';
/*
 * In order to assign the 'changed' value you need assign the value
 * back to the variable.
 */

$name = ucfirst(strtolower($name));
echo $name . '<br>';
/* return val of one fxn passed to second fxn as argument
 * 
 */