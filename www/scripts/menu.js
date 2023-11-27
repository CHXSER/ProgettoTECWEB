document.querySelector('.menu-icon').addEventListener('click', function() {
    document.querySelector('.navbar').classList.toggle('open-menu');
});

window.addEventListener('scroll', function() {
    document.querySelector('.navbar').classList.remove('open-menu');
});