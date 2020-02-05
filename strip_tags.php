<?php

$input = "<p>Hi, there! <script>alert('Gotcha!');</script>. <a href='http://www.lynda.com/PHP-training-tutorials/282-0.html'>Expand your PHP skills</a>.";

echo strip_tags($input);
echo strip_tags($input, '<p><a>'); 
/*
 * keeping optional tags from stripping
 */