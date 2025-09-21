# home/views.py
from django.shortcuts import render, redirect
from django.contrib import messages
from usuarios.models import Usuarios, Servicios # ¡Asegúrate de importar Servicios aquí!
from .forms import MensajeContactoForm # Asumo que este formulario existe



def index(request):
    nombre = None
    if request.session.get('usuario_id'):
        try:
            usuario = Usuarios.objects.get(idusuarios=request.session['usuario_id'])
            nombre = usuario.nombre
        except Usuarios.DoesNotExist:
            pass

    servicios = Servicios.objects.all()[:2] 
    return render(request, 'home/index.html', {
        'servicios': servicios,
        'nombre': nombre
    })



def servicios(request):
    nombre = None
    servicios_data = [] 

    if request.session.get('usuario_id'):
        try:
            usuario = Usuarios.objects.get(idusuarios=request.session['usuario_id'])
            nombre = usuario.nombre
        except Usuarios.DoesNotExist:
            pass

    servicios_data = Servicios.objects.filter(habilitado=True).order_by('titulo')

    return render(request, 'home/servicios.html', {
        'nombre': nombre,
        'servicios': servicios_data
    })


def quienessomos(request):
    nombre = None
    if request.session.get('usuario_id'):
        try:
            usuario = Usuarios.objects.get(idusuarios=request.session['usuario_id'])
            nombre = usuario.nombre
        except Usuarios.DoesNotExist:
            pass
    return render(request, 'home/quienessomos.html', {'nombre': nombre})

from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from usuarios.models import Usuarios
from .forms import MensajeContactoForm

def contactenos(request):
    usuario_id = request.session.get('usuario_id')
    usuario = None
    nombre = None

    if usuario_id:
        try:
            usuario = Usuarios.objects.get(idusuarios=usuario_id)
            nombre = usuario.nombre
        except Usuarios.DoesNotExist:
            usuario = None

    if request.method == 'POST':
        form = MensajeContactoForm(request.POST, usuario=usuario if nombre else None)
        if form.is_valid():
            contacto = form.save(commit=False)
            if nombre:  # si está logueado, rellenamos datos
                contacto.nombre = usuario.nombre
                contacto.apellido = usuario.apellido
                contacto.correo = usuario.correo
                contacto.usuarios_idusuarios = usuario
            contacto.save()
            messages.success(request, '¡Tu mensaje ha sido enviado exitosamente!')
            return redirect('contactenos')
    else:
        form = MensajeContactoForm(usuario=usuario if nombre else None)

    return render(request, 'home/contactenos.html', {
        'form': form,
        'nombre': nombre
    })
