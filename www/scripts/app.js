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