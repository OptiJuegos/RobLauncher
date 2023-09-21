@echo off
======================================================================================================================================================================================	
:: BatchGotAdmin --> Pidiendo privilegios para evitar fallas.
:: Si tu PC no soporta los privilegios de Administrador, simplemente elimina este codigo!

REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
======================================================================================================================================================================================	
:: Establecer las Variables de Entorno...
set WGET="%CD%\Assets\wget.exe"
set LAUNCHER_TEXT=*RobLauncher V1.2 - Un launcher para OptiCraft y Demas Proyectos.*
set LAUNCHER_VER=RobLauncher V1.2

:: Establecer el Titulo del launcher
title %LAUNCHER_VER%

:: Crear la carpeta "Downloaded", donde van a ir todas las cosas descargadas.	
mkdir "Downloaded"

:: Comprobar si existe el archivo Options.txt, si no ir a un mini tutorial para los TOPOS (chiste los quiero mucho)
if exist "Assets\extra\options.txt" (
    goto :Start
) else (
    goto :Tutorial
)

========================================================================================================================================================
:Tutorial
cls

echo.
echo Hola bienvenido al %LAUNCHER_VER%!
echo.
echo Un launcher para OptiCraft y demas Proyectos!
echo Para moverte por los menus, debes seleccionar las Opciones
echo Utilizando los numeros, como 1-2-3-4-5 y presionando Enter.
echo.
pause

:: Crear un archivo de Options (como mc), para despues comprobar si no es la primera vez ejecutando el %%LAUNCHER_TEXT% 
type nul > "Assets\extra\options.txt"

:: Ir al inicio del launcher
goto :Start

========================================================================================================================================================
:Start
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- OptiCraft Bedrock
echo *2.- OptiCraft Java
echo *3.- Juegos Optimizados
echo *4.- Utilidades
echo *5.- Sobre el Launcher
echo *6.- Actualizar el Launcher
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :Start
if "%op%"=="1" goto :OptiCraftBE
if "%op%"=="2" goto :OptiCraftJE
if "%op%"=="3" goto :OptiGames
if "%op%"=="4" goto :Utilities
if "%op%"=="5" goto :About
if "%op%"=="6" goto :Update
if "%op%"=="" goto :Start

========================================================================================================================================================
:OptiCraftBE
cls


:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- OptiCraft Bedrock 1.7.3.1 (25 MB)
echo *2.- OptiCraft Bedrock 1.9.1.0 (66 MB)
echo *3.- OptiCraft Bedrock 1.12.0 (92 MB)
echo *4.- OptiCraft Bedrock 1.14.31 (87 MB)
echo *5.- OptiCraft Bedrock 1.17.30 (100 MB)
echo *6.- OptiCraft Bedrock 1.18.31 (116 MB)
echo *7.- OptiCraft Bedrock 1.19.52 (172 MB)
echo *8.- OptiCraft Bedrock 1.20.10 (175 MB)
echo *9.- Volver para atras.
echo.

:: Comprobando si el sistema es Windows 7
ver | findstr /i "6\.1\."
if %errorlevel%==0 (
goto :W7Warning
) else (
goto :Seguir
)

:: Advertencia Windows 7
:W7Warning
echo ===============================================================================
echo OptiCraft Bedrock requiere ciertas actualizaciones y dependencias que Windows
echo No contiene por defecto, si el juego no te funciona O tienes algun error,
echo Porfavor ve a la pestania de Utilidades Y instala todas las cosas de alli (C++)
echo ===============================================================================
echo.

:: Aviso Render dragon
:Seguir
echo ===============================================================================
echo Las versiones superiores a la 1.18.31 incluyen el motor grafico Render Dragon.
echo Este motor grafico requiere un Dispositivo con DirectX 10 o Superior 
echo Si el juego tiene problemas, porfavor actualiza tu Driver de Video.
echo ===============================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :Start
if "%op%"=="1" goto :1.7.3.1
if "%op%"=="2" goto :1.9.1.0
if "%op%"=="3" goto :1.12.0
if "%op%"=="4" goto :1.14.31
if "%op%"=="5" goto :1.17.30
if "%op%"=="6" goto :1.18.31
if "%op%"=="7" goto :1.19.52
if "%op%"=="8" goto :1.20.10
if "%op%"=="9" goto :Start
if "%op%"=="" goto :Start
pause

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.7.3.1
cls

:: Comprobando si el juego ya ha sido descargado."%CD%\Downloaded\OptiCraft"
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.7.3.1
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152030436927742104/1153481005701812294/OptiCraft_1.7.3.1_By_OptiJuegos.7z

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x %CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.7.3.1_By_OptiJuegos.7z -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe"
timeout /t 10 /nobreak

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.9.1.0
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.9.1.0
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152030526744576020/1152030917636935860/OptiCraft_1.9.1.0_By_OptiJuegos.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152030526744576020/1152030917951504394/OptiCraft_1.9.1.0_By_OptiJuegos.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152030526744576020/1152030918337364008/OptiCraft_1.9.1.0_By_OptiJuegos.7z.003

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.9.1.0_By_OptiJuegos.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.12.0
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.12.0
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152042504812765226/1152375682966503504/OptiCraft_1.12.0_By_OptiJuegos.7z.001"
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152042504812765226/1152375683385921668/OptiCraft_1.12.0_By_OptiJuegos.7z.002"
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152042504812765226/1152375683838914651/OptiCraft_1.12.0_By_OptiJuegos.7z.003"
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152042504812765226/1152375682647732295/OptiCraft_1.12.0_By_OptiJuegos.7z.004"

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.12.0_By_OptiJuegos.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.14.31
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.14.31
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152422839765442660/1152793110720544929/OptiCraft_1.14.31_By_OptiJuegos.7z.004"
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152422839765442660/1152793111223865404/OptiCraft_1.14.31_By_OptiJuegos.7z.001"
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152422839765442660/1152793111660068904/OptiCraft_1.14.31_By_OptiJuegos.7z.002"
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" "https://cdn.discordapp.com/attachments/1152422839765442660/1152793112050143313/OptiCraft_1.14.31_By_OptiJuegos.7z.003"

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.14.31_By_OptiJuegos.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.16.12
:: Al final no la añadi porque esta version usa OpenGL 4.1 y como todos tienen una Intel HD Graphics que no lo soporta no les va a abrir
:: Asi que la descarto.

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.17.30
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.17.30
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422903506272346/1152795303326523502/OptiCraft_1.17.30_By_OptiJuegos.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422903506272346/1152795303691419739/OptiCraft_1.17.30_By_OptiJuegos.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422903506272346/1152795304165396480/OptiCraft_1.17.30_By_OptiJuegos.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422903506272346/1152795304668700672/OptiCraft_1.17.30_By_OptiJuegos.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422903506272346/1152795305004236840/OptiCraft_1.17.30_By_OptiJuegos.7z.005

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.17.30_By_OptiJuegos.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.18.31
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.18.31 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.18.31 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.18.31
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422929473208330/1152795303313952898/OptiCraft_1.18.31_By_OptiJuegos.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422929473208330/1152795303699816468/OptiCraft_1.18.31_By_OptiJuegos.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422929473208330/1152795304035368990/OptiCraft_1.18.31_By_OptiJuegos.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422929473208330/1152795304379306004/OptiCraft_1.18.31_By_OptiJuegos.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422929473208330/1152795304886804571/OptiCraft_1.18.31_By_OptiJuegos.7z.005

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.18.31_By_OptiJuegos.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.18.31 By OptiJuegos\OptiCraft.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.19.52
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.19.52
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422940944650271/1152795299543273585/OptiCraft_1.19.52_By_OptiJuegos.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422940944650271/1152795299941711933/OptiCraft_1.19.52_By_OptiJuegos.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422940944650271/1152795300264677427/OptiCraft_1.19.52_By_OptiJuegos.7z.006
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422940944650271/1152795300721872937/OptiCraft_1.19.52_By_OptiJuegos.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422940944650271/1152795301174837330/OptiCraft_1.19.52_By_OptiJuegos.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422940944650271/1152795301476831363/OptiCraft_1.19.52_By_OptiJuegos.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422940944650271/1152795302089216040/OptiCraft_1.19.52_By_OptiJuegos.7z.003

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.19.52_By_OptiJuegos.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.20.10
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.20.10
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795228680503346/OptiCraft_1.20.10_By_OptiJuegos.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795229057978469/OptiCraft_1.20.10_By_OptiJuegos.7z.008
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795229628411944/OptiCraft_1.20.10_By_OptiJuegos.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795229972336721/OptiCraft_1.20.10_By_OptiJuegos.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795230324670504/OptiCraft_1.20.10_By_OptiJuegos.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795231947862056/OptiCraft_1.20.10_By_OptiJuegos.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795232262426725/OptiCraft_1.20.10_By_OptiJuegos.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1152422951765934120/1152795232841252924/OptiCraft_1.20.10_By_OptiJuegos.7z.006

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_1.20.10_By_OptiJuegos.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

========================================================================================================================================================
:OptiCraftJE
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
:: Aca solo estan las versiones mas estables y funcionales, las que no actualice las descarto por fallas para evitar quejas de los TOPOS (chiste los quiero mucho)
echo *1.- OptiCraft Java 1.8.9 (123 MB)
echo *2.- OptiCraft Java 1.12.2 (218 MB)
echo *3.- OptiCraft Java 1.16.5 (368 MB)
echo *4.- Volver para atras.
echo.

:: Aviso para pcs sin OpenGL 2.1
echo ======================================================================================================
echo Las versiones JAVA requieren un minimo de OpenGL 2.1 para funcionar correctamente.				  
echo Si tu dispositivo no soporta esa Version, es posible que tengas fallas al ejecutar OptiCraft 	  
echo Porfavor, manten tu driver de video actualizado para evitar este problema. 						  
echo ======================================================================================================																

:: Codigo para ir al menu con las Opciones
set /p op=Opcion:

if "%op%"=="" goto :Start
if "%op%"=="1" goto :1.8.9
if "%op%"=="2" goto :1.12.2
if "%op%"=="3" goto :1.16.5
if "%op%"=="4" goto :Start
if "%op%"=="" goto :Start
pause

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.8.9
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA CLIENTS 1.8.9\1-Minecraft.bat" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft JAVA CLIENTS 1.8.9\1-Minecraft.bat"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.8.9
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153484367268679781/1153485004752568390/OptiCraft_JAVA_CLIENTS_1.8.9.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153484367268679781/1153485005100691467/OptiCraft_JAVA_CLIENTS_1.8.9.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153484367268679781/1153485005436227584/OptiCraft_JAVA_CLIENTS_1.8.9.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153484367268679781/1153485005734035507/OptiCraft_JAVA_CLIENTS_1.8.9.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153484367268679781/1153485006048604270/OptiCraft_JAVA_CLIENTS_1.8.9.7z.004

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_JAVA_CLIENTS_1.8.9.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft JAVA CLIENTS 1.8.9\1-Minecraft.bat"

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.12.2
cls

:: Comprobando si el juego ya ha sido descargado.
:: No se porque es de 32 Bits, creo que lo actualice pero no subi la version, rarisimo

if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft 32 Bits.bat" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft 32 Bits.bat"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.12.2
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829069029380157/OptiCraft_JAVA_1.12.2_FORGE.7z.009
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829069369131058/OptiCraft_JAVA_1.12.2_FORGE.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829069708873858/OptiCraft_JAVA_1.12.2_FORGE.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829070044401735/OptiCraft_JAVA_1.12.2_FORGE.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829070375768194/OptiCraft_JAVA_1.12.2_FORGE.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829070728073326/OptiCraft_JAVA_1.12.2_FORGE.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829071059435520/OptiCraft_JAVA_1.12.2_FORGE.7z.006
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829071420149761/OptiCraft_JAVA_1.12.2_FORGE.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485367694069760/1153829071768273032/OptiCraft_JAVA_1.12.2_FORGE.7z.008

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_JAVA_1.12.2_FORGE.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft 32 Bits.bat"

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.16.5
cls

:: Comprobando si el juego ya ha sido descargado.
if exist "%CD%\Downloaded\OptiCraft\OptiCraft Java 1.16.5\1-Minecraft Sodium.bat" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\OptiCraft\OptiCraft Java 1.16.5\1-Minecraft Sodium.bat"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Enlaces de descarga de la 1.16.5
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829265536729168/OptiCraft_Java_1.16.5.7z.014
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829266002292846/OptiCraft_Java_1.16.5.7z.015
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829266459476008/OptiCraft_Java_1.16.5.7z.011
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829267050868787/OptiCraft_Java_1.16.5.7z.012
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829267487072277/OptiCraft_Java_1.16.5.7z.013
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829250898604092/OptiCraft_Java_1.16.5.7z.010
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829251225755688/OptiCraft_Java_1.16.5.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829251594866788/OptiCraft_Java_1.16.5.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829251947180124/OptiCraft_Java_1.16.5.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829252278538381/OptiCraft_Java_1.16.5.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829252651823114/OptiCraft_Java_1.16.5.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829253125775371/OptiCraft_Java_1.16.5.7z.006
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829253603938375/OptiCraft_Java_1.16.5.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829253914308689/OptiCraft_Java_1.16.5.7z.008
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\OptiCraft\Compressed" https://cdn.discordapp.com/attachments/1153485403811217438/1153829254233071758/OptiCraft_Java_1.16.5.7z.009

:: Descomprimiendo el Archivo...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\OptiCraft\Compressed\OptiCraft_Java_1.16.5.7z.001" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Compressed"

:: Ejecutando el Juego...
cls
echo Ejecutando el Juego...
"%CD%\Downloaded\OptiCraft\OptiCraft Java 1.16.5\1-Minecraft Sodium.bat"

========================================================================================================================================================
:OptiGames
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Cuphead Lite (1.7 GB)
echo *2.- Gta IV Rip-Lite (7.7 GB)
echo *3.- PES 6 Portable (1.1 GB)
echo *4.- Ratatouille Portable (234 MB)
echo *5.- Craftsman PC Port (25 MB)
echo *6.- Volver para atras.

echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :Start
if "%op%"=="1" goto :CupheadLITE
if "%op%"=="2" goto :GtaIV
if "%op%"=="3" goto :PES6
if "%op%"=="4" goto :Ratatouille
if "%op%"=="5" goto :Craftsman
if "%op%"=="6" goto :Start
if "%op%"=="" goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:CupheadLITE
cls

::Comprobando si el juego ya ha sido descargado
if exist "%CD%\Downloaded\Games\Cuphead Lite\Cuphead_Lite.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\Games\Cuphead Lite\Cuphead_Lite.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Descargando las partes del Juego
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987792111087626/Cuphead_LITE.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987792455028898/Cuphead_LITE.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987792845086770/Cuphead_LITE.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987793335824485/Cuphead_LITE.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987793893675088/Cuphead_LITE.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987794241794168/Cuphead_LITE.7z.006
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987794644455554/Cuphead_LITE.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987795156148264/Cuphead_LITE.7z.008
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987795634311249/Cuphead_LITE.7z.009
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987796317970463/Cuphead_LITE.7z.010
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987957681225798/Cuphead_LITE.7z.020
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987958046138398/Cuphead_LITE.7z.011
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987958532669540/Cuphead_LITE.7z.012
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987958855635094/Cuphead_LITE.7z.013
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987959195369583/Cuphead_LITE.7z.014
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987959543500840/Cuphead_LITE.7z.015
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987959870660739/Cuphead_LITE.7z.016
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987960239751280/Cuphead_LITE.7z.017
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987960562716722/Cuphead_LITE.7z.018
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147987960927625388/Cuphead_LITE.7z.019
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988010525262005/Cuphead_LITE.7z.030
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988010961485978/Cuphead_LITE.7z.021
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988011489951794/Cuphead_LITE.7z.022
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988012127502366/Cuphead_LITE.7z.023
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988012496584784/Cuphead_LITE.7z.024
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988012895060069/Cuphead_LITE.7z.025
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988013259968673/Cuphead_LITE.7z.026
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988013708738590/Cuphead_LITE.7z.027
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988014086242304/Cuphead_LITE.7z.028
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988014530822315/Cuphead_LITE.7z.029
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988049452597338/Cuphead_LITE.7z.040
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988049872035971/Cuphead_LITE.7z.031
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988050283069440/Cuphead_LITE.7z.032
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988050719285418/Cuphead_LITE.7z.033
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988051075793009/Cuphead_LITE.7z.034
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988051465875496/Cuphead_LITE.7z.035
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988051889496074/Cuphead_LITE.7z.036
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988052321513532/Cuphead_LITE.7z.037
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988052719968376/Cuphead_LITE.7z.038
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988053110030426/Cuphead_LITE.7z.039
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988073683091496/Cuphead_LITE.7z.050
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988074094141511/Cuphead_LITE.7z.041
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988074438078535/Cuphead_LITE.7z.042
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988074748444672/Cuphead_LITE.7z.043
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988075083997370/Cuphead_LITE.7z.044
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988075415351426/Cuphead_LITE.7z.045
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988075725717656/Cuphead_LITE.7z.046
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988076065464400/Cuphead_LITE.7z.047
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988076401012776/Cuphead_LITE.7z.048
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988076887539782/Cuphead_LITE.7z.049
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988097620005046/Cuphead_LITE.7z.060
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988098123300884/Cuphead_LITE.7z.051
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988099046060102/Cuphead_LITE.7z.052
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988099452915842/Cuphead_LITE.7z.053
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988099910086687/Cuphead_LITE.7z.054
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988100274978987/Cuphead_LITE.7z.055
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988100790890536/Cuphead_LITE.7z.056
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988101143220364/Cuphead_LITE.7z.057
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988101554241546/Cuphead_LITE.7z.058
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988102044987512/Cuphead_LITE.7z.059
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988122651611304/Cuphead_LITE.7z.069
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988123146518668/Cuphead_LITE.7z.061
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988123561775174/Cuphead_LITE.7z.062
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988123914084413/Cuphead_LITE.7z.063
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988124354478140/Cuphead_LITE.7z.064
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988124740374530/Cuphead_LITE.7z.065
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988125075906560/Cuphead_LITE.7z.066 
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988125457580092/Cuphead_LITE.7z.067
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1147980497813770300/1147988125914779758/Cuphead_LITE.7z.068
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\Games\Compressed\Cuphead_LITE.7z.001" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\Games\Compressed"
cls

:: Ir al game downloaded para Avisar
goto :GameDownloaded

:GtaIV
cls

::Comprobando si el juego ya ha sido descargado
if exist "%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\gta_data\GTAIV.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\gta_data\GTAIV.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Descargando las Partes del Juego
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065994326155306/GTA-4-RIP.7z.311
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065994728800316/GTA-4-RIP.7z.312
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065995190181919/GTA-4-RIP.7z.313
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065995584438342/GTA-4-RIP.7z.314
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065996083572746/GTA-4-RIP.7z.315
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065996582690917/GTA-4-RIP.7z.316
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065997081804800/GTA-4-RIP.7z.317
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065997455106149/GTA-4-RIP.7z.318
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065974424191006/GTA-4-RIP.7z.310
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065974818447370/GTA-4-RIP.7z.301
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065975141421116/GTA-4-RIP.7z.302
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065975443406858/GTA-4-RIP.7z.303
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065975862829106/GTA-4-RIP.7z.304
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065976169009192/GTA-4-RIP.7z.305
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065976479400128/GTA-4-RIP.7z.306
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065976814936126/GTA-4-RIP.7z.307
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065977188241449/GTA-4-RIP.7z.308
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148065977808994507/GTA-4-RIP.7z.309
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064074916179988/GTA-4-RIP.7z.290
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064075264311386/GTA-4-RIP.7z.281
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064075595649124/GTA-4-RIP.7z.282
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064075960565932/GTA-4-RIP.7z.283
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064076363206656/GTA-4-RIP.7z.284
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064076812005396/GTA-4-RIP.7z.285
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064077172719626/GTA-4-RIP.7z.286
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064077562785792/GTA-4-RIP.7z.287
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064077969637416/GTA-4-RIP.7z.288
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064078372286514/GTA-4-RIP.7z.289
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064048974405724/GTA-4-RIP.7z.300
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064049343516732/GTA-4-RIP.7z.291
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064049712603276/GTA-4-RIP.7z.292
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064050094280714/GTA-4-RIP.7z.293
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064050614390844/GTA-4-RIP.7z.294
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064051113496606/GTA-4-RIP.7z.295
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064051470028880/GTA-4-RIP.7z.296
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064051830722560/GTA-4-RIP.7z.297
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064052187254864/GTA-4-RIP.7z.298
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064052564729956/GTA-4-RIP.7z.299
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064019870122054/GTA-4-RIP.7z.260
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064020440567849/GTA-4-RIP.7z.251
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064020851589213/GTA-4-RIP.7z.252
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064021296189450/GTA-4-RIP.7z.253
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064021694664704/GTA-4-RIP.7z.254
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064022122463313/GTA-4-RIP.7z.255
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064022520942632/GTA-4-RIP.7z.256
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064022931963915/GTA-4-RIP.7z.257
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064023343026256/GTA-4-RIP.7z.258
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148064023754047558/GTA-4-RIP.7z.259
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063991860572251/GTA-4-RIP.7z.280
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063992250638478/GTA-4-RIP.7z.271
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063992623935498/GTA-4-RIP.7z.272
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063993022390412/GTA-4-RIP.7z.273
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063993383092294/GTA-4-RIP.7z.274
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063993806729376/GTA-4-RIP.7z.275
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063994163232808/GTA-4-RIP.7z.276
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063994544926811/GTA-4-RIP.7z.277
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063994951770183/GTA-4-RIP.7z.278
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063995299889232/GTA-4-RIP.7z.279
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063963070869598/GTA-4-RIP.7z.270
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063963431583785/GTA-4-RIP.7z.261
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063963825844286/GTA-4-RIP.7z.262
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063964186550362/GTA-4-RIP.7z.263
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063964555657318/GTA-4-RIP.7z.264
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063965071552542/GTA-4-RIP.7z.265
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063965520339025/GTA-4-RIP.7z.266
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063965851697253/GTA-4-RIP.7z.267
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063966241763380/GTA-4-RIP.7z.268
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063966568915044/GTA-4-RIP.7z.269
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063936244101210/GTA-4-RIP.7z.250
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063936604819567/GTA-4-RIP.7z.241
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063937070383194/GTA-4-RIP.7z.242
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063937439477820/GTA-4-RIP.7z.243
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063937875693598/GTA-4-RIP.7z.244
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063938207035483/GTA-4-RIP.7z.245
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063938592919642/GTA-4-RIP.7z.246
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063939008151572/GTA-4-RIP.7z.247
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063939356274859/GTA-4-RIP.7z.248
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063939733770320/GTA-4-RIP.7z.249
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063907827683428/GTA-4-RIP.7z.240
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063908272283759/GTA-4-RIP.7z.231
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063908662362154/GTA-4-RIP.7z.232
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063909031448586/GTA-4-RIP.7z.233
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063909366996992/GTA-4-RIP.7z.234
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063909757075536/GTA-4-RIP.7z.235
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063910117777428/GTA-4-RIP.7z.236
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063910948257832/GTA-4-RIP.7z.237
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063911493509251/GTA-4-RIP.7z.238
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063911946502204/GTA-4-RIP.7z.239
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063873438601238/GTA-4-RIP.7z.230
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063873891569714/GTA-4-RIP.7z.221
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063874365538334/GTA-4-RIP.7z.222
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063874839490610/GTA-4-RIP.7z.223
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063875195998280/GTA-4-RIP.7z.224
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063875556716575/GTA-4-RIP.7z.225
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063875959361607/GTA-4-RIP.7z.226
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063876370411540/GTA-4-RIP.7z.227
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063876747890708/GTA-4-RIP.7z.228
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063877150556241/GTA-4-RIP.7z.229
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063831071936532/GTA-4-RIP.7z.220
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063831441018972/GTA-4-RIP.7z.211
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063831931748382/GTA-4-RIP.7z.212
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063832305061918/GTA-4-RIP.7z.213
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063832678350928/GTA-4-RIP.7z.214
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063833051627610/GTA-4-RIP.7z.215
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063833542381669/GTA-4-RIP.7z.216
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063833986973756/GTA-4-RIP.7z.217
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063834339278898/GTA-4-RIP.7z.218
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063834771312750/GTA-4-RIP.7z.219
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063705490272296/GTA-4-RIP.7z.210
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063705955848313/GTA-4-RIP.7z.201
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063706471739432/GTA-4-RIP.7z.202
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063706991841390/GTA-4-RIP.7z.203
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063707440623617/GTA-4-RIP.7z.204
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063707834888353/GTA-4-RIP.7z.205
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063708245934161/GTA-4-RIP.7z.206
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063708715700285/GTA-4-RIP.7z.207
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063709118345236/GTA-4-RIP.7z.208
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148063709638447114/GTA-4-RIP.7z.209
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052028648603688/GTA-4-RIP.7z.200
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052029101572157/GTA-4-RIP.7z.191
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052029537796246/GTA-4-RIP.7z.192
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052029873324083/GTA-4-RIP.7z.193
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052030196289647/GTA-4-RIP.7z.194
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052030628298823/GTA-4-RIP.7z.195
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052031018385479/GTA-4-RIP.7z.196
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052031555240046/GTA-4-RIP.7z.197
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052032188583976/GTA-4-RIP.7z.198
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148052032528318554/GTA-4-RIP.7z.199
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051429622300682/GTA-4-RIP.7z.190
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051429966225518/GTA-4-RIP.7z.181
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051430293372938/GTA-4-RIP.7z.182
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051430800900217/GTA-4-RIP.7z.183
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051431107076166/GTA-4-RIP.7z.184
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051431446806578/GTA-4-RIP.7z.185
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051431782367343/GTA-4-RIP.7z.186
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051432130486362/GTA-4-RIP.7z.187
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051432566685706/GTA-4-RIP.7z.188
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051432923217982/GTA-4-RIP.7z.189
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051402132815892/GTA-4-RIP.7z.180
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051402527084604/GTA-4-RIP.7z.171
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051403143655444/GTA-4-RIP.7z.172
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051404024447026/GTA-4-RIP.7z.173
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051404351606925/GTA-4-RIP.7z.174
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051404733296760/GTA-4-RIP.7z.175
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051405173690509/GTA-4-RIP.7z.176
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051405597323274/GTA-4-RIP.7z.177
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051406159347872/GTA-4-RIP.7z.178
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051406696231033/GTA-4-RIP.7z.179
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051376279142430/GTA-4-RIP.7z.170
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051376685977630/GTA-4-RIP.7z.161
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051377042497616/GTA-4-RIP.7z.162
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051377529045002/GTA-4-RIP.7z.163
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051377935884389/GTA-4-RIP.7z.164
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051378313379902/GTA-4-RIP.7z.165
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051378736992306/GTA-4-RIP.7z.166
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051379097706537/GTA-4-RIP.7z.167
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051379802357921/GTA-4-RIP.7z.168
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051380188221513/GTA-4-RIP.7z.169
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051349506895966/GTA-4-RIP.7z.160
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051350144421989/GTA-4-RIP.7z.151
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051350664523917/GTA-4-RIP.7z.152
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051351138488410/GTA-4-RIP.7z.153
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051351499190394/GTA-4-RIP.7z.154
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051352002514964/GTA-4-RIP.7z.155
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051352438714431/GTA-4-RIP.7z.156
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051352799432704/GTA-4-RIP.7z.157
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051353164328991/GTA-4-RIP.7z.158
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051353558601728/GTA-4-RIP.7z.159
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051317126864916/GTA-4-RIP.7z.150
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051317563076680/GTA-4-RIP.7z.141
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051318108344330/GTA-4-RIP.7z.142
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051318561321042/GTA-4-RIP.7z.143
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051318976565338/GTA-4-RIP.7z.144
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051319354032128/GTA-4-RIP.7z.145
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051323275718766/GTA-4-RIP.7z.146
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051323648999514/GTA-4-RIP.7z.147
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051324106191008/GTA-4-RIP.7z.148
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051324991197255/GTA-4-RIP.7z.149
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051284860092436/GTA-4-RIP.7z.140
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051285313069066/GTA-4-RIP.7z.131
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051285686370455/GTA-4-RIP.7z.132
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051286097416284/GTA-4-RIP.7z.133
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051286542000148/GTA-4-RIP.7z.134
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051286919495710/GTA-4-RIP.7z.135
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051287221489806/GTA-4-RIP.7z.136
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051287825457192/GTA-4-RIP.7z.137
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051288236507136/GTA-4-RIP.7z.138
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051288572055632/GTA-4-RIP.7z.139
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051257622286346/GTA-4-RIP.7z.124
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051257970401342/GTA-4-RIP.7z.125
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051259081900032/GTA-4-RIP.7z.126
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051259463585802/GTA-4-RIP.7z.127
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051259773952091/GTA-4-RIP.7z.128
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051260134670376/GTA-4-RIP.7z.129
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051261170667621/GTA-4-RIP.7z.130
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051261468450877/GTA-4-RIP.7z.121
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051261892083815/GTA-4-RIP.7z.122
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051262294741012/GTA-4-RIP.7z.123
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051097693454346/GTA-4-RIP.7z.120
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051098037403718/GTA-4-RIP.7z.111
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051098461024306/GTA-4-RIP.7z.112
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051099014660117/GTA-4-RIP.7z.113
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051099337638058/GTA-4-RIP.7z.114
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051099660595340/GTA-4-RIP.7z.115
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051100029681736/GTA-4-RIP.7z.116
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051100369436753/GTA-4-RIP.7z.117
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051100713365515/GTA-4-RIP.7z.118
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051101053091921/GTA-4-RIP.7z.119
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051063480537109/GTA-4-RIP.7z.110
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051063837032489/GTA-4-RIP.7z.101
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051064176791582/GTA-4-RIP.7z.102
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051064512331887/GTA-4-RIP.7z.103
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051064881414154/GTA-4-RIP.7z.104
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051065237950514/GTA-4-RIP.7z.105
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051065581879456/GTA-4-RIP.7z.106
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051065997119528/GTA-4-RIP.7z.107
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051066362019950/GTA-4-RIP.7z.108
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148051066794016888/GTA-4-RIP.7z.109
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040529439891546/GTA-4-RIP.7z.095
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040529834147930/GTA-4-RIP.7z.096
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040530203254794/GTA-4-RIP.7z.097
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040530488459345/GTA-4-RIP.7z.098
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040530807246929/GTA-4-RIP.7z.099
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040531268608071/GTA-4-RIP.7z.100
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040531637719070/GTA-4-RIP.7z.091
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040532019388476/GTA-4-RIP.7z.092
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040532388499527/GTA-4-RIP.7z.093
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040532757585960/GTA-4-RIP.7z.094
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040502021726359/GTA-4-RIP.7z.090
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040502395027518/GTA-4-RIP.7z.081
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040502806065272/GTA-4-RIP.7z.082
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040503141613589/GTA-4-RIP.7z.083
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040503548457000/GTA-4-RIP.7z.084
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040504009826314/GTA-4-RIP.7z.085
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040504399904788/GTA-4-RIP.7z.086
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040504718667826/GTA-4-RIP.7z.087
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040505079373905/GTA-4-RIP.7z.088
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040505414926476/GTA-4-RIP.7z.089
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040476000268328/GTA-4-RIP.7z.079
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040476390330418/GTA-4-RIP.7z.080
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040476772020364/GTA-4-RIP.7z.071
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040477149515917/GTA-4-RIP.7z.072
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040477480849439/GTA-4-RIP.7z.073
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040477799624754/GTA-4-RIP.7z.074
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040478126788638/GTA-4-RIP.7z.075
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040478479093820/GTA-4-RIP.7z.076
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040478911123466/GTA-4-RIP.7z.077
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040479326343209/GTA-4-RIP.7z.078
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040450125602816/GTA-4-RIP.7z.070
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040450561802350/GTA-4-RIP.7z.061
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040450926714920/GTA-4-RIP.7z.062
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040451417440336/GTA-4-RIP.7z.063
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040452021440532/GTA-4-RIP.7z.064
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040452407304352/GTA-4-RIP.7z.065
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040452814164039/GTA-4-RIP.7z.066
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040453166473226/GTA-4-RIP.7z.067
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040453535584346/GTA-4-RIP.7z.068
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040453925634098/GTA-4-RIP.7z.069
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040424850731018/GTA-4-RIP.7z.059
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040425270149180/GTA-4-RIP.7z.060
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040425664426096/GTA-4-RIP.7z.051
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040425991585832/GTA-4-RIP.7z.052
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040426385846354/GTA-4-RIP.7z.053
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040426843029514/GTA-4-RIP.7z.054
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040427161780314/GTA-4-RIP.7z.055
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040427665109032/GTA-4-RIP.7z.056
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040428046794762/GTA-4-RIP.7z.057
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040428344574062/GTA-4-RIP.7z.058
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040397831012352/GTA-4-RIP.7z.049
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040398200127579/GTA-4-RIP.7z.050
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040398531461210/GTA-4-RIP.7z.041
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040398887985163/GTA-4-RIP.7z.042
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040399248687124/GTA-4-RIP.7z.043
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040399609405481/GTA-4-RIP.7z.044
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040400339206286/GTA-4-RIP.7z.045
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040400666378310/GTA-4-RIP.7z.046
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040401014497362/GTA-4-RIP.7z.047
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040401408753674/GTA-4-RIP.7z.048
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040356160606308/GTA-4-RIP.7z.040
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040356487778324/GTA-4-RIP.7z.031
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040356777177138/GTA-4-RIP.7z.032
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040357087547512/GTA-4-RIP.7z.033
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040357435691148/GTA-4-RIP.7z.034
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040357741867028/GTA-4-RIP.7z.035
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040358085791804/GTA-4-RIP.7z.036
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040358429741107/GTA-4-RIP.7z.037
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040358773665864/GTA-4-RIP.7z.038
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040359121784993/GTA-4-RIP.7z.039
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040264473129000/GTA-4-RIP.7z.030
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040264930312334/GTA-4-RIP.7z.021
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040265282637844/GTA-4-RIP.7z.022
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040265655922881/GTA-4-RIP.7z.023
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040266045997167/GTA-4-RIP.7z.024
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040266377351219/GTA-4-RIP.7z.025
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040266780000256/GTA-4-RIP.7z.026
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040267123937481/GTA-4-RIP.7z.027
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040267488833656/GTA-4-RIP.7z.028
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040267832770670/GTA-4-RIP.7z.029
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040225323495434/GTA-4-RIP.7z.020
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040225759694918/GTA-4-RIP.7z.011
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040226216882227/GTA-4-RIP.7z.012
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040226682441838/GTA-4-RIP.7z.013
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040227059945513/GTA-4-RIP.7z.014
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040227416445008/GTA-4-RIP.7z.015
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040227861057557/GTA-4-RIP.7z.016
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040228188205056/GTA-4-RIP.7z.017
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040228641181757/GTA-4-RIP.7z.018
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040229190643772/GTA-4-RIP.7z.019
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040077029670982/GTA-4-RIP.7z.010
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040077394591854/GTA-4-RIP.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040077730140170/GTA-4-RIP.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040078057275452/GTA-4-RIP.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040078589968384/GTA-4-RIP.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040078967459891/GTA-4-RIP.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040079349121064/GTA-4-RIP.7z.006
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040079676293130/GTA-4-RIP.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040080062173354/GTA-4-RIP.7z.008
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148024319587393619/1148040080448028732/GTA-4-RIP.7z.009
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\Games\Compressed\GTA-4-RIP.7z.001" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\Games\Compressed"
cls

:: Ir al game downloaded para Avisar
goto :GameDownloaded

--------------------------------------------------------------------------------------------------------------------------------------------------------

:PES6
cls

::Comprobando si el juego ya ha sido descargado
if exist "%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Descargando las Partes del Juego
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016557088317500/PES-6-Portable.7z.010
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016557449031742/PES-6-Portable.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016557763612792/PES-6-Portable.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016558229168150/PES-6-Portable.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016558543745024/PES-6-Portable.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016558912852039/PES-6-Portable.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016559252578344/PES-6-Portable.7z.006
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016559596515338/PES-6-Portable.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016559915290734/PES-6-Portable.7z.008
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016560255016960/PES-6-Portable.7z.009
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016581503361115/PES-6-Portable.7z.020
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016581843103824/PES-6-Portable.7z.011
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016582182834226/PES-6-Portable.7z.012
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016582493216908/PES-6-Portable.7z.013
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016582811988018/PES-6-Portable.7z.014
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016583139135498/PES-6-Portable.7z.015
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016583432740935/PES-6-Portable.7z.016
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016583780872272/PES-6-Portable.7z.017
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016584154157056/PES-6-Portable.7z.018
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016584477122611/PES-6-Portable.7z.019
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016604576239747/PES-6-Portable.7z.030
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016604966301769/PES-6-Portable.7z.021
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016605360554036/PES-6-Portable.7z.022
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016606136520704/PES-6-Portable.7z.023
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016606547542117/PES-6-Portable.7z.024
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016606878904340/PES-6-Portable.7z.025
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016607327703161/PES-6-Portable.7z.026
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016607843582172/PES-6-Portable.7z.027
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016608317550804/PES-6-Portable.7z.028
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016608732774452/PES-6-Portable.7z.029
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016628836085780/PES-6-Portable.7z.040
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016629138063450/PES-6-Portable.7z.031
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016629461041202/PES-6-Portable.7z.032
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016629855301725/PES-6-Portable.7z.033
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016630182445056/PES-6-Portable.7z.034
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016630492839957/PES-6-Portable.7z.035
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016630807408761/PES-6-Portable.7z.036
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016631168106496/PES-6-Portable.7z.037
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016631574970368/PES-6-Portable.7z.038
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016631914704946/PES-6-Portable.7z.039
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016639808381088/PES-6-Portable.7z.043
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016640156499979/PES-6-Portable.7z.044
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016640466886716/PES-6-Portable.7z.041
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148010464412966963/1148016640815026196/PES-6-Portable.7z.042
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\Games\Compressed\PES-6-Portable.7z.001" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\Games\Compressed"
cls

:: Ir al game downloaded para Avisar
goto :GameDownloaded

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Ratatouille
cls

::Comprobando si el juego ya ha sido descargado
if exist "%CD%\Downloaded\Games\Ratatouille The VideoGame RIP\overlay.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\Games\Ratatouille The VideoGame RIP\overlay.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Descargando Juego...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008706915700787/Ratatouille_The_VideoGame_RIP.7z.007
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008707238678568/Ratatouille_The_VideoGame_RIP.7z.008
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008711227449394/Ratatouille_The_VideoGame_RIP.7z.009
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008711617515520/Ratatouille_The_VideoGame_RIP.7z.010
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008711944687777/Ratatouille_The_VideoGame_RIP.7z.001
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008712267636796/Ratatouille_The_VideoGame_RIP.7z.002
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008712611565679/Ratatouille_The_VideoGame_RIP.7z.003
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008712951320666/Ratatouille_The_VideoGame_RIP.7z.004
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008713370738688/Ratatouille_The_VideoGame_RIP.7z.005
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1148003684706435082/1148008713706279082/Ratatouille_The_VideoGame_RIP.7z.006
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\Games\Compressed\Ratatouille_The_VideoGame_RIP.7z.001" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\Games\Compressed"
cls

:: Ir al game downloaded para Avisar
goto :GameDownloaded

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Craftsman
cls

::Comprobando si el juego ya ha sido descargado
if exist "%CD%\Downloaded\Games\Craftsman MOD PC PORT By OptiJuegos\Craftsman.exe" (
	echo Ejecutando el Juego...
	echo.
    "%CD%\Downloaded\Games\Craftsman MOD PC PORT By OptiJuegos\Craftsman.exe"
	goto :Start
) else (
    echo Descargando el Juego...
	echo.
)

:: Descargando Juego...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Games\Compressed" https://cdn.discordapp.com/attachments/1154474086320308224/1154474473718820894/Craftsman_MOD_PC_PORT_By_OptiJuegos.7z
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" x "%CD%\Downloaded\Games\Compressed\Craftsman_MOD_PC_PORT_By_OptiJuegos.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\Games\Compressed"
cls

:: Ir al game downloaded para Avisar
goto :GameDownloaded

--------------------------------------------------------------------------------------------------------------------------------------------------------

:GameDownloaded
:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.
echo Tu juego se ha descargado y descomprimido correctamente.
echo Visita la carpeta Games para encontrar el ejecutable.

timeout /t 5 /nobreak

:: Ir al inicio
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

========================================================================================================================================================
:Utilities
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Borrar archivos Temporales.
echo *2.- Instalar dependencias para Programas (Visual C++).
echo *3.- Descargar e Instalar actualizaciones necesarias en Windows 7 (Arregla los problemas en OptiCraft).
::echo *4.- Preguntas frecuentes de OptiCraft.
echo *4.- Volver para atras.
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :Start
if "%op%"=="1" goto :Temp
if "%op%"=="2" goto :Runtimes
if "%op%"=="3" goto :Updates
::if "%op%"=="4" goto :FAQ
if "%op%"=="4" goto :Start
if "%op%"=="" goto :Start
pause

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Runtimes
cls

:: Descargando el Visual C++, Net Framework Y DirectX x86
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Runtimes\VisualC" https://cdn.discordapp.com/attachments/1152091227303452702/1152094349346213979/vcredist2005_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Runtimes\VisualC" https://cdn.discordapp.com/attachments/1152091227303452702/1152091684201570304/vcredist2008_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Runtimes\VisualC" https://cdn.discordapp.com/attachments/1152091227303452702/1152091681068433429/vcredist2010_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Runtimes\VisualC" https://cdn.discordapp.com/attachments/1152091227303452702/1152091681835991121/vcredist2012_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Runtimes\VisualC" https://cdn.discordapp.com/attachments/1152091227303452702/1152091682838429707/vcredist2013_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Runtimes\VisualC" https://cdn.discordapp.com/attachments/1152091227303452702/1152091683530489927/vcredist2015_2017_2019_x86.exe

cls

:: Instalando Visual C++ 2015-2017-2019-2022
echo Instalando Visual C++ 2005
"%CD%\Downloaded\Runtimes\VisualC\vcredist2005_x86.exe" /q
echo Instalando Visual C++ 2008
"%CD%\Downloaded\Runtimes\VisualC\vcredist2008_x86.exe" /q /norestart
echo Instalando Visual C++ 2010
"%CD%\Downloaded\Runtimes\VisualC\vcredist2010_x86.exe" /install /passive
echo Instalando Visual C++ 2012
"%CD%\Downloaded\Runtimes\VisualC\vcredist2012_x86.exe" /install /passive
echo Instalando Visual C++ 2013
"%CD%\Downloaded\Runtimes\VisualC\vcredist2013_x86.exe" /install /passive
echo Instalando Visual C++ 2015
"%CD%\Downloaded\Runtimes\VisualC\vcredist2015_2017_2019_x86.exe" /install /passive

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\OptiCraft\Runtimes"

:: Avisar que se instalo el coso
cls
echo %LAUNCHER_TEXT%
echo.
echo Se ha instalado Visual C++ 2005-2022!
echo Si tuviste algun error en la instalacion
echo Porfavor comprueba de tener tu Sistema Operativo
echo Con las ultimas actualizaciones y Parches de Seguridad.
echo.

timeout 3 /nobreak
goto :Utilities

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Updates
:: Comprobando si el sistema es Windows 7
ver | findstr /i "6\.1\."
if %errorlevel%==0 (
    @echo off
) else (
	cls
    echo.
    echo Tu sistema no esta corriendo Windows 7.
	echo No se instalara ninguna Actualizacion.
	timeout /t 3 /nobreak
	goto :Start
)

:: Cartel de comprobacion
echo.
echo Antes de realizar este paso
echo Es recomendable crear un punto de restauracion
echo Por si te ocurre algun error!
echo.
pause

:: Habilitando el servicio de windows update.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d 00000003 /f

:: Comprobando si el OS es 32 o 64 Bits 
if "%PROCESSOR_ARCHITECTURE%"=="x86" goto 32Bits
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64Bits

:32Bits
:: Descargando update KB9766932 (Service Pack 1, NECESARIA PARA TODO)
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\UpdatesW7" https://archive.org/download/windows-7-service-pack-1-kb976932/windows6.1-KB976932-X86.exe

:: Descargando update KB2670838 (Plataform Update, necesaria para correr multiples apps DX10 y obtener software Render)
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\UpdatesW7" https://download.microsoft.com/download/1/4/9/14936FE9-4D16-4019-A093-5E00182609EB/Windows6.1-KB2670838-x86.msu

:: Descargando update KB3080149 (EventSetInformation ADVAPI32.dll, necesaria OptiCraft 1.20)
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\UpdatesW7" https://download.microsoft.com/download/C/8/0/C8036E07-4382-46BD-BFFB-46A6D397222A/Windows6.1-KB3080149-x86.msu

:: Instalando update KB9766932
"%CD%\Downloaded\UpdateW7\windows6.1-KB976932-X86.exe" /quiet /norestart

:: Instalando update KB2670838
"wusa.exe" "%CD%\Downloaded\UpdateW7\Windows6.1-KB2670838-x86.msu" /quiet /norestart

:: Instalando update KB3080149
"wusa.exe" "%CD%\Downloaded\UpdateW7\Windows6.1-KB3080149-x86.msu" /quiet /norestart
goto :Finalizado

:64Bits
:: Descargando update KB9766932 (Service Pack 1, NECESARIA PARA TODO)
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\UpdatesW7" https://archive.org/download/windows-7-service-pack-1-kb976932/windows6.1-KB976932-X64.exe

:: Descargando update KB2670838 (Plataform Update, necesaria para correr multiples apps DX10 y obtener software Render)
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\UpdatesW7" https://catalog.s.download.windowsupdate.com/msdownload/update/software/ftpk/2013/02/windows6.1-kb2670838-x64_9f667ff60e80b64cbed2774681302baeaf0fc6a6.msu

:: Descargando update KB3080149 (EventSetInformation ADVAPI32.dll, necesaria OptiCraft 1.20)
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\UpdatesW7" https://catalog.s.download.windowsupdate.com/d/msdownload/update/software/updt/2015/08/windows6.1-kb3080149-x64_f25965cefd63a0188b1b6f4aad476a6bd28b68ce.msu

:: Instalando update KB9766932
"%CD%\Downloaded\UpdateW7\windows6.1-KB976932-X64.exe" /quiet /norestart

:: Instalando update KB2670838
"wusa.exe" "%CD%\Downloaded\UpdateW7\Windows6.1-KB2670838-x64.msu" /quiet /norestart

:: Instalando update KB3080149
"wusa.exe" "%CD%\Downloaded\UpdateW7\Windows6.1-KB3080149-x64.msu" /quiet /norestart
goto :Finalizado

:Finalizado
echo.
echo Las actualizaciones se han Instalado.
echo Tu computadora se reiniciara en 15 Segundos.
echo.
shutdown /r /t 0

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Temp
:: Borrando Archivos Temporales...
Del /S /F /Q "%temp%"
Del /S /F /Q "%SystemDrive%\Windows\Temp\*.*"
Del /S /F /Q "%SystemDrive%\Windows\Prefetch\*.*"

:: Avisar que se instalo el coso
cls
echo Archivos Temporales.
echo.
echo Se han borrado los Archivos Temporales!
echo Que se encontraban en %temp% y Prefetch.

timeout 3 /nobreak
goto :Utilities

========================================================================================================================================================

:About
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.
echo Inspirado en varios launchers que me hicieron, hice el codigo desde 0.
echo Utiliza WGET-7z para descargar y descomprimir archivos
echo Hecho en 1 semana. Sin mucha dedicacion por Dia
echo.
echo *Creado por OptiJuegos, tambien el creador del OptiCraft.*
echo.

:: Codigo para ir al menu con las Opciones
pause
goto :Start

========================================================================================================================================================

:Update
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Descargando .bat de github
%CD%\Assets\Update.bat

