from django.shortcuts import render, get_object_or_404, redirect
from .models import Usuario, AreaServicio, Equipo, Chequeo, Software, EquipoSoftware, EspecificacionesEquipo
from .forms import UsuarioForm, AreaServicioForm, EquipoForm, ChequeoForm, SoftwareForm, EquipoSoftwareForm, EspecificacionesEquipoForm
from django.urls import reverse


# ----------------------------- USUARIO -----------------------------
def usuario_list(request):
    usuarios = Usuario.objects.all()
    return render(request, 'chequeos/usuario_list.html', {'usuarios': usuarios})

def usuario_create(request):
    form = UsuarioForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('usuario_list')
    return render(request, 'chequeos/usuario_form.html', {
        'form': form,
        'title': 'Crear Usuario',
        'cancel_url': reverse('usuario_list'),
    })

def usuario_update(request, pk):
    usuario = get_object_or_404(Usuario, pk=pk)
    form = UsuarioForm(request.POST or None, instance=usuario)
    if form.is_valid():
        form.save()
        return redirect('usuario_list')
    return render(request, 'chequeos/usuario_form.html', {
        'form': form,
        'title': 'Editar Usuario',
        'cancel_url': reverse('usuario_list'),
    })

def usuario_delete(request, pk):
    usuario = get_object_or_404(Usuario, pk=pk)
    if request.method == 'POST':
        usuario.delete()
        return redirect('usuario_list')
    return render(request, 'chequeos/usuario_confirm_delete.html', {'object': usuario})

# ----------------------------- AREA SERVICIO -----------------------------
def area_list(request):
    areas = AreaServicio.objects.all()
    return render(request, 'chequeos/area_list.html', {'areas': areas})

def area_create(request):
    form = AreaServicioForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('area_list')
    return render(request, 'chequeos/area_form.html', {
        'form': form,
        'title': 'Crear Área de Servicio',
        'cancel_url': reverse('area_list'),
    })

def area_update(request, pk):
    area = get_object_or_404(AreaServicio, pk=pk)
    form = AreaServicioForm(request.POST or None, instance=area)
    if form.is_valid():
        form.save()
        return redirect('area_list')
    return render(request, 'chequeos/area_form.html', {
        'form': form,
        'title': 'Editar Área de Servicio',
        'cancel_url': reverse('area_list'),
    })

def area_delete(request, pk):
    area = get_object_or_404(AreaServicio, pk=pk)
    if request.method == 'POST':
        area.delete()
        return redirect('area_list')
    return render(request, 'chequeos/area_confirm_delete.html', {'object': area})

# ----------------------------- EQUIPO -----------------------------
def equipo_list(request):
    equipos = Equipo.objects.select_related('Area').all()
    return render(request, 'chequeos/equipo_list.html', {'equipos': equipos})

def equipo_create(request):
    if request.method == 'POST':
        form = EquipoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('equipo_list')
    else:
        form = EquipoForm()
    return render(request, 'chequeos/equipo_form.html', {'form': form})

def equipo_update(request, pk):
    equipo = get_object_or_404(Equipo, pk=pk)
    if request.method == 'POST':
        form = EquipoForm(request.POST, instance=equipo)
        if form.is_valid():
            form.save()
            return redirect('equipo_list')
    else:
        form = EquipoForm(instance=equipo)
    return render(request, 'chequeos/equipo_form.html', {'form': form})

def equipo_delete(request, pk):
    equipo = get_object_or_404(Equipo, pk=pk)
    if request.method == 'POST':
        equipo.delete()
        return redirect('equipo_list')
    return render(request, 'chequeos/equipo_confirm_delete.html', {'equipo': equipo})

# ----------------------------- CHEQUEO -----------------------------

def chequeo_list(request):
    chequeos = Chequeo.objects.select_related('Id_Usuario', 'Id_Equipo__Area').all()
    return render(request, 'chequeos/chequeo_list.html', {'chequeos': chequeos})

def chequeo_create(request):
    if request.method == 'POST':
        form = ChequeoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('chequeo_list')
    else:
        form = ChequeoForm()
    return render(request, 'chequeos/chequeo_form.html', {'form': form})

def chequeo_update(request, pk):
    chequeo = get_object_or_404(Chequeo, pk=pk)
    if request.method == 'POST':
        form = ChequeoForm(request.POST, instance=chequeo)
        if form.is_valid():
            form.save()
            return redirect('chequeo_list')
    else:
        form = ChequeoForm(instance=chequeo)
    return render(request, 'chequeos/chequeo_form.html', {'form': form})

def chequeo_delete(request, pk):
    chequeo = get_object_or_404(Chequeo, pk=pk)
    if request.method == 'POST':
        chequeo.delete()
        return redirect('chequeo_list')
    return render(request, 'chequeos/chequeo_confirm_delete.html', {'object': chequeo})
# ----------------------------- SOFTWARE -----------------------------
def software_list(request):
    softwares = Software.objects.all()
    return render(request, 'chequeos/software_list.html', {'softwares': softwares})

def software_create(request):
    form = SoftwareForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('software_list')
    return render(request, 'chequeos/software_form.html', {
        'form': form,
        'title': 'Registrar Software',
        'cancel_url': reverse('software_list'),
    })

def software_update(request, pk):
    software = get_object_or_404(Software, pk=pk)
    form = SoftwareForm(request.POST or None, instance=software)
    if form.is_valid():
        form.save()
        return redirect('software_list')
    return render(request, 'chequeos/software_form.html', {
        'form': form,
        'title': 'Editar Software',
        'cancel_url': reverse('software_list'),
    })

def software_delete(request, pk):
    software = get_object_or_404(Software, pk=pk)
    if request.method == 'POST':
        software.delete()
        return redirect('software_list')
    return render(request, 'chequeos/software_confirm_delete.html', {'object': software})

# ----------------------------- EQUIPO SOFTWARE -----------------------------
def equiposoftware_list(request):
    relaciones = EquipoSoftware.objects.all()
    return render(request, 'chequeos/equiposoftware_list.html', {'relaciones': relaciones})

def equiposoftware_create(request):
    form = EquipoSoftwareForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('equiposoftware_list')
    return render(request, 'chequeos/equiposoftware_form.html', {
        'form': form,
        'title': 'Asignar Software a Equipo',
        'cancel_url': reverse('equiposoftware_list'),
    })

def equiposoftware_update(request, id_equipo, id_software):
    relacion = get_object_or_404(EquipoSoftware, Id_Equipo=id_equipo, Id_Software=id_software)
    form = EquipoSoftwareForm(request.POST or None, instance=relacion)
    if form.is_valid():
        form.save()
        return redirect('equiposoftware_list')
    return render(request, 'chequeos/equiposoftware_form.html', {
        'form': form,
        'title': 'Editar Relación Equipo-Software',
        'cancel_url': reverse('equiposoftware_list'),
    })

def equiposoftware_delete(request, id_equipo, id_software):
    relacion = get_object_or_404(EquipoSoftware, Id_Equipo=id_equipo, Id_Software=id_software)
    if request.method == 'POST':
        relacion.delete()
        return redirect('equiposoftware_list')
    return render(request, 'chequeos/equiposoftware_confirm_delete.html', {'object': relacion})

# ----------------------------- ESPECIFICACIONES EQUIPO -----------------------------
def especificaciones_list(request):
    especificaciones = EspecificacionesEquipo.objects.all()
    return render(request, 'chequeos/especificaciones_list.html', {'especificaciones': especificaciones})

def especificaciones_create(request):
    form = EspecificacionesEquipoForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('especificaciones_list')
    return render(request, 'chequeos/especificaciones_form.html', {
        'form': form,
        'title': 'Registrar Especificaciones',
        'cancel_url': reverse('especificaciones_list'),
    })

def especificaciones_update(request, pk):
    especificacion = get_object_or_404(EspecificacionesEquipo, pk=pk)
    form = EspecificacionesEquipoForm(request.POST or None, instance=especificacion)
    if form.is_valid():
        form.save()
        return redirect('especificaciones_list')
    return render(request, 'chequeos/especificaciones_form.html', {
        'form': form,
        'title': 'Editar Especificaciones',
        'cancel_url': reverse('especificaciones_list'),
    })

def especificaciones_delete(request, pk):
    especificacion = get_object_or_404(EspecificacionesEquipo, pk=pk)
    if request.method == 'POST':
        especificacion.delete()
        return redirect('especificaciones_list')
    return render(request, 'chequeos/especificaciones_confirm_delete.html', {'object': especificacion})


