from django import forms
from .models import Usuario, AreaServicio, Equipo, Chequeo, Software, EspecificacionesEquipo

# ------------------ Base para los styling ------------------
class BootstrapModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(BootstrapModelForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})

# ------------------ Formularios ------------------
class UsuarioForm(BootstrapModelForm):
    class Meta:
        model = Usuario
        fields = '__all__'
        labels = {
            'Usu_Nombre': 'Nombre',
            'Usu_Cargo': 'Cargo',
        }

class AreaServicioForm(BootstrapModelForm):
    class Meta:
        model = AreaServicio
        fields = '__all__'
        labels = {
            'NombreArea': 'Nombre del Área',
        }

class EquipoForm(BootstrapModelForm):
    class Meta:
        model = Equipo
        fields = '__all__'
        labels = {
            'Equ_Placa_Serie': 'Placa o Serie del Equipo',
            'Area': 'Área o Servicio',
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['Area'].queryset = AreaServicio.objects.all()


class ChequeoForm(BootstrapModelForm):
    class Meta:
        model = Chequeo
        fields = '__all__'
        labels = {
            'Id_Usuario': 'Usuario',
            'Id_Equipo': 'Equipo',
            'Che_Fecha_Chequeo': 'Fecha de Chequeo',
            'Che_Observaciones': 'Observaciones',
        }

class SoftwareForm(BootstrapModelForm):
    class Meta:
        model = Software
        fields = '__all__'
        labels = {
            'NombreSoftware': 'Nombre del Software',
            'Licencia': 'Tipo de Licencia',
        }

class EspecificacionesEquipoForm(BootstrapModelForm):
    software_instalado = forms.ModelMultipleChoiceField(
        queryset=Software.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=False,
        label="Software Instalado"
    )

    class Meta:
        model = EspecificacionesEquipo
        fields = '__all__'
        labels = {
            'Id_Equipo': 'Equipo',
            'Esp_Procesador': 'Procesador',
            'Esp_Disco_Duro': 'Disco Duro',
            'Esp_Tipo_Disco': 'Tipo de Disco',
            'Esp_Sistema_Operativo': 'Sistema Operativo',
            'Esp_Version_SO': 'Versión del SO',
            'Esp_Licencia_SO': 'Licencia del SO',
            'Esp_Memoria_RAM': 'Memoria RAM',
            'Esp_Tarjeta_Video': 'Tarjeta de Video',
            'Esp_Conectividad_Red': 'Conectividad de Red',
            'Esp_Estado_Bateria': 'Estado de la Batería',
            'Esp_Puertos_Disponibles': 'Puertos Disponibles',
        }

    def clean_Id_Equipo(self):
        equipo = self.cleaned_data['Id_Equipo']
        if EspecificacionesEquipo.objects.filter(Id_Equipo=equipo).exclude(pk=self.instance.pk).exists():
            raise forms.ValidationError("Ya existe una especificación registrada para este equipo.")
        return equipo

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance.pk:
            self.fields['software_instalado'].initial = Software.objects.filter(
                equiposoftware__equipo=self.instance.Id_Equipo
            )