from django.urls import path
from . import views

urlpatterns = [
    # ------------------ USUARIOS ------------------
    path('usuarios/', views.usuario_list, name='usuario_list'),
    path('usuarios/create/', views.usuario_create, name='usuario_create'),
    path('usuarios/<int:pk>/update/', views.usuario_update, name='usuario_update'),
    path('usuarios/<int:pk>/delete/', views.usuario_delete, name='usuario_delete'),

    # ------------------ ÁREAS DE SERVICIO ------------------
    path('areas/', views.area_list, name='area_list'),
    path('areas/create/', views.area_create, name='area_create'),
    path('areas/<int:pk>/update/', views.area_update, name='area_update'),
    path('areas/<int:pk>/delete/', views.area_delete, name='area_delete'),

    # ------------------ EQUIPOS ------------------
    path('equipos/', views.equipo_list, name='equipo_list'),
    path('equipos/create/', views.equipo_create, name='equipo_create'),
    path('equipos/<int:pk>/update/', views.equipo_update, name='equipo_update'),
    path('equipos/<int:pk>/delete/', views.equipo_delete, name='equipo_delete'),

    # ------------------ CHEQUEOS ------------------
    path('chequeos/', views.chequeo_list, name='chequeo_list'),
    path('chequeos/create/', views.chequeo_create, name='chequeo_create'),
    path('chequeos/<int:pk>/update/', views.chequeo_update, name='chequeo_update'),
    path('chequeos/<int:pk>/delete/', views.chequeo_delete, name='chequeo_delete'),

    # ------------------ SOFTWARE ------------------
    path('softwares/', views.software_list, name='software_list'),
    path('softwares/create/', views.software_create, name='software_create'),
    path('softwares/<int:pk>/update/', views.software_update, name='software_update'),
    path('softwares/<int:pk>/delete/', views.software_delete, name='software_delete'),

    # ------------------ EQUIPO - SOFTWARE (RELACIÓN) ------------------
    path('equiposoftware/', views.equiposoftware_list, name='equiposoftware_list'),
    path('equiposoftware/create/', views.equiposoftware_create, name='equiposoftware_create'),
    path('equiposoftware/<int:id_equipo>/<int:id_software>/update/', views.equiposoftware_update, name='equiposoftware_update'),
    path('equiposoftware/<int:id_equipo>/<int:id_software>/delete/', views.equiposoftware_delete, name='equiposoftware_delete'),

    # ------------------ ESPECIFICACIONES DE EQUIPO ------------------
    path('especificaciones/', views.especificaciones_list, name='especificaciones_list'),
    path('especificaciones/create/', views.especificaciones_create, name='especificaciones_create'),
    path('especificaciones/<int:pk>/update/', views.especificaciones_update, name='especificaciones_update'),
    path('especificaciones/<int:pk>/delete/', views.especificaciones_delete, name='especificaciones_delete'),
]
