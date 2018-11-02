window.onload = function(){
    const COPY_CANVAS = document.getElementById("copyCanvas");
    const INPUT_FILE = document.getElementById("files");

    inputFile.addEventListner("change", fileReader, false);
    copyCanvas.addEventListner("click", fnCopyCanvas, false);
}