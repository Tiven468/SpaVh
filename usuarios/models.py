# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has on_delete set to the desired behavior
#   * Remove managed = False lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Horarios(models.Model):
    idhorarios = models.AutoField(db_column='IdHorarios', primary_key=True)
    fecha = models.DateField(db_column='Fecha')
    hora = models.CharField(db_column='Hora', max_length=45)
    class Meta:
        managed = False
        db_table = 'horarios'

class Agendarcita(models.Model):
    idagendarcita = models.AutoField(db_column='idAgendarCita', primary_key=True)
    usuarios_idusuarios = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='Usuarios_IdUsuarios')
    horarios_idhorarios = models.ForeignKey('Horarios', models.DO_NOTHING, db_column='Horarios_IdHorarios')
    servicio = models.CharField(db_column='Servicio', max_length=100)
    metodopago = models.CharField(db_column='MetodoPago', max_length=50)
    alergias = models.CharField(db_column='Alergias', max_length=255, blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'agendarcita'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Citaservicios(models.Model):
    idcitaservicios = models.AutoField(db_column='IdCitaServicios', primary_key=True)  # Field name made lowercase.
    servicios_idservicios = models.ForeignKey('Servicios', models.DO_NOTHING, db_column='Servicios_IdServicios')  # Field name made lowercase.
    agendarcita_idagendarcita = models.ForeignKey(Agendarcita, models.DO_NOTHING, db_column='AgendarCita_idAgendarCita')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'citaservicios'


class Contacto(models.Model):
    idcontacto = models.AutoField(db_column='IdContacto', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=255)  # Field name made lowercase.
    apellido = models.CharField(db_column='Apellido', max_length=50)  # Field name made lowercase.
    correo = models.CharField(db_column='Correo', max_length=100)  # Field name made lowercase.
    usuarios_idusuarios = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='Usuarios_IdUsuarios')  # Field name made lowercase.
    mensaje = models.CharField(db_column='Mensaje', max_length=255)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'contacto'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Metodopago(models.Model):
    idmetodopago = models.AutoField(db_column='IdMetodoPago', primary_key=True)
    descripcion = models.CharField(db_column='Descripcion', max_length=50)
    agendarcita_idagendarcita = models.ForeignKey(
        'Agendarcita',
        models.DO_NOTHING,
        db_column='AgendarCita_idAgendarCita',
        related_name='metodopagos'  # <-- Cambia esto
    )

    class Meta:
        managed = False
        db_table = 'metodopago'


class Perfiles(models.Model):
    idperfiles = models.AutoField(db_column='IdPerfiles', primary_key=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', unique=True, max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'perfiles'


class Registroproducto(models.Model):
    idregistroproducto = models.AutoField(db_column='idRegistroProducto', primary_key=True)  # Field name made lowercase.
    imagen = models.TextField(db_column='Imagen')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=255)  # Field name made lowercase.
    precio = models.CharField(db_column='Precio', max_length=50)  # Field name made lowercase.
    perfiles_idperfiles = models.ForeignKey(Perfiles, models.DO_NOTHING, db_column='Perfiles_IdPerfiles')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'registroproducto'


class Servicios(models.Model):
    idservicios = models.AutoField(db_column='IdServicios', primary_key=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=255)  # Field name made lowercase.
    precio = models.IntegerField(db_column='Precio')  # Field name made lowercase.
    imagenproducto = models.TextField(db_column='ImagenProducto')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'servicios'


class Usuarios(models.Model):
    idusuarios = models.AutoField(db_column='IdUsuarios', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=50)  # Field name made lowercase.
    apellido = models.CharField(db_column='Apellido', max_length=60)  # Field name made lowercase.
    tipodocumento = models.IntegerField(db_column='TipoDocumento')  # Field name made lowercase.
    numerodocumento = models.BigIntegerField(db_column='NumeroDocumento', unique=True)  # Field name made lowercase.
    correo = models.CharField(db_column='Correo', max_length=100)  # Field name made lowercase.
    contraseña = models.CharField(db_column='Contraseña', max_length=45)  # Field name made lowercase.
    celular = models.CharField(max_length=15, db_column='Celular')
    fechanacimiento = models.DateField(db_column='FechaNacimiento') 
    perfiles_idperfiles = models.ForeignKey(Perfiles, models.DO_NOTHING, db_column='Perfiles_IdPerfiles')  
    token_recuperacion = models.CharField(max_length=100, blank=True, null=True)
    token_expira = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table='usuarios'