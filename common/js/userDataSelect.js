function userDataSelect(){
    if(this.classList.contains("gray")){
        // 背景を元に戻す
        this.classList.remove("gray");
    }else{
        // 背景をグレーに変更
        this.classList.add("gray");
    }

    let dcCount = fnDcCount()();
    let storagedObject = storageObject()();

    if(storagedObject == this){
        if(dcCount > 1){
            // okボタンを押したときに動く関数を呼び出す
        }
    }else{
        storageObject(this);
    }

    setTimeout(function(){
        // 参照を削除
        storagedObject = null;
        dcCount = null;
    },1000);

    function fnDcCount(){
        let dcCount = 0;
        return function(){
            return dcCount++;
        }
    }

    function storageObject(obj){
        if(obj){
            this.selectedObject = obj;
        }

        return function(){
            return this.selectedObject;
        }
    }
}

function userDataOnMouse(){
    // 背景を黒に変更
    this.classList.add("black");
    // 文字色を白に変更
    this.classList.add("wordWhite");
}

function userDataDropMouse(){
    // 背景を元に戻す
    this.classList.remove("black");
    // 文字色を元に戻す
    this.classList.remove("wordWhite");
}

function clearUserDataSelect(except = null){
    // 除外したデータを除き全ての項目を非選択状態に変更
    const DATA_LIST = document.getElementsByClassName("userData");

    DATA_LIST.forEach(function(obj){
        if(obj == except){
            return;
        }
        obj.classList.remove("gray");
    });
}