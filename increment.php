<?php
$number = 5;
echo $number++ . '<br>';
echo $number . '<br>';
++$number;
echo $number . '<br>';

$result = $number++ * 2;
echo '$result is ' . $result . '<br>';
echo 'but the $number now is ' . $number. '<br>';
// duplicated w/ pre-increment
$result = ++$number * 2;
echo '$result is ' . $result . '<br>';
echo 'but the $number now is ' . $number. '<br>';
