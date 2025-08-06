document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("form.form-validar, form.validar").forEach(function (form) {
        form.addEventListener("submit", function (e) {
            let valido = true;
            let mensajes = [];

            // Validar nombre y apellido
            ["nombre", "apellido"].forEach(function (campo) {
                const input = form.querySelector(`[name="${campo}"]`);
                if (input) {
                    const valor = input.value.trim();
                    if (!valor) {
                        valido = false;
                        mensajes.push(`El campo "${campo}" es obligatorio.`);
                        input.classList.add("is-invalid");
                    } else if (!/^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$/.test(valor)) {
                        valido = false;
                        mensajes.push(`El campo "${campo}" solo debe contener letras y espacios.`);
                        input.classList.add("is-invalid");
                    } else if (/^\s+$/.test(valor)) {
                        valido = false;
                        mensajes.push(`El campo "${campo}" no puede ser solo espacios.`);
                        input.classList.add("is-invalid");
                    } else {
                        input.classList.remove("is-invalid");
                    }
                }
            });

            // Validar correo gmail.com
            const correo = form.querySelector('input[name="correo"]');
            if (correo) {
                const valor = correo.value.trim();
                if (!valor) {
                    valido = false;
                    mensajes.push("El correo es obligatorio.");
                    correo.classList.add("is-invalid");
                } else if (!/^[^\s@]+@gmail\.com$/.test(valor)) {
                    valido = false;
                    mensajes.push("El correo debe ser válido y terminar en @gmail.com.");
                    correo.classList.add("is-invalid");
                } else {
                    correo.classList.remove("is-invalid");
                }
            }

            // Validar contraseña fuerte
            const pass1 = form.querySelector('input[name="contraseña"]');
            if (pass1) {
                const valor = pass1.value;
                if (!valor) {
                    valido = false;
                    mensajes.push("La contraseña es obligatoria.");
                    pass1.classList.add("is-invalid");
                } else if (valor.length < 6) {
                    valido = false;
                    mensajes.push("La contraseña debe tener al menos 6 caracteres.");
                    pass1.classList.add("is-invalid");
                } else if (!/[A-Z]/.test(valor) || !/[a-z]/.test(valor) || !/[0-9]/.test(valor) || !/[^A-Za-z0-9]/.test(valor)) {
                    valido = false;
                    mensajes.push("La contraseña debe tener mayúscula, minúscula, número y carácter especial.");
                    pass1.classList.add("is-invalid");
                } else {
                    pass1.classList.remove("is-invalid");
                }
            }

            // Validar confirmar contraseña
            const pass2 = form.querySelector('input[name="confirmar_contraseña"]');
            if (pass1 && pass2) {
                if (pass1.value !== pass2.value) {
                    valido = false;
                    mensajes.push("Las contraseñas no coinciden.");
                    pass2.classList.add("is-invalid");
                } else {
                    pass2.classList.remove("is-invalid");
                }
            }

            // Validar campos requeridos (no vacíos ni solo espacios)
            form.querySelectorAll("[required]").forEach(function (input) {
                if (!input.value.trim()) {
                    valido = false;
                    mensajes.push(`El campo "${input.getAttribute("name") || input.getAttribute("id")}" es obligatorio.`);
                    input.classList.add("is-invalid");
                } else {
                    input.classList.remove("is-invalid");
                }
            });

            // Validar número de documento y celular
            ["numerodocumento", "celular"].forEach(function (campo) {
                const input = form.querySelector(`[name="${campo}"]`);
                if (input && input.value && isNaN(input.value)) {
                    valido = false;
                    mensajes.push(`El campo "${campo}" debe ser numérico.`);
                    input.classList.add("is-invalid");
                } else if (input) {
                    input.classList.remove("is-invalid");
                }
            });

            // Validar fecha de nacimiento (no puede ser futura)
            const fecha = form.querySelector('input[name="fechanacimiento"]');
            if (fecha && fecha.value) {
                const valor = new Date(fecha.value);
                const hoy = new Date();
                if (valor > hoy) {
                    valido = false;
                    mensajes.push("La fecha de nacimiento no puede ser futura.");
                    fecha.classList.add("is-invalid");
                } else {
                    fecha.classList.remove("is-invalid");
                }
            }

            // Validar checkbox de términos si existe
            form.querySelectorAll('input[type="checkbox"][required]').forEach(function (input) {
                if (!input.checked) {
                    valido = false;
                    mensajes.push("Debes aceptar los términos y condiciones.");
                    input.classList.add("is-invalid");
                } else {
                    input.classList.remove("is-invalid");
                }
            });

            // Mostrar mensajes de error
            let divError = form.querySelector(".errores-form");
            if (!divError) {
                divError = document.createElement("div");
                divError.className = "errores-form alert alert-danger mt-2";
                form.prepend(divError);
            }
            if (!valido) {
                e.preventDefault();
                divError.innerHTML = mensajes.join("<br>");
                divError.style.display = "block";
            } else {
                divError.style.display = "none";
            }
        });
    });
});