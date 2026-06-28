@echo off
:: Declaracion de variables Globales
set EXE_PATH="D:\SteamLibrary\steamapps\common\ARK Survival Ascended Dedicated Server\ShooterGame\Binaries\Win64\ArkAscendedServer.exe"
set INI_PATH="D:\SteamLibrary\steamapps\common\ARK Survival Ascended Dedicated Server\ShooterGame\Saved\Config\WindowsServer\"
set CLUSTER_ID=ShekoGaming
set CLUSTER_DIR_OVERRIDE="E:\asaServer"
set MAX_PLAYERS=10
set UPDATE_MODS=1
set SERVER_FLAGS=-NoBattlEye -crossplay -nomansky -lowmemory -preventhibernation -forceAllowCaveFlyers -NoTransferFromFiltering

:: ==========================================
:: CONFIGURACION DE MODS DE CURSEFORGE (ARRAY)
:: ==========================================

:: 1) TG Stacking Mod 1000-50
set MOD_1_ID=929800
set MOD_1_NAME=TG Stacking Mod 1000-50
set MOD_1_ACTIVE=1

:: 2) Cybers Structures QoL+ (Crossplay)
set MOD_2_ID=940975
set MOD_2_NAME=Cybers Structures QoL+ (Crossplay)
set MOD_2_ACTIVE=1

:: 3) Super Spyglass Plus
set MOD_3_ID=929420
set MOD_3_NAME=Super Spyglass Plus
set MOD_3_ACTIVE=1

:: 4) Automated Ark
set MOD_4_ID=928597
set MOD_4_NAME=Automated Ark
set MOD_4_ACTIVE=0

:: 5) Upgrade Station
set MOD_5_ID=930494
set MOD_5_NAME=Upgrade Station
set MOD_5_ACTIVE=1

:: 6) Der Dino Finder
set MOD_6_ID=935408
set MOD_6_NAME=Der Dino Finder
set MOD_6_ACTIVE=1

:: 7) Ez's Engram Unlocker (PC/Xbox/PS)
set MOD_7_ID=929912
set MOD_7_NAME=Ez's Engram Unlocker (PC/Xbox/PS)
set MOD_7_ACTIVE=0

:: 8) Dino Depot
set MOD_8_ID=942024
set MOD_8_NAME=Dino Depot
set MOD_8_ACTIVE=1

:: 9) Element And Tribute Transfer
set MOD_9_ID=928661
set MOD_9_NAME=Element And Tribute Transfer
set MOD_9_ACTIVE=0

:: 10) Awesome Teleporters
set MOD_10_ID=950914
set MOD_10_NAME=Awesome Teleporters
set MOD_10_ACTIVE=1

:: 11) Better Breeding
set MOD_11_ID=941697
set MOD_11_NAME=Better Breeding
set MOD_11_ACTIVE=1

:: 12) Potions | Gaia Studios
set MOD_12_ID=928650
set MOD_12_NAME=Potions | Gaia Studios
set MOD_12_ACTIVE=1

:: 13) More Giga and Carchar Spawns [Crossplay]
set MOD_13_ID=946536
set MOD_13_NAME=More Giga and Carchar Spawns [Crossplay]
set MOD_13_ACTIVE=0

:: 14) Custom Dino Levels
set MOD_14_ID=928708
set MOD_14_NAME=Custom Dino Levels
set MOD_14_ACTIVE=0

:: 15) TG Stacking Mod 10000-90
set MOD_15_ID=929110
set MOD_15_NAME=TG Stacking Mod 10000-90
set MOD_15_ACTIVE=0

:: 16) Pull It!
set MOD_16_ID=940022
set MOD_16_NAME=Pull It!
set MOD_16_ACTIVE=0

:: 17) Death Inventory Keeper
set MOD_17_ID=929902
set MOD_17_NAME=Death Inventory Keeper
set MOD_17_ACTIVE=0

:: 18) Death Recovery [Cross-platform]
set MOD_18_ID=929578
set MOD_18_NAME=Death Recovery [Cross-platform]
set MOD_18_ACTIVE=0

:: 19) Dino Upgrade Potions!
set MOD_19_ID=1123495
set MOD_19_NAME=Dino Upgrade Potions!
set MOD_19_ACTIVE=0
