from django import forms
from .models import Servicios

class ServicioForm(forms.ModelForm):
    class Meta:
        model = Servicios
        fields = ['descripcion', 'precio', 'imagenproducto']
        widgets = {
            'descripcion': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Descripción del servicio'}),
            'precio': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Precio (ej: 100000)'}),
            'imagenproducto': forms.URLInput(attrs={'class': 'form-control', 'placeholder': 'URL de la imagen del servicio'}),
        }