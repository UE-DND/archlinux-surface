#!/usr/bin/env bash

set -euxo pipefail

tag()
{
    DISTRO="${1:-}"
    VERSION="${2:-}"

    if [ -z "${DISTRO}" ]; then
        echo "DISTRO missing!"
        return 1
    fi

    if [ -z "${VERSION}" ]; then
        echo "VERSION missing!"
        return 1
    fi

    git tag -f "${DISTRO}-${VERSION}"
    git push --force origin "${DISTRO}-${VERSION}"
}

getarch()
{
    VERSION="$(grep 'pkgver=' pkg/arch/kernel/PKGBUILD | cut -d'=' -f2 | cut -d'.' -f1-3)"
    RELEASE="$(grep 'pkgrel=' pkg/arch/kernel/PKGBUILD | cut -d'=' -f2)"

    if [ -z "${VERSION}" ]; then
        echo "VERSION missing!"
        return 1
    fi

    if [ -z "${RELEASE}" ]; then
        echo "RELEASE missing!"
        return 1
    fi

    echo "${VERSION}-${RELEASE}"
}

tag 'arch' "$(getarch)"
