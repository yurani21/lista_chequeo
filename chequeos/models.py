from django.db import models
# from .especificaciones import EspecificacionesEquipo

# from chequeos.models import Equipo


class Usuario(models.Model):
    Id_Usuario = models.AutoField(primary_key=True)
    Usu_Nombre = models.CharField(max_length=100)
    Usu_Cargo = models.CharField(max_length=50, null=True, blank=True)

    def __str__(self):
        return self.Usu_Nombre


class AreaServicio(models.Model):
    Id_Area = models.AutoField(primary_key=True)
    Nombre_Area = models.CharField(max_length=100)

    def __str__(self):
        return self.Nombre_Area

class Equipo(models.Model):
    Id_Equipo = models.AutoField(primary_key=True)
    Equ_Placa_Serie = models.CharField(max_length=100)
    Area = models.ForeignKey('AreaServicio', on_delete=models.CASCADE, default=1)

    def __str__(self):
        return self.Equ_Placa_Serie

class Software(models.Model):
    Sof_Nombre = models.CharField(max_length=100)
    Sof_Tipo = models.CharField(max_length=100)

    def __str__(self):
        return self.Sof_Nombre

class Chequeo(models.Model):
    Id_Chequeo = models.AutoField(primary_key=True)
    Id_Usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE, db_column='Id_Usuario', related_name='chequeos')
    Id_Equipo = models.ForeignKey(Equipo, on_delete=models.CASCADE, db_column='Id_Equipo', related_name='chequeos')
    Che_Fecha_Chequeo = models.DateField()
    Che_Observaciones = models.TextField(null=True, blank=True)
    software_instalado = models.ManyToManyField('Software', blank=True)

    def __str__(self):
        return f'{self.Id_Equipo.Equ_Placa_Serie} - {self.Che_Fecha_Chequeo.strftime("%d/%m/%Y")}'

class EspecificacionesEquipo(models.Model):
    equipo = models.OneToOneField('Equipo', on_delete=models.CASCADE, unique=True, related_name='especificacionesequipo')

    Esp_Procesador = models.CharField(max_length=100)
    Esp_Disco_Duro = models.CharField(max_length=100)
    Esp_Tipo_Disco = models.CharField(max_length=50)
    Esp_Sistema_Operativo = models.CharField(max_length=100)
    Esp_Version_SO = models.CharField(max_length=50)
    Esp_Licencia_SO = models.CharField(max_length=100)
    Esp_Memoria_RAM = models.CharField(max_length=50)
    Esp_Tarjeta_Video = models.CharField(max_length=100)
    Esp_Conectividad_Red = models.CharField(max_length=100, default="Ninguna")
    Esp_Estado_Bateria = models.CharField(max_length=50)
    Esp_SO_Actualizado = models.BooleanField(default=False)
    Esp_Antivirus = models.CharField(max_length=100, blank=True)
    Esp_Antivirus_Actualizado = models.BooleanField(default=False)
    Esp_Estado_Equipo = models.CharField(max_length=100)
    Esp_Observaciones = models.TextField(blank=True)
    Esp_Software_Instalado = models.TextField(blank=True, verbose_name="Software Instalado")

    def __str__(self):
        return f"Especificaciones - {self.equipo}"



