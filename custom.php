<?php

echo lyn_convertToMinutes(509) . '<br>';

function lyn_convertToMinutes($seconds) {
  $sec = $seconds % 60;
  if (function_exists('intdiv')) {
    $min = intdiv($seconds, 60);
  } else {
    $min = ($seconds - $sec) / 60;
  }
  // to strip negative from seconds only
  $sec = abs($sec);
  $sec = ($sec < 10) ? '0' . $sec : $sec;
  return "$min:$sec";
}

echo lyn_convertToMinutes(-547);
