#!/bin/bash

if [ -z "$DEBUG" ] || [ "$DEBUG" -eq "0" ]; then
    set -e
else
    set -ex
fi


REPO_ROOT=$(readlink -f $(dirname "$0"))

export PYTHON_VERSION="3.7.3"
export PYTHON_SOURCE="${PYTHON_SOURCE:-https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz}"
export PIP_REQUIREMENTS="-U pip -r ${REPO_ROOT}/requirements.txt"

ARCH="${ARCH:-$(arch)}"
export ARCH="${ARCH}"


# Setup a temporary work space
if [ -z "${BUILD_DIR}" ]; then
    BUILD_DIR=$(mktemp -d)

    _cleanup() {
        rm -rf "${BUILD_DIR}"
    }

    trap _cleanup EXIT
else
    BUILD_DIR=$(readlink -m "${BUILD_DIR}")
    mkdir -p "${BUILD_DIR}"
fi

pushd $BUILD_DIR


# Build the AppImage
linuxdeploy="linuxdeploy-${ARCH}.AppImage"
plugin="linuxdeploy-plugin-python-${ARCH}.AppImage"

if [ ! -f "${linuxdeploy}" ]; then
    url="https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous"
    wget --no-check-certificate -q "${url}/${linuxdeploy}"
    chmod u+x "${linuxdeploy}"
fi

if [ ! -f "${plugin}" ]; then
    url="https://github.com/niess/linuxdeploy-plugin-python/releases/download/continuous"
    wget --no-check-certificate -q "${url}/${plugin}"
    chmod u+x "${plugin}"
fi

./"${linuxdeploy}" --appdir AppDir \
                   --plugin python \
                   -i "${REPO_ROOT}/resources/grand.png" \
                   -d "${REPO_ROOT}/resources/python.desktop" \
                   --custom-apprun "AppDir/usr/bin/python3" \
                   --output "appimage"

popd
mv -f "${BUILD_DIR}/python3-${ARCH}.AppImage" "${REPO_ROOT}"
