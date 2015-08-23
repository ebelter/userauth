function checkPasswordsMatch() {
    //Store the password field objects into variables ...
    var password = document.getElementById('user_password').value;
    var password_confirmation_input = document.getElementById('user_password_confirmation');
    //Store the Confimation Message Object ...
    var message = document.getElementById('passwordsMatchMsg');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";   

    if(password == password_confirmation_input.value) {
        password_confirmation_input.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }
	else {
        password_confirmation_input.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}  
