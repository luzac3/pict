function copyCanvas(){
    const EXT = document.getElementById("ext").className;
    const FILE_NAME = document.getElementById("fileName").className;
    saveCanvas(EXT, FILE_NAME, "canvas");
}