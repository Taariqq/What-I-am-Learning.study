<?php
// Convert $total_minutes to hours and minutes.

$total_minutes = 640;
$minutes = $total_minutes % 60;

/*
 * if remainder is 18 that means 300 min remaining needs to be converted
 * to hours
 */
$total_hours = ($total_minutes - $minutes ) / 60;

echo "Time taken was $total_hours hours $minutes minutes";
