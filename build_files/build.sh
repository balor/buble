#!/bin/bash

set -ouex pipefail

### Install packages

# keyd service
dnf5 -y copr enable alternateved/keyd
dnf5 -y install keyd
dnf5 -y copr disable alternateved/keyd

systemctl enable keyd.service

# tools
dnf5 -y install btop foot

# polish dicts
dnf5 -y install aspell aspell-pl hunspell-pl

# glib-2
dnf5 -y install glib2 glib2-devel

# acpi event daemon
dnf5 -y install acpid

# usefull stuff for building software
dnf5 -y install libinput-utils systemd-devel libinput-devel ninja-build meson

mkdir -p "/var/opt"
ln -s "/var/opt" "/opt"

# mullvad vpn
dnf5 -y config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/beta/mullvad.repo
dnf5 -y install mullvad-vpn

# ivpn vpn
# dnf5 -y config-manager addrepo --from-repofile=https://repo.ivpn.net/stable/fedora/generic/ivpn.repo
# dnf5 -y install ivpn ivpn-ui
