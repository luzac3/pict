/*
 * @param rate:比率
 * @param obj: オブジェクト
 * @param asWidth: アスペクト幅
 * @param asHeight: アスペクト高さ
 */

function sizeSet(rate, obj, asWidth, asHeight){
    const wWidth = window.width;
    const wHeight = window.height;

    let firstWidth = 1;
    let firstHeight = 1;

    let setRate = 0;

    if(asWidth && asHeight){
        firstWidth = asWidth;
        firstHeight = asHeight;
    }else if(obj.naturalWidth && obj.naturalHeight){
        firstWidth = obj.naturalWidth;
        firstHeight = obj.naturalHeight;
    }

    if(window.width / firstWidth < window.height / firstHeight){
        setRate = (window.width * rate) / firstWidth;
    }else{
        setRate = (window.height * rate) / firstHeight;
    }

    obj.style.width = firstWidth * setRate;
    obj.style.height = firstHeight * setRate;
}