<?php

/* associative arrays */
$descriptions = [
  'Earth' => 'mostly harmless',
  'Marvin' => 'the paranoid android'
];

$descriptions['Zaphod'] = 'President of the Imperial Galactic Government';

echo $descriptions['Marvin'];
echo '<br>';
echo '<pre>';
print_r($descriptions);
echo '</pre>';

//echo "Earth is described as $descriptions['Earth']"; -- this doesn't work

echo "Earth is described as {$descriptions['Earth']}";
