<?php
/*
 * BLOBの暗号化処理と暗号解除処理を行う
 */
class Encrypt{
    private $key = "";
    private $keyLength = 0;

    function __construct(){
        $this->keyLength = rand(10,16);
        $this->key = substr(base_convert(md5(uniqid()), 16, 36), 0, $this->keyLength);
    }

    public function encrypt($str){
        $code = openssl_encrypt($str, 'AES-128-ECB', $this->key);
        return array($code, $this->key);
    }
    public function decrypt($code, $key){
        return openssl_decrypt($code, 'AES-128-ECB', $key);
    }
}

?>