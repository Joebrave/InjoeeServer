<?php

$game_id = $_GET['id'];
$vote_type = $_GET['type'];

$con = mysql_connect("localhost","root","454xhc");

if (!$con) {
	$ret->error_code = 1000;
	echo json_encode($ret);
	return;
}

mysql_select_db("injoee_db", $con);

if($vote_type == "bad") {
	$field = "bad_votes";
} else {
	$field = "good_votes";
}

$sql = "UPDATE games SET " . $field . " = " . $field . " + 1 WHERE game_id = " . $game_id;

$result = mysql_query($sql);

mysql_close($con);

if(!$result) {
	$ret->error_code = 1000;
} else {
	$ret->error_code = 0;
}

echo json_encode($ret);

?>
