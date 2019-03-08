document.addEventListener('turbolinks:load', function() {
    let confirmation_input = document.querySelector('#user_password_confirmation');
    if (confirmation_input) {
        confirmation_input.addEventListener('input', check_password_confirmation);
    }
});

function check_password_confirmation() {
    let password = document.querySelector('#user_password');
    let confirmation = document.querySelector('#user_password_confirmation');

    let same_pass = document.querySelector('.same-passwords');
    let diff_pass = document.querySelector('.different-passwords');

    if (password.value == "") {
        same_pass.classList.add('hide');
        diff_pass.classList.add('hide');
    } else {
        if (password.value == confirmation.value){
            same_pass.classList.remove('hide');
            diff_pass.classList.add('hide');
        } else {
            same_pass.classList.add('hide');
            diff_pass.classList.remove('hide');
        }
    }
}
