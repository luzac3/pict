<?php
    $root = $_SERVER["DOCUMENT_ROOT"];
    require_once $root . '/pict/common/php/stored.php';

    if(!empty($_POST["argArr"])){
        $argArr = $_POST["argArr"];


        forEach($sbjctArr as $argArr){
            $sql = "('";
            $sql .= $sbjctArr["evntNum"];
            $sql .= "','";
            $sql .= $sbjctArr["PCT_NO"];
            $sql .= "','";
            $sql .= $sbjctArr["sbjct"];
            $sql .= "',NOW(3)";
            $sql .= ",NOW(3)";
            $sql = ")";
            $sql = ",";
        };

        $sql = substr($sql, 0, -1);

        $result = stored("setPictSbjct",$sql);

        echo json_encode($result);
    }else{
        echo json_encode(0);
    }
?>
