# cspice

Meson build for [CSPICE](https://naif.jpl.nasa.gov/naif/toolkit_C.html) — the NASA/NAIF SPICE Toolkit C library, version **N0067**.

Pre-built static libraries are published as GitHub Releases for:

| Platform | Arch |
|---|---|
| Linux | x86_64 |
| Linux | aarch64 (ARM64) |
| macOS | arm64 (Apple Silicon) |

## Usage

### Download a pre-built release

Download the tarball for your platform from [Releases](../../releases):

```
cspice-{version}-linux-x86_64.tar.gz
cspice-{version}-linux-aarch64.tar.gz
cspice-{version}-macos-arm64.tar.gz
```

Each archive contains:
```
lib/libcspice.a
include/cspice/SpiceUsr.h
include/cspice/...
```

### Build from source

Requirements: [Meson](https://mesonbuild.com/) >= 0.59, [Ninja](https://ninja-build.org/), GCC or Clang.

```sh
meson setup builddir
ninja -C builddir
```

Install:

```sh
meson setup builddir --prefix=/usr/local
ninja -C builddir install
```

### Use as a Meson subproject

Copy this repo into `subprojects/cspice/` and add to your `meson.build`:

```meson
cspice_dep = dependency('cspice', fallback: ['cspice', 'cspice_dep'])
```

## Build details

- Standard: **C89** (`-std=gnu89`) — the source is f2c-translated Fortran code
- Flags: `-O2 -fPIC -DNON_UNIX_STDIO`
- Compiler warning suppressions are added conditionally (GCC and Clang differ)

## License / Attribution

CSPICE is developed and maintained by the Navigation and Ancillary Information Facility (NAIF) at NASA's Jet Propulsion Laboratory (JPL).

See [NAIF rules](https://naif.jpl.nasa.gov/naif/rules.html) for terms of use.

This repository only adds a Meson build system overlay. The CSPICE source code is copyright NASA/JPL/Caltech.
