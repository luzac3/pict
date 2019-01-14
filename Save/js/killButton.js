function killButton(){
    let objctName = this.value;

    if(this.checked){
        document.getElementById(objctName + "_button").disabled = true;
    }else{
        document.getElementById(objctName + "_button").disabled = false;
    }
}
