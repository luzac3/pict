function imageSetter(image, canvasObj, canvasWidth = 0, canvasHeight = 0){

    const ctx = canvasObj.getContext("2d");

    if(!canvasWidth && !canvasHeight){
        let imageWidth = image.naturalWidth;
        let imageHeight = image.naturalHeight;
        canvasObj.width = image.Width;
        canvasObj.height = image.Height;
    }else{
        canvasObj.width = canvasWidth;
        canvasObj.height = canvasHeight;
    }

    ctx.fillStyle = "gray";
    ctx.fillRect(0,0,300,300);

    ctx.drawImage(image,0,0);
}