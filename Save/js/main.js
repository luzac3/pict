window.onload = function(){
    const COPY_CANVAS = document.getElementById("copyCanvas");
    const INPUT_FILE = document.getElementById("files");

    INPUT_FILE.addEventListener("change", fileReader, false);
    COPY_CANVAS.addEventListener("click", copyCanvas, false);
}