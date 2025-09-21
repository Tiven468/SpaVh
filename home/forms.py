from django import forms
from .models import Contacto

class MensajeContactoForm(forms.ModelForm):
    class Meta:
        model = Contacto
        fields = ['nombre', 'apellido', 'correo', 'mensaje']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingresa tu nombre'}),
            'apellido': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingresa tu apellido'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Ingresa tu correo'}),
            'mensaje': forms.Textarea(attrs={'class': 'form-control', 'rows': 4, 'placeholder': 'Déjanos tu mensaje...'}),
        }

    def __init__(self, *args, **kwargs):
        usuario = kwargs.pop('usuario', None)  # 👈 pasamos el usuario desde la vista
        super().__init__(*args, **kwargs)

        if usuario:  
            # Si está logueado, ocultamos nombre, apellido y correo
            self.fields.pop('nombre')
            self.fields.pop('apellido')
            self.fields.pop('correo')
