from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='home'),
    path('servicios/', views.servicios, name='servicios'),
    path('quienessomos/', views.quienessomos, name='quienessomos'),
    path('contactenos/', views.contactenos, name='contactenos')

]
