# chequeos/apps.py

from django.apps import AppConfig

class ChequeosConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'chequeos'

    def ready(self):
        import chequeos.signals  # ← activa las señales
