MAJOR_VERSION=5
VERSION=5.15.2
yiffOS_VERSION=0.1.1

echo "Building for Linux Kernel v${VERSION} for yiffOS ${yiffOS_VERSION} with makeflags ${1}"

# Download source and patches
curl -LO https://cdn.kernel.org/pub/linux/kernel/v$MAJOR_VERSION.x/linux-$VERSION.tar.xz
curl -LO https://gitlab.com/yiffos/core/patches/-/raw/main/linux/good_panic_message.patch
curl -LO https://gitlab.com/yiffos/core/patches/-/raw/main/linux/config

# Rename kernel source to fix xz conflict issue
mv linux-$VERSION.tar.xz linux-$VERSION-src.tar.xz

# Make directories
mkdir -p packages/linux-$VERSION/data/boot
mkdir -p packages/linux-headers-$VERSION/data/

# Extract source for headers
tar xvf linux-$VERSION-src.tar.xz
cd linux-$VERSION

# Clear source
make mrproper

# Make headers
make headers

# Delete unneeded files
find usr/include -name '.*' -delete
rm usr/include/Makefile

# Package headers
cp -rv usr/include ../packages/linux-headers-$VERSION/data/usr

# Clear source
cd ../
rm -r linux-$VERSION

# Extract source for kernel
tar xvf linux-$VERSION-src.tar.xz
cd linux-$VERSION

# Clear source
make mrproper

# Apply patches and copy config 
patch -Np1 -i ../good_panic_message.patch
cp ../config .config

# Make the kernel and modules
make $1
make INSTALL_MOD_PATH=../packages/linux-$VERSION/data/usr INSTALL_MOD_STRIP=1 modules_install

# Package kernel and mopdules
cp -iv arch/x86/boot/bzImage ../packages/linux-$VERSION/data/boot/vmlinuz-$VERSION-yiffOS-$yiffOS_VERSION
cp -iv System.map ../packages/linux-$VERSION/data/boot/System.map-$VERSION
install -d ../packages/linux-$VERSION/data/usr/share/doc/linux-$VERSION
cp -r Documentation/* ../packages/linux-$VERSION/data/usr/share/doc/linux-$VERSION

# Go back to root
cd ..

# Create PKG files
cat << EOL >> ./packages/linux-${VERSION}/PKG
{
	"name": "linux",
	"version": "${VERSION}",
	"epoch": 0,
	"description":"The Linux kernel and modules.",
	"groups": "",
	"url": "https://www.kernel.org/",
	"license": "GPL2",
	"depends": "",
	"optional_depends": "",
	"provides": "linux",
	"conflicts": "",
	"replaces": "",
	"sha512sum": ""
}
EOL

cat << EOL >> ./packages/linux-headers-${VERSION}/PKG
{
	"name": "linux-headers",
	"version": "${VERSION}",    
	"epoch": 0,
	"description":"Headers and scripts for building modules for the Linux kernel.",
	"groups": "",
	"url": "https://www.kernel.org/",
	"license": "GPL2",
	"depends": "",
	"optional_depends": "",
	"provides": "linux-headers",
	"conflicts": "",
	"replaces": "",
	"sha512sum": ""
}
EOL

# Compress packages

cd ./packages/linux-${VERSION}/data

tar cvf data.tar ./*
xz data.tar
mv data.tar ../

cd ../

tar cvf linux-${VERSION}.tar PKG data.tar.xz
xz linux-${VERSION}.tar
mv linux-${VERSION}.tar.xz ../../

cd ../linux-headers-${VERSION}/data

tar cvf data.tar ./*
xz data.tar
mv data.tar ../

cd ../

tar cvf linux-headers-${VERSION}.tar PKG data.tar.xz
xz linux-headers-${VERSION}.tar
mv linux-headers-${VERSION}.tar ../../
