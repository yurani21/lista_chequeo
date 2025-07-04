from django.db import models

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
    Equ_Placa_Serie = models.CharField(max_length=100, unique=True)
    Area = models.ForeignKey('AreaServicio', on_delete=models.CASCADE, default=1)

    def __str__(self):
        return self.Equ_Placa_Serie


class Chequeo(models.Model):
    Id_Chequeo = models.AutoField(primary_key=True)
    Id_Usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE, db_column='Id_Usuario')
    Id_Equipo = models.ForeignKey(Equipo, on_delete=models.CASCADE, db_column='Id_Equipo')
    Che_Fecha_Chequeo = models.DateField()
    Che_Observaciones = models.TextField(null=True, blank=True)

    def __str__(self):
        return f'{self.Id_Usuario} - {self.Che_Fecha_Chequeo}'

class Software(models.Model):
    Sof_Nombre = models.CharField(max_length=100)
    Sof_Tipo = models.CharField(max_length=100)

    def __str__(self):
        return self.Sof_Nombre

class EspecificacionesEquipo(models.Model):
    # Django generará automáticamente el campo 'id' como clave primaria
    Equipo = models.OneToOneField(
        'Equipo',
        on_delete=models.CASCADE,
        db_column='Id_Equipo',
        primary_key=True
    )

    Esp_Procesador = models.CharField("Procesador", max_length=100, null=True, blank=True)
    Esp_Disco_Duro = models.CharField("Disco Duro", max_length=100, null=True, blank=True)
    Esp_Tipo_Disco = models.CharField("Tipo de Disco", max_length=50, null=True, blank=True)
    Esp_Sistema_Operativo = models.CharField("Sistema Operativo", max_length=100, null=True, blank=True)
    Esp_Version_SO = models.CharField("Versión del SO", max_length=50, null=True, blank=True)
    Esp_Licencia_SO = models.CharField("Licencia del SO", max_length=100, null=True, blank=True)
    Esp_Memoria_RAM = models.CharField("Memoria RAM", max_length=100, null=True, blank=True)
    Esp_Tarjeta_Video = models.CharField("Tarjeta de Video", max_length=100, null=True, blank=True)
    Esp_Puertos_Disponibles = models.TextField("Puertos Disponibles", null=True, blank=True)
    Esp_SO_Actualizado = models.CharField("¿Tiene actualizaciones del SO?", max_length=100, null=True, blank=True)
    Esp_Antivirus = models.CharField("Antivirus Instalado", max_length=100, null=True, blank=True)
    Esp_Antivirus_Actualizado = models.CharField("¿Antivirus actualizado?", max_length=100, null=True, blank=True)
    Esp_Software_Instalado = models.TextField("Software Instalado", null=True, blank=True)
    Esp_Estado_Equipo = models.CharField("Estado del Equipo", max_length=100, null=True, blank=True)
    Esp_Estado_Bateria = models.CharField("Estado de la Batería", max_length=100, null=True, blank=True)
    Esp_Observaciones = models.TextField("Observaciones generales", null=True, blank=True)

    def __str__(self):
        return f"Especificaciones del equipo {self.Equipo_id}"

    class Meta:
        db_table = 'chequeos_especificacionesequipo'
