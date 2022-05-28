function checkFormChangePassword(){
    let passwordField = document.getElementById('password');
    let repasswordField = document.getElementById('repassword');
    let errorFiled = document.getElementById('error-message');

    let password = passwordField.value;
    let repassword = repasswordField.value;
    
    if (password !== repassword) {
        errorFiled.innerHTML = "Password and Confirm password does not match";
        passwordField.focus();
        return false;
    }
    errorFiled.innerHTML = "";
    return true;
}

