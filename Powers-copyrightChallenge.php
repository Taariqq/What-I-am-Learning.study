<?php
/*
 * create copyright date range function
 * soln: fxn should take "now" as the year argument
 */

function copyDate($beginningYear) {
  $currentYear = date('Y');
  if ($beginningYear < $currentYear) {
    return "&copy; $beginningYear &ndash; $currentYear";
  } else {
    return "&copy; $beginningYear";  
  }
}
/*
 * I did not have to re-declare "$currentYear" inside it 'if'.
 * This is opposite to what David Powers did.
 */

echo copyDate(1977);



