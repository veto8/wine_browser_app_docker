FROM jlesage/baseimage-gui:debian-13-v4.12.1 
RUN dpkg --add-architecture i386 && apt-get update -y
RUN rm -rf /var/log && apt-get upgrade -y
RUN apt-get install ca-certificates wine wine32 zenity cabextract p7zip unzip wget git inetutils-ping xvfb xauth winbind cabextract emacs-nox ack gnutls-bin xterm tree -y --no-install-recommends 

RUN wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
RUN chmod +x winetricks
RUN mv -v winetricks /usr/bin/
RUN xvfb-run winetricks --unattended --force -q dotnet20 mdac27 mdac28 msvcirt msxml6 vb2run vcrun2010 vcrun2012 vcrun2013
RUN ln -s /root/ ~/.wine/dosdevices/y:
#RUN chown 1001:1001 /root/.wine . -Rf

COPY startapp.sh /startapp.sh
RUN set-cont-env APP_NAME "Wineapp"

