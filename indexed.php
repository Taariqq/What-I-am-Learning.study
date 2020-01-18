<?php
/*
 * indexed arrays
 */

//$characters = array('Arthur Dent', 'Ford Prefect', 'Zaphod Beelbebrox');
$characters = ['Arthur Dent', 'Ford Prefect', 'Zaphod Beelbebrox'];

//echo $characters; 

$characters[] = 'Marvin';
$characters[] = 'Slartybartfast';

print_r($characters);
echo '<br>';
echo $characters[1];
