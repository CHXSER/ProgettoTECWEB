document.querySelector('.menu-icon').addEventListener('click', function() {
  document.querySelector('.navbar').classList.toggle('open-menu');
});

window.addEventListener('scroll', function() {
  document.querySelector('.navbar').classList.remove('open-menu');
});

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    console.log(entry)
    if (entry.isIntersecting) {
      entry.target.classList.add('show');
    } else {
      entry.target.classList.remove('show');
    }
  });
});

const hiddenElements = document.querySelectorAll('.hidden');
hiddenElements.forEach((el) => observer.observe(el));

const btn = document.querySelector(".theme-button");

if (localStorage.getItem("theme") == "dark") {
  document.body.classList.add("dark-theme");
}

btn.addEventListener("click", function () {
  document.body.classList.toggle("dark-theme");
  
  let theme = document.body.classList.contains('dark-theme') ? 'dark' : 'light';
  localStorage.setItem("theme", theme);

  if (btn.classList.contains('ph-sun-dim')) {
    btn.classList.replace('ph-sun-dim', 'ph-moon');
  } else {
    btn.classList.replace('ph-moon', 'ph-sun-dim');
  }
});

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

// Get current page URL
let currentPage = window.location.pathname.split('/').pop();

// Select all nav-link items
let navLinks = document.querySelectorAll('.nav-link');

// Loop through each nav-link item
navLinks.forEach((navLink) => {
  // Get the href attribute of the nav-link item
  let href = navLink.getAttribute('href');

  // If the href matches the current page URL, add the active class
  if (href === currentPage) {
    navLink.classList.add('active');
  }
});