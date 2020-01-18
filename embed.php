<?php
/*
 * Challenge: use the following arrays to create the content of the page. Embed PHP in the html to create the main heading and the first paragraph.
 * Below the second heading, create an unordered list to display the names of the 5 main characters.
 */
$book = [
    'title' => "The Hitchhiker's Guide to the Galaxy",
    'author' => 'Douglas Adams',
    'description' => 'a comedy sci-fi adventure originally based on a BBC radio series'
];
$characters = [
    'Arthur Dent',
    'Ford Prefect',
    'Zaphod Beeblebrox',
    'Marvin, the paranoid android',
    'Slartibartfast'
];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Challenge: Embed in HTML</title>
    <link href="stylesEmbed.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1><?= $book['title'].' by ' .$book['author']; ?></h1>
<!-- alternatively -->
<h1><?= "{$book['author']} by {$book['title']}"; ?></h1>
<p>"A book about <?= $book['description']; ?>"</p>
<h2>Main Characters</h2>
<?php
echo '<ul>';
echo "<li> $characters[0] </li>";
echo '<li>'.$characters[1].'</li>';
echo "<li> $characters[2] </li>";
echo "<li> $characters[3] </li>";
echo "<li> $characters[4] </li>";
echo '</ul>';
?>

</body>
</html>