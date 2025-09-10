from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.


def listado_reservas(request):
    return render(request, 'reservas/listado_reservas.html')
