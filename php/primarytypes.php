<?php

define('SERVER', 'db479373705.db.1and1.com');
define('USERNAME', 'dbo479373705');
define('PASSWORD', '<ENTER PASSWORD>');
define('DATABASE', 'db479373705');

//Connect to MySQL
$connection = @mysql_connect(SERVER, USERNAME, PASSWORD) or die('Connection error -> ' . mysql_error());
mysql_select_db(DATABASE, $connection) or die('Database error -> ' . mysql_error());



$latitude = $_GET['longitude'];
$longitude = $_GET['latitude'];
$miles = $_GET['miles'];

$sql = mysql_query("SELECT DISTINCT(primary_type) FROM crimes");


$array = array();
while ($u = mysql_fetch_assoc($sql)) {
	$array[] = $u;
}

print json_encode($array);

?>