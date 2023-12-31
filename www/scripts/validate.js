function validateUsername(username) {
    // Check if the username is empty
    if (username.trim() === '' || !/^[a-zA-Z0-9]+$/.test(username) || username.length < 3 || username.length > 30) {
        return false;
    }

    return true;
}

function validateEmail(email) {
    // Controlla se l'email è vuota
    if (email.trim() === '' || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        return false;
    }

    return true;
}

function validatePassword(password) {
    // Controlla se la password è vuota
    if (password.trim() === '' || password.length < 8 || password.length > 30) {
        return false;
    }

    return true;
}

function validateConfirmPassword(password, confirmPassword) {
    // Controlla se la conferma della password è vuota
    if (confirmPassword.trim() === '' || password !== confirmPassword) {
        return false;
    }

    return true;
}

function validateLoginForm() {
    // Ottieni i valori dagli input del form
    let username = document.getElementById('username').value;
    let password = document.getElementById('password').value;

    // Valida lo username
    if (username.trim() === '') {
        document.getElementById('form-error').innerHTML = 'Username non valido'
        return false;
    }

    // Valida la password
    if (password.trim() === '') {
        document.getElementById('form-error').innerHTML = 'Password non valida'
        return false;
    }

    return true;
}

function validateRegisterForm() {
    // Ottieni i valori dagli input del form
    let username = document.getElementById('username').value;
    let email = document.getElementById('email').value;
    let password = document.getElementById('password').value;
    let confirmPassword = document.getElementById('confirm-password').value;

    // Valida lo username
    if (!validateUsername(username)) {
        document.getElementById('form-error').innerHTML = 'Username non valido';
        return false;
    }

    // Valida l'indirizzo email
    if (!validateEmail(email)) {
        document.getElementById('form-error').innerHTML = 'Email non valida';
        return false;
    }

    // Valida la password
    if (!validatePassword(password)) {
        document.getElementById('form-error').innerHTML = 'La password deve essere lunga almeno 8 caratteri e non più di 30'
        return false;
    }

    // Valida la conferma della password
    if (!validateConfirmPassword(password, confirmPassword)) {
        document.getElementById('form-error').innerHTML = 'Le password non corrispondono'
        return false;
    }

    return true;
}

function validateAddProductForm() {
    // Ottieni i valori dagli input del form
    let name = document.getElementById('nome').value;
    let price = document.getElementById('prezzo').value;
    let description = document.getElementById('descrizione').value;
    let image = document.getElementById('immagine').value;

    // Valida il nome
    if (!validateName(name)) {
        document.getElementById('form-error').innerHTML = 'Nome non valido';
        return false;
    }

    // Valida il prezzo
    if (!validatePrice(price)) {
        document.getElementById('form-error').innerHTML = 'Prezzo non valido';
        return false;
    }

    // Valida la descrizione
    if (!validateDescription(description)) {
        document.getElementById('form-error').innerHTML = 'Descrizione non valida';
        return false;
    }

    // Valida l'immagine
    if (!validateImage(image)) {
        document.getElementById('form-error').innerHTML = 'Immagine non valida';
        return false;
    }

    return true;
}

function validatePrice(price) {
    // Controlla se il prezzo è vuoto
    if (price.trim() === '' || isNaN(price)) {
        return false;
    }

    return true;
}

function validateDescription(description) {
    // Controlla se la descrizione è vuota
    if (description.trim() === '' || description.length < 3 || description.length > 30) {
        return false;
    }

    return true;
}

function validateImage(image) {
    // Controlla se l'immagine è vuota
    if (image.trim() === '') {
        return false;
    }

    return true;
}

function validateAddToCartForm() {
    // Ottieni i valori dagli input del form
    let quantity = document.getElementById('quantity').value;

    // Valida la quantità
    if (!validateQuantity(quantity)) {
        document.getElementById('form-error').innerHTML = 'Quantità non valida';
        return false;
    }

    return true;
}

function validateQuantity(quantity) {
    // Controllo se la quantità è vuota
    if (quantity.trim() === '') {
        return false;
    }

    // Controllo se la quantità è un numero
    if (isNaN(quantity)) {
        return false;
    }

    return true;
}