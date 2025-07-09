from django.shortcuts import render, get_object_or_404, redirect
from .models import Usuario, AreaServicio, Equipo, Chequeo, Software, EspecificacionesEquipo
from .forms import UsuarioForm, AreaServicioForm, EquipoForm, ChequeoForm, SoftwareForm, EspecificacionesEquipoForm
from django.urls import reverse
from django.contrib.auth.decorators import login_required, user_passes_test


def es_tecnico(user):
    return user.groups.filter(name='Técnicos').exists()

def es_administrador(user):
    return user.is_superuser or user.groups.filter(name='Administrador').exists()


# ----------------------------- USUARIO -----------------------------
@user_passes_test(es_administrador)
def usuario_list(request):
    usuarios = Usuario.objects.all()
    return render(request, 'chequeos/usuario_list.html', {'usuarios': usuarios})

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
def usuario_delete(request, pk):
    usuario = get_object_or_404(Usuario, pk=pk)
    if request.method == 'POST':
        usuario.delete()
        return redirect('usuario_list')
    return render(request, 'chequeos/usuario_confirm_delete.html', {'object': usuario})

# ----------------------------- AREA SERVICIO -----------------------------
@user_passes_test(es_administrador)
def area_list(request):
    areas = AreaServicio.objects.all()
    return render(request, 'chequeos/area_list.html', {'areas': areas})

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
def equipo_create(request):
    if request.method == 'POST':
        form = EquipoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('equipo_list')
    else:
        form = EquipoForm()
    return render(request, 'chequeos/equipo_form.html', {'form': form})

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
def equipo_delete(request, pk):
    equipo = get_object_or_404(Equipo, pk=pk)
    if request.method == 'POST':
        equipo.delete()
        return redirect('equipo_list')
    return render(request, 'chequeos/equipo_confirm_delete.html', {'equipo': equipo})

# ----------------------------- CHEQUEO -----------------------------
@user_passes_test(es_tecnico)
@login_required
def chequeo_list(request):
    chequeos = Chequeo.objects.select_related('Id_Usuario', 'Id_Equipo__Area').prefetch_related('software_instalado')
    return render(request, 'chequeos/chequeo_list.html', {'chequeos': chequeos})

@user_passes_test(es_tecnico)
def chequeo_create(request):
    if request.method == 'POST':
        form = ChequeoForm(request.POST)
        if form.is_valid():
            try:
                chequeo = form.save(commit=False)
                chequeo.save()  # Guarda la instancia primero
                form.save_m2m()  # Guarda la relación muchos a muchos
                return redirect('chequeo_list')
            except IntegrityError as e:
                print(f"Error de integridad: {e}")  # Esto te ayudará a depurar
    else:
        form = ChequeoForm()
    return render(request, 'chequeos/chequeo_form.html', {'form': form})
    
@user_passes_test(es_tecnico)
def chequeo_update(request, pk):
    chequeo = get_object_or_404(Chequeo, pk=pk)
    if request.method == 'POST':
        form = ChequeoForm(request.POST, instance=chequeo)
        if form.is_valid():
            chequeo = form.save(commit=False)
            chequeo.save()
            form.save_m2m()
            return redirect('chequeo_list')
    else:
        form = ChequeoForm(instance=chequeo)

    return render(request, 'chequeos/chequeo_form.html', {'form': form})


@user_passes_test(es_tecnico)
def chequeo_delete(request, pk):
    chequeo = get_object_or_404(Chequeo, pk=pk)
    if request.method == 'POST':
        chequeo.delete()
        return redirect('chequeo_list')
    return render(request, 'chequeos/chequeo_confirm_delete.html', {'object': chequeo})

# ----------------------------- SOFTWARE -----------------------------
@user_passes_test(es_administrador)
def software_list(request):
    softwares = Software.objects.all()
    return render(request, 'chequeos/software_list.html', {'softwares': softwares})

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
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

@user_passes_test(es_administrador)
def software_delete(request, pk):
    software = get_object_or_404(Software, pk=pk)
    if request.method == 'POST':
        software.delete()
        return redirect('software_list')
    return render(request, 'chequeos/software_confirm_delete.html', {'object': software})

# ----------------------------- ESPECIFICACIONES EQUIPO -----------------------------
@user_passes_test(es_administrador)
def especificaciones_list(request):
    especificaciones = EspecificacionesEquipo.objects.all()
    return render(request, 'chequeos/especificaciones_list.html', {'especificaciones': especificaciones})

@user_passes_test(es_administrador)
def especificaciones_create(request):
    equipo_id = request.GET.get('equipo')
    print("🔍 equipo_id recibido:", equipo_id)  # Verifica que llega el ID

    initial_data = {}

    if equipo_id:
        try:
            equipo = Equipo.objects.get(pk=equipo_id)
            print("Equipo encontrado:", equipo)

            initial_data['Equipo'] = equipo

            ultimo_chequeo = Chequeo.objects.filter(Id_Equipo=equipo).order_by('-Che_Fecha_Chequeo').first()
            if ultimo_chequeo:
                print("Último chequeo:", ultimo_chequeo)

                software_nombres = ", ".join(s.Sof_Nombre for s in ultimo_chequeo.software_instalado.all())
                print("Software detectado:", software_nombres)

                initial_data['Esp_Software_Instalado'] = software_nombres
            else:
                print("No se encontró ningún chequeo.")
        except Equipo.DoesNotExist:
            print("Equipo no encontrado")

    # Crear el formulario con los datos iniciales
    if request.method == 'POST':
        form = EspecificacionesEquipoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/admin/chequeos/equipo/')
    else:
        form = EspecificacionesEquipoForm(initial=initial_data)

    return render(request, 'chequeos/especificaciones_form.html', {
        'form': form,
        'title': 'Crear Especificaciones del Equipo',
        'cancel_url': '/admin/chequeos/equipo/',
    })

@user_passes_test(es_administrador)
def especificaciones_update(request, pk):
    especificacion = get_object_or_404(EspecificacionesEquipo, pk=pk)

    # Buscar el último chequeo del equipo
    ultimo_chequeo = Chequeo.objects.filter(Id_Equipo=especificacion.Equipo).order_by('-Che_Fecha_Chequeo').first()
    software_nombres = ""

    if ultimo_chequeo:
        software_nombres = ", ".join(s.Sof_Nombre for s in ultimo_chequeo.software_instalado.all())

    if request.method == 'POST':
        form = EspecificacionesEquipoForm(request.POST, instance=especificacion)
        if form.is_valid():
            form.save()
            return redirect('/admin/chequeos/equipo/')
    else:
        # Si el campo de software está vacío, lo llenamos con el del último chequeo
        initial_data = {}
        if not especificacion.Esp_Software_Instalado and software_nombres:
            initial_data['Esp_Software_Instalado'] = software_nombres

        form = EspecificacionesEquipoForm(instance=especificacion, initial=initial_data)

    return render(request, 'chequeos/especificaciones_form.html', {
        'form': form,
        'software_instalado': software_nombres,
        'title': 'Actualizar Especificaciones del Equipo',
        'cancel_url': '/admin/chequeos/equipo/',
    })

    print("Software precargado:", initial_data.get('Esp_Software_Instalado'))


@user_passes_test(es_administrador)
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
    if request.user.groups.filter(name='Sistemas').exists():
        return redirect('sistemas_inicio')  # Cambia esto por la URL que uses para técnicos
    elif request.user.is_superuser or request.user.groups.filter(name='Administrador').exists():
        return redirect('admin_inicio')  # Cambia esto por la URL para admin
    else:
        return redirect('logout')  # O adonde quieras redirigir si no tiene grupo