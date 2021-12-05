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
