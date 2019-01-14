window.onload = function(){
    const INPUT_FILE = document.getElementById("files");
    const INPUT_FLG = document.getElementsByClassName("input_flg");
    const INPUT_BUTTON = document.getElementsByClassName("input_button");
    const UPLOAD_PICT = document.getElementById("uploadPict");

    INPUT_FILE.addEventListener("change", fileReader, false);
    INPUT_FLG.addEventListener("change", killButton, false);
    INPUT_BUTTON.addEventListener("change", selectUser, false);
    UPLOAD_PICT.addEventListener("click", saveCanvas, false);
}
