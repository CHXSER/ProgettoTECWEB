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