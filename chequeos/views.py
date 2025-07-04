from django.shortcuts import render, get_object_or_404, redirect
from .models import Usuario, AreaServicio, Equipo, Chequeo, Software, EspecificacionesEquipo
from .forms import UsuarioForm, AreaServicioForm, EquipoForm, ChequeoForm, SoftwareForm, EspecificacionesEquipoForm
from django.urls import reverse
from django.contrib.auth.decorators import login_required



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

def area_update(request, id):
    area = get_object_or_404(AreaServicio, pk=id)
    if request.method == 'POST':
        form = AreaServicioForm(request.POST, instance=area)
        if form.is_valid():
            form.save()
            return redirect('area_list')
    else:
        form = AreaServicioForm(instance=area)
    return render(request, 'chequeos/area_form.html', {'form': form})

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
    if request.method == 'POST':
        form = SoftwareForm(request.POST)
        if form.is_valid():
            form.save()

            # Detectar qué botón se presionó
            if '_save' in request.POST:
                # Guardar y volver a la lista
                return redirect('software_list')
            elif '_addanother' in request.POST:
                # Guardar y añadir otro
                return redirect('software_create')
            elif '_continue' in request.POST:
                # Guardar y continuar editando (puedes ajustar)
                return redirect('software_edit', pk=form.instance.pk)
    else:
        form = SoftwareForm()
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

# ----------------------------- ESPECIFICACIONES EQUIPO -----------------------------
def especificaciones_list(request):
    especificaciones = EspecificacionesEquipo.objects.all()
    return render(request, 'chequeos/especificaciones_list.html', {'especificaciones': especificaciones})

def especificaciones_create(request, equipo_id):
    equipo = get_object_or_404(Equipo, pk=equipo_id)

    # 🚨 Validación: Si ya existen especificaciones para ese equipo, redirigir o editar
    if EspecificacionesEquipo.objects.filter(Equipo=equipo).exists():
        messages.warning(request, "Este equipo ya tiene especificaciones registradas.")
        return redirect('especificaciones_update', pk=equipo_id)  # Ajusta según tu URL

    if request.method == 'POST':
        form = EspecificacionesForm(request.POST)
        if form.is_valid():
            especificacion = form.save(commit=False)
            especificacion.Equipo = equipo
            especificacion.save()
            messages.success(request, "Especificaciones guardadas correctamente.")
            return redirect('especificaciones_list')  # Ajusta según tus rutas
    else:
        form = EspecificacionesForm()

    return render(request, 'chequeos/especificaciones_form.html', {
        'form': form,
        'equipo': equipo,
    })


def especificaciones_update(request, pk):
    especificacion = get_object_or_404(EspecificacionesEquipo, Equipo_id=pk)
    if request.method == 'POST':
        form = EspecificacionesForm(request.POST, instance=especificacion)
        if form.is_valid():
            form.save()
            return redirect('especificaciones_list')
    else:
        form = EspecificacionesForm(instance=especificacion)
    return render(request, 'chequeos/especificaciones_form.html', {'form': form})


def especificaciones_delete(request, pk):
    especificacion = get_object_or_404(EspecificacionesEquipo, pk=pk)
    if request.method == 'POST':
        especificacion.delete()
        return redirect('especificaciones_list')
    return render(request, 'chequeos/especificaciones_confirm_delete.html', {'object': especificacion})

def obtener_info_equipo(request):
    nombre_equipo = request.GET.get('equipo')
    try:
        equipo = Equipo.objects.get(Equ_Placa_Serie=nombre_equipo)  # CAMBIADO AQUI
        data = {
            'placa': equipo.Equ_Placa_Serie,
            'area': str(equipo.Area),
        }
        return JsonResponse(data)
    except Equipo.DoesNotExist:
        return JsonResponse({'error': 'Equipo no encontrado'}, status=404)


@login_required
def redireccion_usuario(request):
    if request.user.is_superuser:
        return redirect('/')
    else:
        return redirect('/sistemas/')