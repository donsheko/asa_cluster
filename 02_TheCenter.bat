@echo off
::cargamos el archivo de configuración
call config.bat

:: Declaración de variables
set MAP_NAME=TheCenter_WP
set PORT=7780
set QUERY_PORT=27020
set SESSION_NAME="SKO The Center"

:: Lanzamiento del servidor
%EXE_PATH% %MAP_NAME%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName=%SESSION_NAME% -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -mods=%MODS% -NoBattlEye -crossplay -nomansky -lowmemory -preventhibernation -forceAllowCaveFlyers -NoTransferFromFiltering -WinLiveMaxPlayers=%MAX_PLAYERS%