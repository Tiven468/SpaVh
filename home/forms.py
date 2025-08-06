# forms.py
from django import forms
from .models import MensajeContacto

class MensajeContactoForm(forms.ModelForm):
    class Meta:
        model = MensajeContacto
        fields = ['nombre', 'apellido', 'correo', 'mensaje']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Inserta tu nombre'}),
            'apellido': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Inserta tu apellido'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'correo@gmail.com'}),
            'mensaje': forms.Textarea(attrs={'class': 'form-control', 'rows': 4, 'placeholder': 'Déjanos tu mensaje...'}),
        }

