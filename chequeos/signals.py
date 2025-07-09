# chequeos/signals.py
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver
from .models import Chequeo, EspecificacionesEquipo

@receiver(m2m_changed, sender=Chequeo.software_instalado.through)
def actualizar_software_instalado(sender, instance, action, **kwargs):
    if action in ['post_add', 'post_remove', 'post_clear']:
        # Obtén los nombres de los softwares seleccionados
        software_nombres = instance.software_instalado.values_list('Sof_Nombre', flat=True)
        software_texto = ', '.join(software_nombres)

        try:
            # Actualiza el campo Esp_Software_Instalado en EspecificacionesEquipo
            especificaciones = EspecificacionesEquipo.objects.get(equipo=instance.Id_Equipo)
            especificaciones.Esp_Software_Instalado = software_texto
            especificaciones.save()
        except EspecificacionesEquipo.DoesNotExist:
            # Puedes omitir este error si el equipo aún no tiene especificaciones
            pass
