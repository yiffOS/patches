# patches

Various patches for yiffOS packages.

### linux:   
* linux/good_panic_message - Changes the kernel panic message to be better
* linux/config - Kernel compile config - Partly from [Arch Linux](https://archlinux.org/)
* linux/package-kernel.sh - Kernel packaging script

### glibc:   
* glibc/fhs-runtime - Patches GLibc for FHS runtime directory compilance - From [Linux From Scratch](https://www.linuxfromscratch.org/)

### pahole:
* pahole/buildcmd-prefix-and-static - Changes the install prefix to be /usr and statically links the executable.

### cpio:
* cpio/src-global.c-drop-duplicate-definition-of-program_na - Removes duplicate program_name - From [Gentoo](https://bugs.gentoo.org/705900)

### neofetch
* neofetch/include-yiffos - Adds yiffOS's logo and the bulge package manager

### bzip2
* bzip2/install-docs - Installs the pre-formatted documentation - From [Linux From Scratch](https://www.linuxfromscratch.org/)
* bzip2/add-destdir-support - Add DESTDIR support to the Makefile

### readline
* readline/fix-destdir - Fixes not being able to set the DESTDIR variable by removing an empty declaration

### expect
* expect/fix-destdir - Fixes not being able to set the DESTDIR variable by removing an empty declaration

### binutils
* binutils/binutils-2.37-upstream_fix-1 - Fix file descriptors not closing if there is no archive plugin file descriptor - From [Linux From Scratch](https://www.linuxfromscratch.org/)

### perl
* perl/perl-upstream_fixes - Fixes error with GDBM 1.20+ - From [Linux From Scratch](https://www.linuxfromscratch.org/)

### kbd
* kbd/backspace - Keeps backspace and delete consistent in keymaps - From [Linux From Scratch](https://www.linuxfromscratch.org/)

### systemd
* systemd/systemd-upstream_fixes - Fixes a security vulnerability - From [Linux From Scratch](https://www.linuxfromscratch.org/)

### efivar
* efivar/gcc_9-1 - Patch to fix issues with building when using GCC 9+ - From [Linux From Scratch](https://www.linuxfromscratch.org/)

### refind
* refind/gnu-efi - Patch refind to work with newer GNU-EFI versions - From [Debian](https://sources.debian.org/patches/refind/0.13.2-1/gnu-efi.patch/)

### lynx
* lynx/CVE-2021-38165 - Patch to fix CVE-2021-38165 - From [Arch Linux](https://archlinux.org/) [FS#71764](https://bugs.archlinux.org/task/71764)

### httpd
* httpd/yiffOS-layout - Adds yiffOS file layout for httpd
* httpd/website - The default website for yiffOS's httpd