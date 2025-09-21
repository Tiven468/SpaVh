from django.db import models

class Contacto(models.Model):
    idcontacto = models.AutoField(db_column='IdContacto', primary_key=True)
    nombre = models.CharField(db_column='Nombre', max_length=255)
    apellido = models.CharField(db_column='Apellido', max_length=50)
    correo = models.CharField(db_column='Correo', max_length=100)
    usuarios_idusuarios = models.ForeignKey(
        'usuarios.Usuarios', 
        models.DO_NOTHING,
        db_column='Usuarios_IdUsuarios',
        null=True,
        blank=True
    )
    mensaje = models.CharField(db_column='Mensaje', max_length=255)
    fecha = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'contacto'
