<?php
    $root = $_SERVER["DOCUMENT_ROOT"];
    require_once $root . '/pict/common/php/codeMaker.php';
    require_once $root . '/pict/common/php/stored.php';

    if(!empty($_POST["argArr"])){
        $argArr = $_POST["argArr"];
        $encrypt = new Encrypt();

        $encryptArr = $encrypt -> encrypt($argArr["blob"]);

        $argArr["code"] = $encryptArr[0];
        $argArr["key"] = $encryptArr[1];

        $result = call_stored($argArr);

        echo json_encode($result);
    }else{
        echo json_encode(0);
    }
?>