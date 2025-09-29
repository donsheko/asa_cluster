@echo off
::cargamos el archivo de configuración
call config.bat

:: Declaración de variables
set MAP_NAME=Ragnarok_WP
set PORT=7786
set QUERY_PORT=27026
set SESSION_NAME="SKO Ragnarok"

:: Lanzamiento del servidor
%EXE_PATH% %MAP_NAME%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName=%SESSION_NAME% -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -mods=%MODS% -NoBattlEye -crossplay -nomansky -lowmemory -preventhibernation -forceAllowCaveFlyers -NoTransferFromFiltering -WinLiveMaxPlayers=%MAX_PLAYERS%