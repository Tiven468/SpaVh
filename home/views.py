# home/views.py
from django.shortcuts import render, redirect
from django.contrib import messages
from usuarios.models import Usuarios, Servicios # ¡Asegúrate de importar Servicios aquí!
from .forms import MensajeContactoForm # Asumo que este formulario existe



def index(request):
    servicios = Servicios.objects.all()[:2] 
    return render(request, 'home/index.html', {'servicios': servicios})


def servicios(request):
    nombre = None
    servicios_data = []  # ✅ siempre inicializamos la variable

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

def contactenos(request):
    nombre = None
    if request.session.get('usuario_id'):
        try:
            usuario = Usuarios.objects.get(idusuarios=request.session['usuario_id'])
            nombre = usuario.nombre
        except Usuarios.DoesNotExist:
            pass

    if request.method == 'POST':
        form = MensajeContactoForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, '¡Tu mensaje ha sido enviado exitosamente!')
            return redirect('contactenos')
    else:
        form = MensajeContactoForm()
    return render(request, 'home/contactenos.html', {'form': form, 'nombre': nombre})