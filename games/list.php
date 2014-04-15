<?php
function get_games($start, $count)
{
	$con = mysql_connect("localhost","root","454xhc");
	
	if (!$con) {
		$ret->error_code = 1000;
		return $ret;
	}

	mysql_select_db("injoee_db", $con);

	$sql_total = "SELECT count(*) FROM games";
	$total_ret = mysql_query($sql_total);
	$total_row = mysql_fetch_array($total_ret);
	$total = (int)$total_row[0];

	/*echo "total: " . $total;*/
	$sql = "SELECT * FROM games LIMIT " . $start . "," . $count;
	$result = mysql_query($sql);

	$i = 0;	
	while($row=mysql_fetch_array($result)) {
		$jarray[$i] = new StdClass;
		$jarray[$i]->game_id = (int)$row['game_id'];
		$jarray[$i]->game_name = $row['game_name'];
		$jarray[$i]->game_icon = $row['game_icon'];
		$jarray[$i]->game_type = $row['game_type'];
		$jarray[$i]->game_category = $row['game_category'];
		$jarray[$i]->game_package_name = $row['game_package_name'];
		$jarray[$i]->game_package_size = $row['game_package_size'] . "M";
		$jarray[$i]->game_download_url = $row['game_download_url'];
		$jarray[$i]->game_obb_pacakge_name = $row['game_obb_package_name'];
		$jarray[$i]->game_obb_download_url = $row['game_obb_download_url'];
		
		$i++;
	}
	mysql_close($con);
	
	if(is_null($jarray)) {
		$ret->error_code = 1000;
		return $ret;
	}
	
	$ret = new StdClass;
	$ret->error_code = 0;
	$ret->games = $jarray;
	$ret->total = $total;
	return $ret;
}

$start = $_GET['start'];
$count = $_GET['count'];

$ret = get_games($start, $count);

echo json_encode($ret);
?>
