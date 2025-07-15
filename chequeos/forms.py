from django import forms
from .models import Usuario, AreaServicio, Equipo, Chequeo, Software, EspecificacionesEquipo

# ------------------ Base con Bootstrap ------------------
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
            'Nombre_Area': 'Nombre del Área',
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
    software_instalado = forms.ModelMultipleChoiceField(
        queryset=Software.objects.all(),
        widget=forms.CheckboxSelectMultiple(attrs={'class': 'form-check-input'}),
        required=False,
        label='Software Instalado'
    )

    class Meta:
        model = Chequeo
        fields = [
            'Id_Usuario',
            'Id_Equipo',
            'Che_Fecha_Chequeo',
            'Che_Observaciones',
            'software_instalado',
        ]
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
            'Sof_Nombre': 'Nombre del Software',
            'Sof_Tipo': 'Tipo de Licencia',
        }


class BootstrapModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(BootstrapModelForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})

class EspecificacionesEquipoForm(BootstrapModelForm):
    class Meta:
        model = EspecificacionesEquipo
        exclude = ['usuario']
        fields = '__all__'
        labels = {
            'Equipo': 'Equipo',
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
            'Esp_SO_Actualizado': 'Sistema Operativo Actualizado',
            'Esp_Antivirus': 'Antivirus',
            'Esp_Antivirus_Actualizado': 'Antivirus Actualizado',
            'Esp_Estado_Equipo': 'Estado del Equipo',
            'Esp_Observaciones': 'Observaciones',
            'Esp_Software_Instalado': 'Software Instalado',
        }
        widgets = {
            'Esp_SO_Actualizado': forms.Select(attrs={'class': 'form-control'}),
            'Esp_Antivirus': forms.Select(attrs={'class': 'form-control'}),
            'Esp_Antivirus_Actualizado': forms.Select(attrs={'class': 'form-control'}),
        }

    def clean_Equipo(self):
        equipo = self.cleaned_data['Equipo']
        if EspecificacionesEquipo.objects.filter(Equipo=equipo).exclude(pk=self.instance.pk).exists():
            raise forms.ValidationError("Ya existe una especificación registrada para este equipo.")
        return equipo

    # 👉 Método para dejar el campo de software solo lectura
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Hacer el campo 'Esp_Software_Instalado' solo lectura
        self.fields['Esp_Software_Instalado'].widget.attrs['readonly'] = True