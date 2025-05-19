@echo off
::cargamos el archivo de configuración
call config.bat

:: Declaración de variables
set MAP_NAME=ScorchedEarth_WP
set PORT=7782
set QUERY_PORT=27022
set SESSION_NAME="SKO Scorched Earth"

:: Lanzamiento del servidor
%EXE_PATH% %MAP_NAME%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName=%SESSION_NAME% -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -mods=%MODS% -NoBattlEye -crossplay -nomansky -lowmemory -preventhibernation -forceAllowCaveFlyers -NoTransferFromFiltering