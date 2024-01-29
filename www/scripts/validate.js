function validateUsername(username) {
    if (username.trim() === '' || !/^[a-zA-Z0-9]+$/.test(username) || username.length < 3 || username.length > 30) {
        return false;
    }

    return true;
}

function validateEmail(email) {
    if (email.trim() === '' || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        return false;
    }

    return true;
}

function validatePassword(password) {
    if (password.trim() === '' || password.length < 8 || password.length > 30) {
        return false;
    }

    return true;
}

function validateConfirmPassword(password, confirmPassword) {
    if (confirmPassword.trim() === '' || password !== confirmPassword) {
        return false;
    }

    return true;
}

function validateLoginForm() {
    let username = document.getElementById('username').value;
    let password = document.getElementById('password').value;

    if (username.trim() === '') {
        document.getElementById('form-error').innerHTML = 'Username non valido'
        return false;
    }

    if (password.trim() === '') {
        document.getElementById('form-error').innerHTML = 'Password non valida'
        return false;
    }

    return true;
}

function validateRegisterForm() {
    let username = document.getElementById('username').value;
    let email = document.getElementById('email').value;
    let password = document.getElementById('password').value;
    let confirmPassword = document.getElementById('confirm-password').value;

    if (!validateUsername(username)) {
        document.getElementById('form-error').innerHTML = 'Username non valido';
        return false;
    }

    if (!validateEmail(email)) {
        document.getElementById('form-error').innerHTML = 'Email non valida';
        return false;
    }

    if (!validatePassword(password)) {
        document.getElementById('form-error').innerHTML = 'La password deve essere lunga almeno 8 caratteri e non più di 30'
        return false;
    }

    if (!validateConfirmPassword(password, confirmPassword)) {
        document.getElementById('form-error').innerHTML = 'Le password non corrispondono'
        return false;
    }

    return true;
}

function validateAddProductForm() {
    let name = document.getElementById('nome').value;
    let price = document.getElementById('prezzo').value;
    let description = document.getElementById('descrizione').value;
    let image = document.getElementById('immagine').value;

    if (!validateName(name)) {
        document.getElementById('form-error').innerHTML = 'Nome non valido';
        return false;
    }

    if (!validatePrice(price)) {
        document.getElementById('form-error').innerHTML = 'Prezzo non valido';
        return false;
    }

    if (!validateDescription(description)) {
        document.getElementById('form-error').innerHTML = 'Descrizione non valida';
        return false;
    }

    if (!validateImage(image)) {
        document.getElementById('form-error').innerHTML = 'Immagine non valida';
        return false;
    }

    return true;
}

function validatePrice(price) {
    if (price.trim() === '' || isNaN(price)) {
        return false;
    }

    return true;
}

function validateDescription(description) {
    if (description.trim() === '' || description.length < 3 || description.length > 30) {
        return false;
    }

    return true;
}

function validateImage(image) {
    if (image.trim() === '') {
        return false;
    }

    return true;
}

function validateAddToCartForm() {
    let quantity = document.getElementById('quantity').value;

    if (!validateQuantity(quantity)) {
        document.getElementById('form-error').innerHTML = 'Quantità non valida';
        return false;
    }

    return true;
}

function validateQuantity(quantity) {
    if (quantity.trim() === '') {
        return false;
    }

    if (isNaN(quantity)) {
        return false;
    }

    return true;
}