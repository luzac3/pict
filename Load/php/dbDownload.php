<?php
    $root = $_SERVER["DOCUMENT_ROOT"];
    require_once $root . '/pict/common/php/codeMaker.php';
    require_once $root . '/pict/common/php/call_stored.php';

    if(!empty($_POST["argArr"])){
        $argArr = $_POST["argArr"];
        $result = call_stored($argArr);

        $encrypt = new Encrypt();

        $imageArr = array();

        forEach($result as $row){
            $decrypted = $encrypt.decrypt($row["code"],$row["key"]);
            array_push($imageArr, $decrypted);
        }
        echo json_encode($imageArr);
    }
?>