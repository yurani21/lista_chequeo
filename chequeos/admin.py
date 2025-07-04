from django.contrib import admin
from .models import (
    Usuario,
    AreaServicio,
    Equipo,
    Chequeo,
    Software,
    EspecificacionesEquipo,
)

# Inline personalizado para Especificaciones
class EspecificacionesEquipoInline(admin.StackedInline):
    model = EspecificacionesEquipo
    can_delete = False
    verbose_name_plural = "Especificaciones del equipo"
    extra = 0

    def has_add_permission(self, request, obj=None):
        if obj and EspecificacionesEquipo.objects.filter(Equipo=obj).exists():
            return False  # No permitir agregar si ya existe
        return True

    def has_change_permission(self, request, obj=None):
        return True


# Admin personalizado para Equipo con inline controlado
@admin.register(Equipo)
class EquipoAdmin(admin.ModelAdmin):
    def get_inline_instances(self, request, obj=None):
        if obj is None:
            return []  # No mostrar inline en nuevo equipo
        inlines = []
        inlines.append(EspecificacionesEquipoInline(self.model, self.admin_site))
        return inlines



# Registro de los demás modelos
admin.site.register(Usuario)
admin.site.register(AreaServicio)
admin.site.register(Chequeo)
admin.site.register(Software)
