function saveCanvas(ext, fileName, canvasId){
    let imageType = "image/" + ext;

    const CANVAS = document.getElementById(canvasId);

    // base64エンコードされたデータ
    const BASE64 = canvas.toDataURL(imageType);

    let argArr = {
        BASE64:BASE64
        ,fileName:fileName
        ,code:""
        ,key:""
    }

    let img = document.createElement("img");
    img.src = OBJECT_URL;
    document.getElementById("setter").appendChild(img);

    // DB保存
    defaultAjax(argArr,"/pict/Save/php/dbUpload.php").then(function(data){
        console.log(data);
        alert("保存完了");
    });
}
