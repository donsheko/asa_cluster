@echo off
:: Declaración de variables
set EXE_PATH="D:\SteamLibrary\steamapps\common\ARK Survival Ascended Dedicated Server\ShooterGame\Binaries\Win64\ArkAscendedServer.exe"
set MAP_NAME=Aberration_WP
set PORT=7780
set QUERY_PORT=27020
set SESSION_NAME=SKO_Aberration
set CLUSTER_ID=ShekoGaming
set CLUSTER_DIR_OVERRIDE="D:\asaServer"
set MODS=930494,929110,939055,929902,947033,950914,935408,941697,942024,940975,928661,928708,928621,928650

:: Lanzamiento del servidor
%EXE_PATH% %MAP_NAME%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName=%SESSION_NAME% -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -mods=%MODS% -NoBattlEye
