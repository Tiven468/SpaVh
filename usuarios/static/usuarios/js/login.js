const btnLogin = document.getElementById('btnLogin');
const btnRegistro = document.getElementById('btnRegistro');
const formLogin = document.getElementById('formLogin');
const formRegistro = document.getElementById('formRegistro');

btnLogin.addEventListener('click', () => {
    formLogin.classList.remove('d-none');
    formRegistro.classList.add('d-none');
    btnLogin.classList.add('active');
    btnRegistro.classList.remove('active');
});

btnRegistro.addEventListener('click', () => {
    formLogin.classList.add('d-none');
    formRegistro.classList.remove('d-none');
    btnLogin.classList.remove('active');
    btnRegistro.classList.add('active');
});



