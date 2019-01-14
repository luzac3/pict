<?php
    $root = $_SERVER["DOCUMENT_ROOT"];
    require_once $root . '/pict/common/php/codeMaker.php';
    require_once $root . '/pict/common/php/stored.php';

    if(!empty($_POST["argArr"])){
        $argArr = $_POST["argArr"];

        $binary = base64_decode($argArr["BASE64"]);

        $encrypt = new Encrypt();

        $encryptArr = $encrypt -> encrypt($binary);

        $postArgArr = array(
          $argArr["evntNum"]
          ,$argArr["title"]
          ,$argArr["sht"]
          ,$encryptArr[0]
          ,$encryptArr[1]
          ,$argArr["ext"]
        );

        $result = stored("uploadPict",$postArgArr);

        echo json_encode($result);
    }else{
        echo json_encode(0);
    }
?>
