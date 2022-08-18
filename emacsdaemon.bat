:: On Windows, place this file in shell:Startup to automatically start the emacs daemon on login.
powershell -Command "Start-Process emacs -WindowStyle Hidden -ArgumentList --daemon"
