@echo off
::cargamos el archivo de configuración
call config.bat

:: Verificar que INI_PATH está definido
if not defined INI_PATH (
    echo Error: INI_PATH no está definido en el archivo de configuración.
    pause
)

set origen=.\
set destino=%INI_PATH%

::archivos a copiar
set gameIni=Game.ini
set gameUserIni=GameUserSettings.ini

if exist "%origen%%gameIni%" (
    echo Copiando %gameIni%
    copy /Y "%origen%%gameIni%" %destino%
    echo Archivo %gameIni% copiado correctamente.
) else (
    echo El archivo %origen%%gameIni% no existe.
)

if exist "%origen%%gameUserIni%" (
    echo Copiando %gameUserIni%
    copy /Y "%origen%%gameUserIni%" %destino%
    echo Archivo %gameUserIni% copiado correctamente.
) else (
    echo El archivo %gameUserIni% no existe.
)

echo Operacion de copia completada.
pause

