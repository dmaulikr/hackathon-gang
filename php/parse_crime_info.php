<?php

define('SERVER', 'db479373705.db.1and1.com');
define('USERNAME', 'dbo479373705');
define('PASSWORD', 'sav99786');
define('DATABASE', 'db479373705');

//Connect to MySQL
$connection = @mysql_connect(SERVER, USERNAME, PASSWORD) or die('Connection error -> ' . mysql_error());
mysql_select_db(DATABASE, $connection) or die('Database error -> ' . mysql_error());

$contents = file_get_contents("http://data.cityofchicago.org/resource/a95h-gwzm.json");
$json = json_decode($contents);
foreach ($json as $object) {
	$primary_type = $object->primary_type;
	$location_description = $object->location_description;
	$date = $object->date;
	$description = $object->description;
	$location = $object->location;
	if ($location) {
		$longitude = $location->longitude;
		$latitude = $location->latitude;
	} else {
		continue;
	}

	$sql = "INSERT INTO crimes (primary_type, location_description, date, description, latitude, longitude) VALUES ('$primary_type', '$location_description', '$date', '$description', '$latitude', '$longitude')";
			if (!mysql_query($sql)) {
			die('Error: ' . mysql_error());
	 	}	
	
}

?>