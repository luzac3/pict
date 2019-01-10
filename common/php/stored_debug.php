<?php
function stored($stored_cd,$arr_arg = null){
    require_once (dirname(__FILE__) . "/conection.php");
    $mysqli = db_connect ();

    // ストアドプロシージャ呼び出し構文生成
    $sql = "CALL ";
    $sql .= $stored_cd . "(";
    if(!is_null($arr_arg)){
        foreach($arr_arg as $key => $val){
            $sql .= "?,";
        }
    }
    $sql .= "@exit_cd)";

    // sql構文をセット
    $stmt = $mysqli->prepare($sql);

    $stmt->bind_param('ssss', $para1,$para2,$para3,$para4);

    $para1 = $arr_arg[0];
    $para2 = $arr_arg[1];
    $para3 = $arr_arg[2];
    $para4 = $arr_arg[3];

    $stmt->execute();

    $data_array = fetch_all($stmt);

    // 接続を閉じる
    $stmt -> close();
/*
    }else{
        if($mysqli -> query($sql)){
            $result = $mysqli -> query("SELECT @exit_cd AS exit_cd");
            if($ret_data["exit_cd"] != 0){
                return $ret_data["exit_cd"];
            }
            while ($row = $result->fetch_assoc()) {
                $data_array [] = $row;
            }
            // 結果セットを閉じる
            $result -> close();

            $ret_data = $data_array[0];
        }else{
            // エラーメッセージ
        }
    }
*/

    // 結果セットを閉じる
    // $result -> close();

    $stmt = null;
    $sql = null;

    return $ret_data;
}

function fetch_all(& $stmt) {
	$hits = array();
	$params = array();
	$meta = $stmt->result_metadata();
	while ($field = $meta->fetch_field()) {
		$params[] = &$row[$field->name];
	}
	call_user_func_array(array($stmt, 'bind_result'), $params);
	while ($stmt->fetch()) {
		$c = array();
		foreach($row as $key => $val) {
			$c[$key] = $val;
		}
		$hits[] = $c;
	}
	return $hits;
}
?>
