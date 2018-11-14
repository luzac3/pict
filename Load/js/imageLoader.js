function imageLoader(){
    $("canvas").on("click",detailImage);

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

function detailImage(id){
    const ID = this.id;

    // 画像ロード
    let arg_arr = {
        id:ID.split("_")[1]
    }

    let result = defaultAjax(argArr,"/Load/php/detailDownload.php");

    let image = new Image();

    image.onload = function(){
        // Canvas部分にデータを読み込み
        image.onload = imageSetter(image, canvas, canvasWidth, canvasHeight);

        // Detail用画面表示
        // 要素を用意してサイズをあわせるポップアップ表示関数を呼び出し
        const detail = document.getElementById("detail_pict");

        detail.style.display = "block";
    }

    image.src = result[0]["PCTR"];
}

