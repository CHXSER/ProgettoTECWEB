document.querySelector('.menu-icon').addEventListener('click', function () {
  document.querySelector('.navbar').classList.toggle('open-menu');
});

window.addEventListener('scroll', function () {
  document.querySelector('.navbar').classList.remove('open-menu');
});

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('show');
    } else {
      entry.target.classList.remove('show');
    }
  });
});

const hiddenElements = document.querySelectorAll('.hidden');
hiddenElements.forEach((el) => observer.observe(el));

var swiper = new Swiper(".mySwiper", {
  spaceBetween: 30,
  centeredSlides: true,
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
});

document.addEventListener('DOMContentLoaded', function () {
  var cards = document.querySelectorAll('.small-collection-card');

  cards.forEach(function (card) {
    card.addEventListener('click', function () {
      var form = card.querySelector('.view_product');
      form.submit();
    });
  });
});

function openTab(evt, tabName) {
  var i, tabcontent, tablinks;

  tabcontent = document.getElementsByClassName("tab-content");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].classList.add("hide-tab");
  }

  tablinks = document.getElementsByClassName("tab-links");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].classList.remove("active");
  }

  document.getElementById(tabName).classList.remove("hide-tab");
  evt.currentTarget.classList.add("active");
}

function sendQuestion() {
  var nome = document.getElementById("nome").value;
  var email = document.getElementById("email").value;
  var mex = "Ciao, " + nome + " abbiamo ricevuto la tua domanda. Riceverai risposta all'indirizzo " + email;
  alert(mex);
}

window.addEventListener('scroll', function () {
  const nav = document.querySelector('.nav');
  if (window.scrollY > 0) {
    nav.classList.add('nav-scrolled');
  } else {
    nav.classList.remove('nav-scrolled');
  }
});

document.addEventListener('click', function (e) {
  const nav = document.querySelector('.nav');
  if (!nav.contains(e.target)) {
    nav.classList.remove('nav-scrolled');
  }
});

document.addEventListener('click', function () {
  const nav = document.querySelector('.nav');
  nav.classList.add('nav-scrolled');
});

function togglePasswordVisibility(passwordId, toggleId) {
  const passwordInput = document.getElementById(passwordId);
  const toggleInput = document.getElementById(toggleId);

  if (passwordInput && toggleInput) {
    toggleInput.addEventListener('change', function () {
      if (this.checked) {
        passwordInput.type = 'text';
      } else {
        passwordInput.type = 'password';
      }
    });
  }
}

document.addEventListener('DOMContentLoaded', function () {
  togglePasswordVisibility('password', 'toggle-password');
  togglePasswordVisibility('confirm-password', 'toggle-confirm-password');
})

let selectElements = document.querySelectorAll('.quantity-available');
let receipt = document.querySelector('.receipt');

selectElements.forEach((select, index) => {
  select.addEventListener('change', (event) => {
    let quantity = event.target.value;
    let summaryItem = document.querySelectorAll('.product-summary-item')[index];
    let productItem = document.querySelectorAll('.product-item')[index];
    let singlePrice = parseInt(productItem.querySelector('.product-price').textContent);
    let totalPrice = singlePrice * quantity;

    summaryItem.querySelector('.product-summary-price').textContent = totalPrice.toFixed(2) + '€';
    summaryItem.querySelector('.quantity').textContent = 'x'+ quantity;
    calculateTotal();
  });
});

function calculateTotal() {
  let summaryPrices = Array.from(document.querySelectorAll('.product-summary-price'));
  let deliveryPrice = parseInt(document.querySelector('.receipt-price-delivery').textContent);
  let tax = parseInt(document.querySelector('.receipt-price-tax').textContent);
  
  let subTotal = summaryPrices.reduce((total, price) => total + parseFloat(price.textContent), 0);
  let taxAmount = (subTotal + deliveryPrice) * tax / 100;
  let total = subTotal + deliveryPrice + taxAmount;

  document.querySelector('.receipt-price-subtotal').textContent = subTotal.toFixed(2) + '€';
  document.querySelector('.receipt-price-total').textContent = total.toFixed(2) + '€';
  updateCarrello("", "");
}

function updateCarrello(nome, quantita) {
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'update_session.php', true);
  XPathExpression.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhr.onreadystatechange = function () {
    if(xhr.readyState === 4 && xhr.status === 200) {
      console.log(xhr.responseText); // Log the server response
    }
  };
  // TODO: Far funzionare questa
  xhr.send('value' + encodeURIComponent(value));
}