<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Solution: using loops</title>
    <link href="stylesMultiplication.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <h1>Multiplication Table</h1>
    <table>
      <?php
      // generate first row of headers

      echo '<tr>';
      echo '<th> &nbsp; </th>';
      for ($headRow = 1; $headRow <= 12; $headRow++) {
        echo '<th>' . $headRow . '</th>';
      }
      echo '</tr>';

      // now, nested loops to generate th and tr
      echo '<tr>';
      for ($headCol = 1; $headCol <= 12; $headCol++) {
        echo '<th>' . $headCol . '</th>';
        for ($tdata = 1; $tdata <= 12; $tdata++) {
          echo '<td>' . $tdata * $headCol . '</td>';
        }
        echo '</tr>';
      }
      ?>
    </table>
  </body>
</html>