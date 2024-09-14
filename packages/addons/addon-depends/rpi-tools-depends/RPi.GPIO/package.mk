# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RPi.GPIO"
PKG_VERSION="0.7.1"
PKG_SHA256="cd61c4b03c37b62bba4a5acfea9862749c33c618e0295e7e90aa4713fb373b70"
PKG_ARCH="arm"
PKG_LICENSE="MIT"
PKG_SITE="https://sourceforge.net/projects/raspberry-gpio-python/"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="A module to control Raspberry Pi GPIO channels."
PKG_TOOLCHAIN="manual"

if [ "${DISTRO}" = "Lakka" -o "${DISTRO}" = "TKMM" ]; then
  PKG_ARCH+=" aarch64"
fi

pre_configure_target() {
  export PYTHONXCPREFIX="${SYSROOT_PREFIX}/usr"
  export LDSHARED="${CC} -shared"
  export CFLAGS="${CFLAGS} -fcommon"
  export CPPFLAGS="${TARGET_CPPFLAGS} -I${SYSROOT_PREFIX}/usr/include/${PKG_PYTHON_VERSION}"
}

make_target() {
  python3 setup.py build
}

makeinstall_target() {
  if [ "${DISTRO}" = "Lakka" -o "${DISTRO}" = "TKMM" ]; then
    python setup.py install --root=${INSTALL} --prefix=/usr
  fi
}

post_makeinstall_target() {
  if [ "${DISTRO}" = "Lakka" -o "${DISTRO}" = "TKMM" ]; then
    find ${INSTALL}/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  fi
}
