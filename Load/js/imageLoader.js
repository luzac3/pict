function imageLoader(){
    // DBからデータを取得
    let result = call_stored("");

    let imageNum = result.length;

    if(100 < imageNum){
        // 複数ページを用意
    }

    for(let i = 0; i < imageNum; i++){
        let lineNumber = Math.floor(i / 4);

        if(i % 4 == 1){
            let clone = document.getElementById("pict_copy_base").cloneNode(true);
            clone.id = "pict_line" + lineNumber;
            document.getElementById("pict").appendChild(clone);
        }

        let line = document.getElementById("pict_line" + lineNumber);
        let wrapper = line.getElementByClassName("pict_wrapper")[(i % 4) - 1];
        // 現在の画像をセットするCanvasのラッパーにIDをセット
        wrapper.id = "pict_" + i;

        let canvas = wrapper.getElementByTagName("canvas")[0];
        canvas.className = result[i]["PCTR_CD"];

        let canvasWidth = wrapper.clientWidth;
        let canvasHeight = wrapper.clietnHeight;

        let image = new Image();
        image.onload = imageSetter(image, canvas, canvasWidth, canvasHeight);
        image.src = result[i]["PCTR"];
    }
}