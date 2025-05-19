@echo off
::cargamos el archivo de configuración
call config.bat

:: Declaración de variables
set MAP_NAME=TheIsland_WP
set PORT=7778
set QUERY_PORT=27018
set SESSION_NAME="SKO The Island"

:: Lanzamiento del servidor
%EXE_PATH% %MAP_NAME%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName=%SESSION_NAME% -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -mods=%MODS% -NoBattlEye -crossplay -nomansky -lowmemory -preventhibernation -forceAllowCaveFlyers -NoTransferFromFiltering -WinLiveMaxPlayers=%MAX_PLAYERS%