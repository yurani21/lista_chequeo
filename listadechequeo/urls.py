from django.contrib import admin
from django.urls import path, include
from chequeos.views import redireccion_usuario

urlpatterns = [
    path('', redireccion_usuario, name='inicio'),  
    path('admin/', admin.site.urls),               # Coordinador
    path('sistemas/', include('chequeos.urls')),   # Técnicos
]

