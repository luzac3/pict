function saveCanvas(ext, fileName, canvasId){
    /* エレメントの取得　*/
    const EXT = document.getElementById("ext").className;
    const FILE_NAME = document.getElementById("fileName").className;
    const CANVAS = document.getElementById("canvas");
    const SHT_ELEM = document.getElementById("sht");
    const SHT_OWN = document.getElementById("sht_own");
    const SBJCT_ELEM = document.getElementById("sbjct");
    const SBJCT_NONE = documen.getElementById("sbjct_none");

    let imageType = "image/" + EXT;

    // base64エンコードされたデータ
    const BASE64 = CANVAS.toDataURL(imageType);

    let evntNum = document.getElementById("EVNT_NUM").value;

    let tile = document.getElementById("title").value;

    let sht = "";
    let sbjctArr = [];

    if(title = ""){
        title = FILE_NAME;
    }

    if(!SHT_OWN.checked){
        sht = SHT_ELEM.getElementById("sht").value;
    }else{
        sht = document.getElementById("USER_NUM").value;
    }

    if(!SBJCT_NONE.checked){
        let sbjct_str = SBJCT_NONE.getElementById("sbjct").value;
        let sbjctArr = sbjct_str.split(",");
    }else{
        sbjctArr = null;
    }

    let argArr = {
        evntNum:evntNum
        ,BASE64:BASE64
        ,title:title
        ,ext:EXT
        ,sht:sht
    }

    // DB保存
    defaultAjax(argArr,"/pict/Save/php/dbUpload.php").then(function(no_arr){
        if(!sbjctArr){
            alert("保存完了");
            return;
        }

        let argArr2 = [];

        let num = 0;

        sbjctArr.forEach(function(sbjct){
            argArr[num] = {
                evntNum:evntNum
                ,PCT_NO:no_arr[0]["PCT_NO"]
                ,sbjct:sbjct
            }
        });

        defaultAjax(argArr2,"/pict/Save/php/setPictSbjct.php").then(function(result){
              console.log(no_arr);
              alert("保存完了");
        },function(){
            alert("被写体登録失敗");
        });
    },function(){
        alert("画像保存失敗");
    });
}
