# usuarios/views.py
from django.shortcuts import render, redirect, get_object_or_404
from django.db import IntegrityError
from django.contrib import messages
# Importa los modelos que ya usas y añade Servicios
from .models import Usuarios, Perfiles, Agendarcita, Horarios, Servicios 
from django.core.serializers.json import DjangoJSONEncoder
from datetime import datetime
import json
import uuid
from django.utils import timezone
from datetime import timedelta


# --- Vistas Existentes (Sin cambios funcionales, solo se incluye para contexto) ---


def adminpage(request):
    total_usuarios = Usuarios.objects.count()
    total_citas = Agendarcita.objects.count()  
    return render(request, 'usuarios/admin.html', {
        'total_usuarios': total_usuarios,
        'total_citas': total_citas
    })



def login(request):
    if request.method == 'POST':
        correo = request.POST.get('correo')
        contraseña = request.POST.get('contraseña')
        try:
            usuario = Usuarios.objects.get(correo=correo, contraseña=contraseña)
            request.session['usuario_id'] = usuario.idusuarios
            request.session['perfil'] = usuario.perfiles_idperfiles.descripcion.lower()
            if usuario.perfiles_idperfiles_id == 1: # Asumiendo que 1 es el ID del perfil "admin"
                return redirect('adminbase')
            else:
                return redirect('index') # Redirige al index público
        except Usuarios.DoesNotExist:
            messages.error(request, 'Correo o contraseña incorrectos')
    return render(request, 'usuarios/login.html')

def logout_view(request):
    request.session.flush()
    return redirect('index')

def registro(request):
    if request.method == 'POST':
        try:
            nombre = request.POST['nombre']
            apellido = request.POST['apellido']
            tipodocumento = request.POST['tipodocumento']
            numerodocumento = request.POST['numerodocumento']
            correo = request.POST['correo']
            contraseña = request.POST['contraseña']
            celular = request.POST['celular']
            fechanacimiento = request.POST['fechanacimiento']

            perfil_usuario = Perfiles.objects.get(descripcion__iexact='usuario')

            nuevo_usuario = Usuarios(
                nombre=nombre,
                apellido=apellido,
                tipodocumento=tipodocumento,
                numerodocumento=numerodocumento,
                correo=correo,
                contraseña=contraseña,
                celular=celular,
                fechanacimiento=fechanacimiento,
                perfiles_idperfiles=perfil_usuario
            )
            nuevo_usuario.save()
            messages.success(request, 'Registro exitoso. Ahora puedes iniciar sesión.')
            return redirect('login')
        except IntegrityError:
            messages.error(request, 'El número de documento o correo ya existen.')
            return render(request, 'usuarios/login.html')
        except Exception as e:
            messages.error(request, 'Error al registrar: ' + str(e))
            return render(request, 'usuarios/login.html')
    return render(request, 'usuarios/login.html')


def cuenta(request):
    usuario_id = request.session.get('usuario_id')
    if not usuario_id:
        return redirect('login')
    usuario = get_object_or_404(Usuarios, idusuarios=usuario_id)
    citas = Agendarcita.objects.filter(usuarios_idusuarios=usuario).order_by('-idagendarcita')
    return render(request, 'usuarios/cuenta.html', {
        'usuario': usuario,
        'citas': citas
    })


def agendar(request):
    usuario_id = request.session.get('usuario_id')
    if not usuario_id:
        return redirect('login')
    
    try:
        usuario = get_object_or_404(Usuarios, idusuarios=usuario_id)
    except Usuarios.DoesNotExist:
        return redirect('login') # Esto ya lo maneja get_object_or_404, pero se mantiene si hay más lógica

    mensaje = None
    error = None

    if request.method == 'POST':
        fecha_hora_str = request.POST.get('fecha_hora') 
        servicio = request.POST.get('servicio')
        metodopago = request.POST.get('metodo_pago')
        alergias = request.POST.get('alergias')

        fecha = None
        hora = None

        if fecha_hora_str:
            try:
                fecha_completa = datetime.strptime(fecha_hora_str, '%Y-%m-%dT%H:%M')

                if fecha_completa < datetime.now():
                    error = 'No puedes agendar una cita en el pasado.'
                else:
                    fecha = fecha_completa.date()
                    hora = fecha_completa.strftime('%H:%M')
            except ValueError:
                error = 'Formato de fecha y hora no válido.'
        else:
            error = 'Debes seleccionar una fecha y hora válidas.'

        if not error and not (servicio and metodopago):
            error = 'Todos los campos son obligatorios.'
        
        if not error:
            if Horarios.objects.filter(fecha=fecha, hora=hora).exists():
                error = 'Ese horario ya está ocupado. Elige otro.'
            else:
                horario = Horarios.objects.create(fecha=fecha, hora=hora)
                Agendarcita.objects.create(
                    usuarios_idusuarios=usuario,
                    horarios_idhorarios=horario,
                    servicio=servicio,
                    metodopago=metodopago,
                    alergias=alergias
                )
                mensaje = 'Cita agendada exitosamente.'

    return render(request, 'usuarios/agendar.html', {
        'usuario': usuario,
        'mensaje': mensaje,
        'error': error,
        'fecha_actual': datetime.now().strftime('%Y-%m-%dT%H:%M') 
    })


def adminbase(request):
    # Aquí puedes añadir una verificación de perfil para asegurar que solo los admins accedan
    # if request.session.get('perfil') != 'admin':
    #    return redirect('login')
    return render(request, 'usuarios/base.html')


def crudusuarios(request): # Esta vista parece redundante con listausuarios, podrías usar solo listausuarios
    return render(request, 'usuarios/crudusuarios.html')

def listausuarios(request):
    usuarios = Usuarios.objects.all()
    return render(request, 'usuarios/crudusuarios.html', {'usuarios': usuarios})

def eliminar_usuario(request, idusuarios):
    usuario = get_object_or_404(Usuarios, idusuarios=idusuarios) # Usar get_object_or_404
    if request.method == 'POST':
        usuario.delete()
        messages.success(request, 'Usuario eliminado exitosamente.')
        return redirect('listausuarios')
    # Podrías renderizar una página de confirmación si el método no es POST
    return render(request, 'usuarios/confirmar_eliminar_usuario.html', {'usuario': usuario}) # Nueva plantilla

def editar_usuario(request, idusuarios):
    usuario = get_object_or_404(Usuarios, idusuarios=idusuarios)
    perfiles = Perfiles.objects.all() # Obtener todos los perfiles para el select

    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        apellido = request.POST.get('apellido')
        tipodocumento = request.POST.get('tipodocumento')
        numerodocumento = request.POST.get('numerodocumento')
        correo = request.POST.get('correo')
        contraseña = request.POST.get('contraseña') # Considera hashear contraseñas
        celular = request.POST.get('celular')
        fechanacimiento = request.POST.get('fechanacimiento')
        perfil_id = request.POST.get('perfil')
        
        perfil_obj = get_object_or_404(Perfiles, pk=perfil_id)
        
        usuario.nombre = nombre
        usuario.apellido = apellido
        usuario.tipodocumento = tipodocumento
        usuario.numerodocumento = numerodocumento
        usuario.correo = correo
        usuario.contraseña = contraseña
        usuario.celular = celular
        usuario.fechanacimiento = fechanacimiento
        usuario.perfiles_idperfiles = perfil_obj
        
        try:
            usuario.save()
            messages.success(request, 'Usuario actualizado exitosamente.')
            return redirect('listausuarios')
        except IntegrityError:
            messages.error(request, 'Ya existe un usuario con ese documento o correo.')
            # Vuelve a renderizar el formulario con los datos y el error
            return render(request, 'usuarios/editar_usuario.html', {
                'usuario': usuario, 'perfiles': perfiles, 'error': 'Ya existe un usuario con ese documento o correo.'
            })
    else:
        return render(request, 'usuarios/editar_usuario.html', {'usuario': usuario, 'perfiles': perfiles})


def crear_usuario(request):
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        apellido = request.POST.get('apellido')
        tipodocumento = request.POST.get('tipodocumento')
        numerodocumento = request.POST.get('numerodocumento')
        correo = request.POST.get('correo')
        contraseña = request.POST.get('contraseña')
        celular = request.POST.get('celular')
        fechanacimiento = request.POST.get('fechanacimiento')
        perfil_id = request.POST.get('perfil')

        perfil_obj = get_object_or_404(Perfiles, pk=perfil_id)
        
        try:
            Usuarios.objects.create(
                nombre=nombre,
                apellido=apellido,
                tipodocumento=tipodocumento,
                numerodocumento=numerodocumento,
                correo=correo,
                contraseña=contraseña,
                celular=celular,
                fechanacimiento=fechanacimiento,
                perfiles_idperfiles=perfil_obj,
            )
            messages.success(request, 'Usuario creado exitosamente.')
            return redirect('listausuarios')
        except IntegrityError:
            messages.error(request, 'Ya existe un usuario con ese número de documento o correo.')
            # Para repoblar el formulario en caso de error
            perfiles = Perfiles.objects.all()
            return render(request, 'usuarios/crear_usuario.html', {
                'perfiles': perfiles,
                'error': 'Ya existe un usuario con ese número de documento o correo.',
                'usuario_data': request.POST # Pasa los datos del POST para repoblar el form
            })
    else:
        perfiles = Perfiles.objects.all()
        return render(request, 'usuarios/crear_usuario.html', {'perfiles': perfiles})
    
def listar_citas(request):
    citas = Agendarcita.objects.all()
    return render(request, 'usuarios/crudcitas.html', {'citas': citas})

def recuperar_contraseña(request):
    mensaje = None
    error = None
    if request.method == 'POST':
        correo = request.POST.get('correo')
        try:
            usuario = Usuarios.objects.filter(correo=correo).first()
            if usuario:
                token = str(uuid.uuid4())
                usuario.token_recuperacion = token
                usuario.token_expira = timezone.now() + timedelta(hours=1)
                usuario.save()
                enlace = request.build_absolute_uri(f"/usuarios/recuperar/nueva/{token}/")
                send_mail(
                    'Recupera tu contraseña',
                    f'Para restablecer tu contraseña haz clic aquí: {enlace}',
                    'tu_correo@gmail.com', # ¡Asegúrate de configurar esto en settings.py!
                    [correo],
                    fail_silently=False,
                )
            messages.info(request, "Si el correo está registrado, recibirás instrucciones para recuperar tu contraseña.")
        except Exception as e:
            messages.error(request, "Ocurrió un error al intentar enviar el correo. Intenta de nuevo más tarde.")
            # Por seguridad, el mensaje al usuario final debe ser genérico incluso si hay un error interno
            messages.info(request, "Si el correo está registrado, recibirás instrucciones para recuperar tu contraseña.") 
    return render(request, 'usuarios/recuperar_contraseña.html')

def nueva_contraseña(request, token):
    error = None
    mensaje = None
    usuario = Usuarios.objects.filter(token_recuperacion=token, token_expira__gte=timezone.now()).first()
    
    if not usuario:
        messages.error(request, "El enlace es inválido o ha expirado.")
        return redirect('recuperar_contraseña') # Redirige si el token no es válido

    if request.method == 'POST':
        nueva = request.POST.get('contraseña')
        confirmar = request.POST.get('confirmar_contraseña')
        
        if nueva and nueva == confirmar:
            # Aquí podrías considerar hashear la contraseña antes de guardarla.
            # usuario.contraseña = make_password(nueva) # Requiere from django.contrib.auth.hashers import make_password
            usuario.contraseña = nueva  
            usuario.token_recuperacion = None
            usuario.token_expira = None
            usuario.save()
            messages.success(request, "Contraseña cambiada correctamente. Ahora puedes iniciar sesión.")
            return redirect('login')
        else:
            error = "Las contraseñas no coinciden o están vacías."
    
    return render(request, 'usuarios/nueva_contraseña.html', {'error': error, 'mensaje': mensaje})


# --- NUEVAS VISTAS PARA EL CRUD DE SERVICIOS ---

def servicio_admin_list(request):
    servicios = Servicios.objects.all().order_by('descripcion')
    return render(request, 'usuarios/servicio_admin_list.html', {'servicios': servicios})

def servicio_create(request):
    if request.method == 'POST':
        titulo = request.POST.get('titulo')
        descripcion = request.POST.get('descripcion')
        precio = request.POST.get('precio')
        imagenproducto = request.FILES.get('imagenproducto')

        if not titulo or not descripcion or not precio or not imagenproducto:
            messages.error(request, 'Todos los campos son obligatorios.')
            return render(request, 'usuarios/servicio_form.html', {
                'action': 'Crear',
                'servicio_data': request.POST
            })
        
        try:
            precio_decimal = float(precio)
        except ValueError:
            messages.error(request, 'El precio debe ser un número válido.')
            return render(request, 'usuarios/servicio_form.html', {
                'action': 'Crear',
                'servicio_data': request.POST
            })

        try:
            Servicios.objects.create(
                titulo=titulo,
                descripcion=descripcion,
                precio=precio_decimal,
                imagenproducto=imagenproducto
            )
            messages.success(request, 'Servicio creado exitosamente.')
            return redirect('servicio_admin_list')
        except Exception as e:
            messages.error(request, f'Error al crear el servicio: {e}')
            return render(request, 'usuarios/servicio_form.html', {
                'action': 'Crear',
                'servicio_data': request.POST
            })
    else:
        return render(request, 'usuarios/servicio_form.html', {
            'action': 'Crear',
            'servicio_data': {}
        })


def servicio_update(request, pk):
    servicio = get_object_or_404(Servicios, pk=pk)
    
    if request.method == 'POST':
        titulo = request.POST.get('titulo')
        descripcion = request.POST.get('descripcion')
        precio = request.POST.get('precio')
        imagenproducto = request.FILES.get('imagenproducto')

        if not titulo or not descripcion or not precio:
            messages.error(request, 'Todos los campos son obligatorios (excepto imagen si no quieres cambiarla).')
            return render(request, 'usuarios/servicio_form.html', {
                'action': 'Actualizar',
                'servicio': servicio,
                'servicio_data': request.POST
            })
        
        try:
            precio_decimal = float(precio)
        except ValueError:
            messages.error(request, 'El precio debe ser un número válido.')
            return render(request, 'usuarios/servicio_form.html', {
                'action': 'Actualizar',
                'servicio': servicio,
                'servicio_data': request.POST
            })

        servicio.titulo = titulo
        servicio.descripcion = descripcion
        servicio.precio = precio_decimal

        if imagenproducto:  # Solo si se sube una nueva
            servicio.imagenproducto = imagenproducto
        
        try:
            servicio.save()
            messages.success(request, 'Servicio actualizado exitosamente.')
            return redirect('servicio_admin_list')
        except Exception as e:
            messages.error(request, f'Error al actualizar el servicio: {e}')
            return render(request, 'usuarios/servicio_form.html', {
                'action': 'Actualizar',
                'servicio': servicio,
                'servicio_data': request.POST
            })
    else:
        return render(request, 'usuarios/servicio_form.html', {
            'action': 'Actualizar',
            'servicio': servicio,
            'servicio_data': {}
        })


def servicio_delete(request, pk):
    servicio = get_object_or_404(Servicios, pk=pk)

    if request.method == 'POST':
        try:
            servicio.delete()
            messages.success(request, 'Servicio eliminado exitosamente.')
            return redirect('servicio_admin_list')
        except Exception as e:
            messages.error(request, f'Error al eliminar el servicio: {e}')
            return redirect('servicio_admin_list')
    return render(request, 'usuarios/servicio_confirm_delete.html', {'servicio': servicio})