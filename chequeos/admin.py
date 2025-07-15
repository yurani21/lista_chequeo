from django.contrib import admin
from django.urls import reverse
from django.utils.html import format_html
from django.contrib.auth.models import User
from django import forms
from dal import autocomplete
from django.db import models
from django.forms import TextInput

from .models import (
    Usuario,
    AreaServicio,
    Equipo,
    Chequeo,
    Software,
    EspecificacionesEquipo,
)

# ------------------------
# ADMIN: SOFTWARE
# ------------------------

class SoftwareAdmin(admin.ModelAdmin):
    list_display = ('Sof_Nombre', 'Sof_Tipo')
    search_fields = ('Sof_Nombre',)

# ------------------------
# ADMIN: CHEQUEO
# ------------------------

class ChequeoAdmin(admin.ModelAdmin):
    autocomplete_fields = ['Id_Equipo']
    list_display = ('mostrar_usuario', 'mostrar_equipo', 'Che_Fecha_Chequeo',)
    list_filter = ('Che_Fecha_Chequeo', 'Id_Usuario', 'Id_Equipo')  
    search_fields = ('Id_Equipo__Equ_Placa_Serie', 'Id_Usuario__Usu_Nombre')  
    list_per_page = 10
    def mostrar_usuario(self, obj):
        # Mostrar el nombre del usuario relacionado con el chequeo
        return obj.Id_Usuario.Usu_Nombre
    mostrar_usuario.short_description = 'Usuario'  

    def mostrar_equipo(self, obj):
        # Mostrar la placa de serie del equipo relacionado con el chequeo
        return obj.Id_Equipo.Equ_Placa_Serie
    mostrar_equipo.short_description = 'Equipo'  


# ------------------------
# FILTRO PERSONALIZADO: ÁREA
# ------------------------
class AreaDropdownFilter(admin.SimpleListFilter):
    title = 'Área'
    parameter_name = 'area'

    def lookups(self, request, model_admin):
        return [(area.pk, area.Nombre_Area) for area in AreaServicio.objects.all()]

    def queryset(self, request, queryset):
        if self.value():
            return queryset.filter(Area__pk=self.value())
        return queryset

# ------------------------
# INLINE: ESPECIFICACIONES DEL EQUIPO
# ------------------------
class EspecificacionesEquipoInline(admin.StackedInline):
    model = EspecificacionesEquipo
    fk_name = 'equipo'
    can_delete = False
    verbose_name_plural = "Especificaciones del equipo"
    extra = 0
    fields = [
        'Esp_Procesador', 'Esp_Memoria_RAM', 'Esp_Disco_Duro', 'Esp_Tipo_Disco',
        'Esp_Sistema_Operativo', 'Esp_Version_SO', 'Esp_Licencia_SO',
        'Esp_Tarjeta_Video', 'Esp_Estado_Bateria', 'Esp_SO_Actualizado',
        'Esp_Antivirus', 'Esp_Antivirus_Actualizado', 'Esp_Estado_Equipo',
        'Esp_Conectividad_Red', 'Esp_Software_Instalado', 'Esp_Observaciones'
    ]

    def has_add_permission(self, request, obj=None):
        # No permitir agregar si ya existe una especificación para este equipo
        if obj and EspecificacionesEquipo.objects.filter(equipo=obj).exists():
            return False
        return True

# ------------------------
# ADMIN: EQUIPO
# ------------------------

class EquipoAdmin(admin.ModelAdmin):
    formfield_overrides = {
        models.CharField: {'widget': TextInput(attrs={'maxlength': '15'})},
    }

    list_display = ['Equ_Placa_Serie', 'Area', 'ver_especificaciones']
    search_fields = ['Equ_Placa_Serie']
    list_per_page = 10
    list_filter = (AreaDropdownFilter,)

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "Id_Usuario":
            kwargs["queryset"] = User.objects.filter(groups__name="Sistemas")
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def nombre_tecnico(self, obj):
        return obj.Id_Usuario.get_full_name() if obj.Id_Usuario else "No registrado"
    nombre_tecnico.short_description = "Técnico"

    def get_inline_instances(self, request, obj=None):
        if obj and EspecificacionesEquipo.objects.filter(equipo=obj).exists():
            return []  # No mostrar inline si ya hay especificaciones
        return [EspecificacionesEquipoInline(self.model, self.admin_site)]

    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)
        especificacion, creada = EspecificacionesEquipo.objects.get_or_create(equipo=obj)
        ultimo_chequeo = Chequeo.objects.filter(Id_Equipo=obj).order_by('-Che_Fecha_Chequeo').first()
        if ultimo_chequeo:
            software_nombres = ", ".join(s.Sof_Nombre for s in ultimo_chequeo.software_instalado.all())
            especificacion.Esp_Software_Instalado = software_nombres
            especificacion.save()

    def ver_especificaciones(self, obj):
        try:
            especificacion = obj.especificacionesequipo
            url = reverse("admin:chequeos_especificacionesequipo_change", args=[especificacion.id])
            return format_html('<a class="button" href="{}">Editar especificaciones</a>', url)
        except EspecificacionesEquipo.DoesNotExist:
            return "No registradas"
    ver_especificaciones.short_description = "Especificaciones"

class EspecificacionesEquipoForm(forms.ModelForm):
    class Meta:
        model = EspecificacionesEquipo
        fields = '__all__'
        widgets = {
            'equipo': autocomplete.ModelSelect2(url='/sistemas/equipo-autocomplete/')
        }

class EspecificacionesEquipoAdmin(admin.ModelAdmin):
    form = EspecificacionesEquipoForm
    list_display = ('mostrar_equipo', 'mostrar_usuario')
    list_per_page = 10
    search_fields = [
        'usuario__username', 
        'usuario__first_name', 
        'usuario__last_name',
        'equipo__Equ_Placa_Serie',
    ]

    def mostrar_usuario(self, obj):
        if obj.usuario:
            nombre_completo = obj.usuario.get_full_name()
            return nombre_completo if nombre_completo else obj.usuario.username
        return "No registrado"
    mostrar_usuario.short_description = 'Técnico'

    def mostrar_equipo(self, obj):  
        return obj.equipo.Equ_Placa_Serie
    mostrar_equipo.short_description = 'Equipo'

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "usuario":
            kwargs["queryset"] = User.objects.all()
        return super().formfield_for_foreignkey(db_field, request, **kwargs)



# ------------------------
# ADMIN: ÁREA Y USUARIO
# ------------------------

class AreaServicioAdmin(admin.ModelAdmin):
    list_display = ['Nombre_Area']
    search_fields = ['Nombre_Area']


class UsuarioAdmin(admin.ModelAdmin):
    list_display = ['Usu_Nombre', 'Usu_Cargo']
    search_fields = ['Usu_Nombre', 'Usu_Cargo']

#_________________________Registros____________________________
admin.site.register(Equipo, EquipoAdmin)
admin.site.register(Chequeo, ChequeoAdmin)
admin.site.register(AreaServicio)
admin.site.register(Software)
admin.site.register(EspecificacionesEquipo, EspecificacionesEquipoAdmin) 
admin.site.register(Usuario)


