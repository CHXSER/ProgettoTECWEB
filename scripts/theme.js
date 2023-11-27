const btn = document.querySelector(".theme-button");

if (localStorage.getItem("theme") == "dark") {
  document.body.classList.add("dark-theme");
}

btn.addEventListener("click", function () {
  document.body.classList.toggle("dark-theme");
  
  let theme = document.body.classList.contains('dark-theme') ? 'dark' : 'light';
  localStorage.setItem("theme", theme);

  if (btn.classList.contains('fa-sun-o')) {
    btn.classList.replace('fa-sun-o', 'fa-moon-o');
  } else {
    btn.classList.replace('fa-moon-o', 'fa-sun-o');
  }
});