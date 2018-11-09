<?php
/*
 * BLOBの暗号化処理と暗号解除処理を行う
 */
class Encrypt{
    private $key = "";
    private $keyLength = 0;

	function __construct(){
        $keyLength = rand(10,16);
        $key = substr(base_convert(md5(uniqid()), 16, 36), 0, $keyLength);
    }

    public function encrypt($str){
        $code = openssl_encrypt($str, 'AES-128-ECB', $key);
        return array($code, $key);
    }
    public function decrypt($code, $key){
        return openssl_decrypt($code, 'AES-128-ECB', $key);
    }
}

?>