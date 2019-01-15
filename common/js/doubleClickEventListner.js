function userDataSelect(){
    if(this.classList.contains("gray")){
        // 背景を元に戻す
        this.classList.remove("gray");
    }else{
        // 背景をグレーに変更
        this.classList.add("gray");
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