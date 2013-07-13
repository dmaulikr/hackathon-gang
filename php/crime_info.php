<?php


header("Content-Type:application/json");


define('SERVER', 'db479373705.db.1and1.com');
define('USERNAME', 'dbo479373705');
define('PASSWORD', '<ENTER PASSWORD>');
define('DATABASE', 'db479373705');

//Connect to MySQL
$connection = @mysql_connect(SERVER, USERNAME, PASSWORD) or die('Connection error -> ' . mysql_error());
mysql_select_db(DATABASE, $connection) or die('Database error -> ' . mysql_error());



$longitude = $_GET['longitude'];
$latitude = $_GET['latitude'];
$miles = $_GET['miles'];

$sql = mysql_query("SELECT *, ( 3959 * acos( cos( radians('$latitude') ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians( latitude ) ) ) ) AS distance FROM crimes HAVING distance < '$miles' ORDER BY distance LIMIT 0 , 20");


$array = array();
while ($u = mysql_fetch_assoc($sql)) {
	$array[] = $u;
}

print json_encode($array);

?>