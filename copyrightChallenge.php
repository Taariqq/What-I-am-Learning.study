<?php
/*
 * create copyright date range function
 * soln: fxn should take "now" as the year argument
 */

function copyDate($beginningYear) {
  return $dateRange = "&copy; $beginningYear to " . date('Y');
  
}

echo copyDate(1977);



