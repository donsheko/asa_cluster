@echo off
setlocal enabledelayedexpansion

:: 1. Cargar configuracion global (Rutas, Cluster, Mods, MaxPlayers, Flags)
if not exist "config.bat" (
    echo [ERROR] No se encontro config.bat en el directorio actual.
    pause
    exit /b
)
call config.bat

:: Construir la cadena de MODS activos dinamicamente (recorrido secuencial sin limite fijo)
set "MODS="
set /a i=1
:MOD_LOOP
set "CURR_ID=!MOD_%i%_ID!"
if "!CURR_ID!"=="" goto MOD_LOOP_END
set "CURR_ACTIVE=!MOD_%i%_ACTIVE!"
if "!CURR_ACTIVE!"=="1" (
    if not defined MODS (
        set "MODS=!CURR_ID!"
    ) else (
        set "MODS=!MODS!,!CURR_ID!"
    )
)
set /a i+=1
goto MOD_LOOP
:MOD_LOOP_END

:: 2. Configuracion de puertos base
set /a BASE_PORT=7778
set /a BASE_QUERY_PORT=27018

:: 3. Definicion del catalogo de mapas (Modificable)
set TOTAL_MAPS=9

set MAP_1_NAME=The Island
set MAP_1_FILE=TheIsland_WP

set MAP_2_NAME=The Center
set MAP_2_FILE=TheCenter_WP

set MAP_3_NAME=Scorched Earth
set MAP_3_FILE=ScorchedEarth_WP

set MAP_4_NAME=Ragnarok
set MAP_4_FILE=Ragnarok_WP

set MAP_5_NAME=Aberration
set MAP_5_FILE=Aberration_WP

set MAP_6_NAME=Extinction
set MAP_6_FILE=Extinction_WP

set MAP_7_NAME=Valguero
set MAP_7_FILE=Valguero_WP

set MAP_8_NAME=Astraeos
set MAP_8_FILE=Astraeos_WP

set MAP_9_NAME=Lost Colony
set MAP_9_FILE=LostColony_WP

:MENU
cls
echo ==========================================================
echo           ARK: Survival Ascended - LAN Cluster
echo ==========================================================
echo.
echo [ SERVIDORES DE MAPAS DISPONIBLES ]
for /L %%i in (1,1,%TOTAL_MAPS%) do (
    :: Calcular puertos dinamicos para mostrar en el menu
    set /a P_GAME=BASE_PORT + %%i * 2 - 2
    set /a P_QUERY=BASE_QUERY_PORT + %%i * 2 - 2
    
    echo   %%i^) !MAP_%%i_NAME! ^(Port: !P_GAME! ^| Query: !P_QUERY!^)
)
echo.
echo [ ACCIONES ADICIONALES ]
echo   C) Sincronizar archivos de configuracion (.ini)
echo   A) Lanzar TODO el cluster (Servidores 1 al %TOTAL_MAPS%)
echo   K) Detener todos los servidores de ARK activos (Taskkill)
echo   E) Salir del programa
echo.
echo ==========================================================
set "Opcion="
set /p Opcion="Selecciona una opcion: "

:: Limpiar comillas si el usuario las ingresa
if defined Opcion set "Opcion=!Opcion:"=!"

:: Evaluar opciones especiales usando delayed expansion para evitar colapsos por entrada de usuario
if /I "!Opcion!"=="E" exit /b
if /I "!Opcion!"=="C" (
    call :SyncInis
    pause
    goto MENU
)
if /I "!Opcion!"=="K" (
    echo Deteniendo procesos del servidor...
    taskkill /f /im ArkAscendedServer.exe
    pause
    goto MENU
)
if /I "!Opcion!"=="A" (
    echo Lanzando todo el cluster...
    for /L %%i in (1,1,%TOTAL_MAPS%) do (
        call :LaunchServer %%i
        if %%i LSS %TOTAL_MAPS% (
            echo Esperando 10 segundos antes de lanzar el siguiente mapa...
            timeout /t 10 >nul
        )
    )
    echo Lanzamiento del cluster completo iniciado.
    pause
    goto MENU
)

:: Validar entrada numerica de forma segura para evitar inyeccion de comandos
set /a SelNum=0
for /L %%i in (1,1,%TOTAL_MAPS%) do (
    if "!Opcion!"=="%%i" set /a SelNum=%%i
)

if %SelNum% GEQ 1 (
    call :LaunchServer %SelNum%
    pause
    goto MENU
)

echo [ERROR] Opcion no valida. Intentalo de nuevo.
pause
goto MENU

:: ------------------------------------------------------------
:: SUBRUTINA: Sincronizacion Obligatoria de Archivos INI
:: ------------------------------------------------------------
:SyncInis
echo.
echo [1/2] Sincronizando configuracion (.ini)...
if not defined INI_PATH (
    echo [ERROR] INI_PATH no esta definido en config.bat.
    exit /b
)
set origen=.\
set destino=%INI_PATH%
set gameIni=Game.ini
set gameUserIni=GameUserSettings.ini

:: Remover comillas de las rutas para asegurar consistencia
set "destino_clean=%destino:"=%"
set "origen_clean=%origen:"=%"

if exist "%origen_clean%%gameIni%" (
    copy /Y "%origen_clean%%gameIni%" "%destino_clean%" >nul
    echo   - %gameIni% copiado.
) else (
    echo   - [ERROR] %gameIni% no se encuentra en el directorio actual.
)

if exist "%origen_clean%%gameUserIni%" (
    copy /Y "%origen_clean%%gameUserIni%" "%destino_clean%" >nul
    echo   - %gameUserIni% copiado.
) else (
    echo   - [ERROR] %gameUserIni% no se encuentra en el directorio actual.
)
echo Sincronizacion completada con exito.
exit /b

:: ------------------------------------------------------------
:: SUBRUTINA: Lanzamiento dinamico de servidores
:: ------------------------------------------------------------
:LaunchServer
set INDEX=%1
set /a PORT=BASE_PORT + INDEX * 2 - 2
set /a QUERY_PORT=BASE_QUERY_PORT + INDEX * 2 - 2

:: Obtener datos del array
set MAP_FILE=!MAP_%INDEX%_FILE!
set MAP_NAME=!MAP_%INDEX%_NAME!
set SESSION_NAME=SKO %MAP_NAME%

:: Definir si se actualizan los mods de CurseForge automaticamente
set "MOD_UPDATE_FLAG="
if "!UPDATE_MODS!"=="1" set "MOD_UPDATE_FLAG=-automanagedmods"

echo.
echo [2/2] Lanzando servidor: %MAP_NAME% en puerto %PORT%...
echo Comando: %EXE_PATH% %MAP_FILE%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName="%SESSION_NAME%" -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -mods=%MODS% %SERVER_FLAGS% %MOD_UPDATE_FLAG% -WinLiveMaxPlayers=%MAX_PLAYERS%

:: Lanzar en una nueva ventana CMD con titulo de la sesion
start "%SESSION_NAME%" %EXE_PATH% %MAP_FILE%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName="%SESSION_NAME%" -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -mods=%MODS% %SERVER_FLAGS% %MOD_UPDATE_FLAG% -WinLiveMaxPlayers=%MAX_PLAYERS%

exit /b
