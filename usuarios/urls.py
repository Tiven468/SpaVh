# usuarios/urls.py
from django.urls import path , include
from django.shortcuts import render # Ya lo tenías, solo para confirmar
from . import views

urlpatterns = [
    # URLs de Autenticación y Perfil
    path('login/', views.login, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('registro/', views.registro, name='registro'),
    path('cuenta/', views.cuenta, name='cuenta'),
    path('recuperar/', views.recuperar_contraseña, name='recuperar_contraseña'),
    path('recuperar/nueva/<str:token>/', views.nueva_contraseña, name='nueva_contraseña'),

    # URLs de Administración General
    path('', views.adminbase, name='adminbase'), # La página base del admin
    path('adminpage/', views.adminpage, name='adminpage'), # Tu página de admin con el JSON de citas
    
    # URLs de Gestión de Usuarios
    path('listausuarios/', views.listausuarios, name='listausuarios'),
    path('editar_usuario/<int:idusuarios>/', views.editar_usuario, name='editar_usuario'),
    path('eliminar_usuario/<int:idusuarios>/', views.eliminar_usuario, name='eliminar_usuario'),
    path('crear_usuario/', views.crear_usuario, name='crear_usuario'),
    
    # URLs de Gestión de Citas
    path('agendar/', views.agendar, name='agendar'), # Para que los usuarios agenden citas
    path('citas/', views.listar_citas, name='listar_citas'), # Para que el admin liste citas

    # --- NUEVAS URLs para la Gestión de Servicios (Admin CRUD) ---
    path('servicios/admin/', views.servicio_admin_list, name='servicio_admin_list'),
    path('servicios/crear/', views.servicio_create, name='servicio_create'),
    path('servicios/editar/<int:pk>/', views.servicio_update, name='servicio_update'),
    path('servicios/eliminar/<int:pk>/', views.servicio_delete, name='servicio_delete'),
]