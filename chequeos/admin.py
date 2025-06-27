from django.contrib import admin
from .models import (
    Usuario,
    AreaServicio,
    Equipo,
    Chequeo,
    Software,
    EquipoSoftware,
    EspecificacionesEquipo,
)

admin.site.register(Usuario)
admin.site.register(AreaServicio)
admin.site.register(Equipo)
admin.site.register(Chequeo)
admin.site.register(Software)
admin.site.register(EquipoSoftware)
admin.site.register(EspecificacionesEquipo)


