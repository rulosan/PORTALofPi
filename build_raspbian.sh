#!/bin/bash

#
# |----------------------------------|
# | Configurar internet normalmente  | 
# |----------------------------------|
#

# 1. Limpiar la raspbian
rm -rf ~/python_games

# 2. desinstalando X11 y python3
apt-get remove x11-common midori lxde python3 python3-minimal

# 3. Borrando los ejemplos de codigo
rm -rf /opt

# 4. Borrando paquetes de desarrollo , despues instalaremos los necesarios
apt-get remove `sudo dpkg --get-selections | grep "\-dev" | sed s/install//`
apt-get remove `sudo dpkg --get-selections | grep -v "deinstall" | sed s/install//`
apt-get remove lxde-common lxde-icon-theme omxplayer raspi-config
apt-get remove `dkpg --get-selections | grep -v "deinstall" | grep x11 | sed s/install//`
apt-get remove `dpkg --get-selections | grep -v "deinstall" | grep sound | sed s/install//`
apt-get remove libraspberrypi-doc xkb-data fonts-freefont-ttf locales
apt-get autoremove
apt-get clean

# 4. Deshabilitamos el swap
sudo swapoff -a
cd /var
dd if=/dev/zero of=swap bs=1M count=100

# 6. borramos logs
cd /var/log
rm -rf `find . -type f`



###### Comenzamos con la configuracion de Onion Router ######

# Hardening SSH

# Instalar y Configurar dnsmasq: 
# 	Sirve DHCP y DNS  server.

# Instalar y Configurar hostapd:
# 	Monta una tarjeta wireless como AP (para recibir nuestras conexiones)

# Instalar y Configurar polipo:
# 	Proxy que se usa con tor para tener mas rendimiento y cuestiones de seguridad

# Instalar y Configurar Tor:

# Configurar iptables para hacer el nat y enrutar las peticiones dns por tor

