function saveCanvas(ext, fileName, canvasId){
    let imageType = "image/" + ext;

    const CANVAS = document.getElementById(canvasId);

    // base64エンコードされたデータ
    const BASE64 = canvas.toDataURL(imageType);

    // base64をblob変換
    const BLOB = base64toBlob(BASE64, imgeType);

    let arg_arr = {
        blob:BLOB
        ,fileName:fileName
        ,code:""
        ,key:""
    }

    const URL = URL.createObjectURL(BLOB);

    let img = document.getElementById("setter").appendChild(img);
    img.src = url;
    document.getElementById("setter").appendChild(img);

    // DB保存
}