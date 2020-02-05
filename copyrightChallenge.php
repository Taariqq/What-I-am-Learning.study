<?php
/*
 * create copyright date range function
 * soln: fxn should take "now" as the year argument
 */

function copyDate($beginningYear) {
 echo $dateRange = "&copy; $beginningYear to " . date('Y');
  
}

copyDate(1977);



