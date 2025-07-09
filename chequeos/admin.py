from django.contrib import admin
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
    # Asegúrate de que los campos estén bien definidos en list_display
    list_display = ('mostrar_usuario', 'mostrar_equipo', 'Che_Fecha_Chequeo')
    list_filter = ('Che_Fecha_Chequeo', 'Id_Usuario', 'Id_Equipo')  # Filtros para el admin
    search_fields = ('Id_Equipo__Equ_Placa_Serie', 'Id_Usuario__Usu_Nombre')  # Búsqueda por equipo o usuario

    def mostrar_usuario(self, obj):
        # Mostrar el nombre del usuario relacionado con el chequeo
        return obj.Id_Usuario.Usu_Nombre
    mostrar_usuario.short_description = 'Usuario'  # Etiqueta amigable en la interfaz de admin

    def mostrar_equipo(self, obj):
        # Mostrar la placa de serie del equipo relacionado con el chequeo
        return obj.Id_Equipo.Equ_Placa_Serie
    mostrar_equipo.short_description = 'Equipo'  # Etiqueta amigable en la interfaz de admin


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
    list_display = ['Equ_Placa_Serie','Area']
    search_fields = ['Equ_Placa_Serie']
    list_per_page = 10
    list_filter = (AreaDropdownFilter,)
    inlines = [EspecificacionesEquipoInline]

    def save_model(self, request, obj, form, change):
        # Guardamos el equipo
        super().save_model(request, obj, form, change)

        # 1. Crear especificaciones si no existen
        especificacion, creada = EspecificacionesEquipo.objects.get_or_create(equipo=obj)

        # 2. Buscar el último chequeo registrado para este equipo
        ultimo_chequeo = Chequeo.objects.filter(Id_Equipo=obj).order_by('-Che_Fecha_Chequeo').first()

        if ultimo_chequeo:
            # 3. Copiar los softwares del último chequeo al campo de especificaciones
            softwares_instalados = ultimo_chequeo.software_instalado.all()
            # Convertimos la lista de softwares a un string de nombres (puedes ajustarlo si quieres otro formato)
            software_nombres = ", ".join([software.Sof_Nombre for software in softwares_instalados])
            especificacion.Esp_Software_Instalado = software_nombres
            especificacion.save()

    
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
admin.site.register(Chequeo)
admin.site.register(AreaServicio)
admin.site.register(Software)
