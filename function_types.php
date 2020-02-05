<?php
$number = 2;

// pass by value
/* function doubleIt($number) {
  return $number *= 2;
} */

// pass by ref
function doubleIt(&$num) {
  $num *= 2; // no need for 'return' bcs working directly with the var
}

$double = doubleIt($number);

echo '$doubled is ' . $double . '<br>';
echo '$number is ' . $number . '<br>';
var_dump($double); // $doubled is null bcs nothing returned