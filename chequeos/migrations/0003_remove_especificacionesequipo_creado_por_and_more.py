# Generated by Django 4.2.23 on 2025-07-11 21:46

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('chequeos', '0002_especificacionesequipo_creado_por'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='especificacionesequipo',
            name='creado_por',
        ),
        migrations.AddField(
            model_name='chequeo',
            name='creado_por',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
    ]
