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
    if request.session.get('usuario_id'):
        try:
            usuario = Usuarios.objects.get(idusuarios=request.session['usuario_id'])
            nombre = usuario.nombre
        except Usuarios.DoesNotExist:
            pass
    
    # --- ¡Aquí es donde obtenemos los servicios de la base de datos! ---
    servicios_data = Servicios.objects.all().order_by('descripcion') # Ordena por descripción, por ejemplo

    return render(request, 'home/servicios.html', {
        'nombre': nombre,
        'servicios': servicios_data # Pasamos los servicios al contexto de la plantilla
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