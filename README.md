# Minimal Initramfs Builder

A very minimal initramfs builder that depends on BusyBox binaries.
It creates small initramfs images suitable for testing kernels, either
as standalone initramfs or for inclusion in the kernel image via 
`CONFIG_INITRAMFS_SOURCE`.

## Features

* Includes static BusyBox binaries for some unusual architectures.

* More architectures will be added in the future.

## Usage

```
make <target>
```

The resulting initramfs will be available in the `builds` directory.

