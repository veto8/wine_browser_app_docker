#!/bin/bash
#ls /root/.wine/

SCRIPT_TO_RUN="${STARTUP_SCRIPT:-default}"

if [ "$STARTUP_SCRIPT" = "tamuz" ]; then
  exec wine C:/tamuz/applic/uniRTE.exe
elif [ "$STARTUP_SCRIPT" = "megabom" ]; then
  exec wine C:/autohotkey/AutoHotkey32.exe C:/autohotkey/megabom.ahk
elif [ "$STARTUP_SCRIPT" = "balance" ]; then
  exec wine C:/autohotkey/AutoHotkey32.exe C:/autohotkey/balance.ahk
elif [ "$STARTUP_SCRIPT" = "winecfg" ]; then
  exec winecfg
elif [ "$STARTUP_SCRIPT" = "notepad" ]; then
  exec wine notepad
elif [ "$STARTUP_SCRIPT" = "xterm" ]; then
  exec /usr/bin/xterm
else
  exec /usr/bin/xterm
fi
