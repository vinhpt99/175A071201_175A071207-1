<?php 
session_start();
//header('Location:./Daihocthuloi.php');
var_dump($_SESSION);
session_destroy();
header('Location:./Daihocthuyloi.php');
 ?>