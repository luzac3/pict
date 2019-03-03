function selectUser(){
    // 背景を殺す

    // オブジェクトを取得
    const USER_DATA_BUTTON = document.getElementsByClassName("userDataButton");

    // ユーザ選択状態をリフレッシュ
    clearUserDataSelect();

    // ユーザ選択画面をアクティブ
    document.getElementById("userSelect").style.visibility = "block";

    // イベントリスナ登録
    USER_DATA_BUTTON.addEventListener("click", fileReader, false);


    // OKイベントとキャンセルイベント

}
　