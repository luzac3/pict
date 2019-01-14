function saveCanvas(ext, fileName, canvasId){
    let imageType = "image/" + ext;

    const CANVAS = document.getElementById(canvasId);

    // base64エンコードされたデータ
    const BASE64 = canvas.toDataURL(imageType);

    // base64をblob変換
    const BLOB = base64toBlob(BASE64, imageType);

    const OBJECT_URL = URL.createObjectURL(BLOB);

    let img = document.createElement("img");
    img.src = OBJECT_URL;

    return img;
    // document.getElementById("setter").appendChild(img);
}
