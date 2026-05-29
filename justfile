builddir := "builddir"

# Mostrar recetas disponibles
default:
    @just --list

# Configurar el proyecto con Meson
setup:
    meson setup {{ builddir }} --wipe

# Compilar la libreria
build:
    ninja -C {{ builddir }}

# Configurar y compilar
all: setup build

# Instalar la libreria (requiere permisos)
install prefix="/usr/local":
    meson install -C {{ builddir }} --destdir {{ prefix }}

# Limpiar directorio de build
clean:
    rm -rf {{ builddir }}

# Recompilar desde cero
rebuild: clean all
