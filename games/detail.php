<?php

const INFO_TYPE_GAME_ID = 1;
const INFO_TYPE_GAME_PKG_NAME = 2;

function fetch_screenshots($game_id)
{
	$images[0] = "http://img1";
	$images[1] = "http://img2";
	$images[2] = "http://img3";
	return $images;
}

function get_game_detail($game_info, $info_type) 
{
	$con = mysql_connect("localhost","root","454xhc");
	
	$ret = new StdClass;
	
	if (!$con) {
		$ret->error_code = 1000;
		return $ret;
	}

	mysql_select_db("injoee_db", $con);
	
	if($info_type == INFO_TYPE_GAME_ID) {
		$sql = "SELECT * FROM games WHERE game_id = " . $game_info;
	} else {
		$sql = "SELECT * FROM games WHERE game_package_name = '" . $game_info . "'";
	}
	
	//echo "<br>" . $sql . "<br>";
	
	$result = mysql_query($sql);
	if (!$result) {
		$ret->error_code = 1000;
		return $ret;
	}

	$row = mysql_fetch_array($result);
	
	mysql_close($con);
	
	if (!$row) {
		$ret->error_code = 1000;
		return $ret;
	}
	$obj = new StdClass;
	$obj->game_id = (int)$row['game_id'];
	$obj->game_name = $row['game_name'];
	$obj->game_icon = $row['game_icon'];
	$obj->game_type = $row['game_type'];
	$obj->game_category = $row['game_category'];
	$obj->game_description = $row['game_description'];
	$obj->game_package_name = $row['game_package_name'];
	$obj->game_package_size = $row['game_package_size'] . "M";
	$obj->game_download_url = $row['game_download_url'];
	$obj->game_obb_pacakge_name = $row['game_obb_package_name'];
	$obj->game_obb_download_url = $row['game_obb_download_url'];
	$obj->game_screenshots = $row['game_screenshots'];
	$obj->game_good_votes = $row['good_votes'];	
	$obj->game_bad_votes = $row['bad_votes'];

	$ret = new StdClass;
	$ret->error_code = 0;
	$ret->game_detail = $obj;
	return $ret;
}

if(array_key_exists('id', $_GET)) {
	$game_info = $_GET['id'];
	$info_type = INFO_TYPE_GAME_ID;
	$ret = get_game_detail($game_info, $info_type);
} else if(array_key_exists('pkgname', $_GET)){
	$game_info = $_GET['pkgname'];
	$info_type = INFO_TYPE_GAME_PKG_NAME;
	$ret = get_game_detail($game_info, $info_type);
} else {
	$ret = new StdClass;
	$ret->error_code = 1000;
}

echo json_encode($ret);
?>
