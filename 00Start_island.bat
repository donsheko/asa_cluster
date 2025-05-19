@echo off
:: Declaración de variables
set EXE_PATH="E:\SteamLibrary\steamapps\common\ARK Survival Ascended Dedicated Server\ShooterGame\Binaries\Win64\ArkAscendedServer.exe"
set MAP_NAME=TheIsland_WP
set PORT=7778
set QUERY_PORT=27018
set SESSION_NAME=SKO_The_Island
set CLUSTER_ID=ShekoGaming
set CLUSTER_DIR_OVERRIDE="E:\asaServer"
set MODS=929800,940975,929420,928597,930494,935408,929912,942024,928661,950914,941697,928650,946536,928708

:: Lanzamiento del servidor
%EXE_PATH% %MAP_NAME%?listen?Port=%PORT%?QueryPort=%QUERY_PORT%?SessionName=%SESSION_NAME% -clusterid=%CLUSTER_ID% -ClusterDirOverride=%CLUSTER_DIR_OVERRIDE% -NoBattlEye -crossplay -mods=%MODS% -nomansky -lowmemory -useallavailablecores -preventhibernation -forceAllowCaveFlyers -NoTransferFromFiltering