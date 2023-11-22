var themeButtom = document.getElementById("theme-button");
themeButtom.onclick = function () {
    document.body.classList.toggle("dark-theme");
    if (document.body.classList.contains("dark-theme")) {
        themeButtom.innerHTML = "Light Mode";
    } else {
        themeButtom.innerHTML = "Dark Mode";
    }
}