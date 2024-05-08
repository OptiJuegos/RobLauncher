@echo off
setlocal enabledelayedexpansion

CD /D "%~dp0"

:: Establecer las Variables de Entorno...
set FFPLAY="Assets\ffplay.exe"
set WGET="Assets\wget.exe"
set LAUNCHER_TEXT=*RobLauncher V1.8 FIX - Un launcher para OptiCraft y Demas Proyectos.*
set LAUNCHER_VER=RobLauncher V1.8 FIX

:: Establecer el Titulo del launcher
title %LAUNCHER_VER%

:: Crear la carpeta "Downloaded", donde van a ir todas las cosas descargadas.
mkdir "Assets\extra" >nul 2>&1	
mkdir "Downloaded" >nul 2>&1
mkdir "Downloaded\Compressed" >nul 2>&1
mkdir "Downloaded\Games" >nul 2>&1
mkdir "Downloaded\OptiCraft" >nul 2>&1
mkdir "Downloaded\OptiCraft\FAQ" >nul 2>&1
mkdir "Downloaded\Utilities" >nul 2>&1

:Options
:: Comprobar si existe el archivo Options.txt, si no ir a un mini tutorial para los TOPOS (chiste los quiero mucho)
if exist "%CD%\Assets\extra\options.txt" (
    goto :Start
) else (
    goto :Tutorial
)


:Tutorial
cls

echo.
echo Hola bienvenido al %LAUNCHER_VER%!
echo.
echo ============================================================
echo -Un launcher para OptiCraft y demas Proyectos!
echo -Para moverte por los menus, debes seleccionar las Opciones
echo -Utilizando los numeros, como 1-2-3-4-5 y presionando Enter.
echo ============================================================
echo.
pause

:: Crear un archivo de Options (como mc), para despues comprobar si no es la primera vez ejecutando el %LAUNCHER_TEXT% 
type nul > "%CD%\Assets\extra\options.txt"

:: Ir al inicio del launcher
goto :Start


:Start
:StartBE
:StartJE
:StartGames
:StartUtilities
:StartAbout
:StartChannels
:StartMovies
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
echo *7.- Canales Television
echo *8.- Peliculas
echo.

:: Comprobando si el sistema es Windows XP
ver | findstr /i "5\.1\."
if %errorlevel%==0 (
goto :OldOSWarning
) else (
goto :StartContinue
)

:: Advertencia Windows antiguos
:OldOSWarning
echo ======================================================================================
echo -Tu Windows es bastante antiguo, lo que puede generar multiples fallas con el Launcher
echo -Te recomendamos que, si es posible, actualices a un Windows mas reciente.
echo ======================================================================================
echo.

:StartContinue

:: Advertencia Links
echo ======================================================================================
echo -Si los proyectos no te descargan, es posible que el sitio que los tiene este caido
echo -Si esto te sucede, porfavor intenta descargar los juegos mas tarde
echo -Tambien, te recomiendo actualizar el launcher frecuentemente para evitar fallos
echo ======================================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :Start
if "%op%"=="1" goto :OptiCraftBE
if "%op%"=="2" goto :OptiCraftJE
if "%op%"=="3" goto :OptiGames
if "%op%"=="4" goto :Utilities
if "%op%"=="5" goto :AboutPage
if "%op%"=="6" goto :Update
if "%op%"=="7" goto :TV
if "%op%"=="8" goto :MOVIE
if "%op%"=="" goto :Start


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
echo ==============================================================================
echo -OptiCraft Bedrock requiere ciertas actualizaciones y dependencias que Windows
echo -No contiene por defecto, si el juego no te funciona o tienes algun error,
echo -Porfavor ve al apartado de Utilidades y instala todas las cosas de ahi (C++).
echo ==============================================================================
echo.

:: Aviso Render dragon
:Seguir
echo ===============================================================================
echo -Las versiones superiores a la 1.18.31 incluyen el motor grafico Render Dragon.
echo -Este motor grafico requiere un dispositivo con DirectX 10 o Superior 
echo -Si el juego tiene problemas, porfavor actualiza tu Driver de Video.
echo ===============================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :OptiCraftBE
if "%op%"=="1" goto :1.7.3.1
if "%op%"=="2" goto :1.9.1.0
if "%op%"=="3" goto :1.12.0
if "%op%"=="4" goto :1.14.31
if "%op%"=="5" goto :1.17.30
if "%op%"=="6" goto :1.18.31
if "%op%"=="7" goto :1.19.52
if "%op%"=="8" goto :1.20.10
if "%op%"=="9" goto :StartBE
if "%op%"=="" goto :OptiCraftBE
pause


:1.7.3.1
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.7.3.1 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.7.3.1 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.7.3.1 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.7.3.1 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:1.9.1.0
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.9.1.0 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.9.1.0 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.9.1.0 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.9.1.0 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:1.12.0
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.12.0 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:1.14.31
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.14.31 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.14.31 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.14.31 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.14.31 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:1.16.12
:: Al final no la añadi porque esta version usa OpenGL 4.1 y como todos tienen una Intel HD Graphics que no lo soporta no les va a abrir
:: Asi que la descarto.


:1.17.30
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.17.30 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.17.30 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.17.30 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.17.30 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:1.18.31
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.18.31 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.18.31 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.18.31 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.18.31 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.18.31 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:1.19.52
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.19.52 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.19.52 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.19.52 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.19.52 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:1.20.10
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.20.10 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.20.10 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.20.10 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.20.10 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe"

:: Cerrar proceso
exit


:OptiCraftJE
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
:: Aca solo estan las versiones mas estables y funcionales, las que no actualice las descarto por fallas para evitar quejas de los TOPOS (chiste los quiero mucho)
echo *1.- OptiCraft Java 1.5.2 (25 MB)
echo *2.- OptiCraft Java 1.8.9 (123 MB)
echo *3.- OptiCraft Java 1.12.2 (218 MB)
echo *4.- OptiCraft Java 1.16.5 (368 MB)
echo *5.- Volver para atras.
echo.

:: Aviso para pcs sin OpenGL 2.1
echo =====================================================================================
echo -Las versiones JAVA requieren un minimo de OpenGL 2.1 para funcionar correctamente.
echo -Si tu dispositivo no soporta esa version, podrias tener fallas al ejecutar OptiCraft
echo -Porfavor, manten tu driver de video actualizado para evitar este problema
echo =====================================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :OptiCraftJE
if "%op%"=="1" goto :1.5.2
if "%op%"=="2" goto :1.8.9
if "%op%"=="3" goto :1.12.2
if "%op%"=="4" goto :1.16.5
if "%op%"=="5" goto :StartJE
if "%op%"=="" goto :OptiCraftJE
goto :StartJE

:1.5.2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.5.2\1-OptiCraft.bat" (
	echo Ejecutando el Software...
	echo.
	"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.5.2\1-OptiCraft.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.5.2.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.5.2\1-OptiCraft.bat"

:: Cerrar proceso
exit


:1.8.9
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.8.9\1-OptiCraft.bat" (
	echo Ejecutando el Software...
	echo.
	"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.8.9\1-OptiCraft.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.8.9.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.8.9\1-OptiCraft.bat"

:: Cerrar proceso
exit


:1.12.2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft.bat" (
	echo Ejecutando el Software...
	echo.
	"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.12.2.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft.bat"

:: Cerrar proceso
exit


:1.16.5
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.16.5\1-Minecraft Sodium.bat" (
	echo Ejecutando el Software...
	echo.
	"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.16.5\1-Minecraft Sodium.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z" https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.16.5.7z?download=true
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.16.5\1-Minecraft Sodium.bat"

:: Cerrar proceso
exit


:OptiGames
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Call of Duty 2 - (3.5 GB)
echo *2 - Cuphead - (1.7 GB)
echo *3.- Craftsman PC - (25 MB)
echo *4.- Counter Strike 1.6 - (139 MB)
echo *5.- Counter Strike Global Offensive - (1.1 GB)
echo *6.- Geometry Dash - (172 MB)
echo *7.- Gta IV Lite - (11.3 GB)
echo *8.- Gta V Lite - (44.7 GB)
echo *9.- Hello Neighbor - (1.8 GB)
echo *10.- Hollow Knight - (936 MB)
echo *11.- Left 4 Dead 2 - (1.8 GB)
echo *12.- PES 6 - (1.1 GB)
echo *13.- PES 13 - (3.8 GB)
echo *14.- PES 17 - (4.0 GB)
echo *15.- Plants VS Zombies - (19 MB)
echo *16.- Poly Bridge 1 - (77 MB)
echo *17.- Portal 1 Lite - (512 MB)
echo *18.- Project Zomboid Lite - (315 MB)
echo *19.- Silent Hill 2 - (780 MB)
echo *20.- Sonic 1 PC - (33 MB)
echo *21.- Super Mario 64 PC - (15 MB)
echo *22.- The Forest Lite - (1.1 GB)
echo *23.- Youtubers Life - (684 MB)
echo *24.- Volver para atras.
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 
if "%op%"=="1" goto :COD2
if "%op%"=="2" goto :CupheadLITE
if "%op%"=="3" goto :Craftsman
if "%op%"=="4" goto :CS16
if "%op%"=="5" goto :CSGO
if "%op%"=="6" goto :GeometryDash
if "%op%"=="7" goto :GtaIV
if "%op%"=="8" goto :GtaV
if "%op%"=="9" goto :HelloNeighbor
if "%op%"=="10" goto :HollowKnight
if "%op%"=="11" goto :L4D2
if "%op%"=="12" goto :PES6
if "%op%"=="13" goto :PES13
if "%op%"=="14" goto :PES17
if "%op%"=="15" goto :PVZ
if "%op%"=="16" goto :PolyBridge
if "%op%"=="17" goto :Portal
if "%op%"=="18" goto :ProjectZomboid
if "%op%"=="19" goto :SH2
if "%op%"=="20" goto :Sonic
if "%op%"=="21" goto :SM64
if "%op%"=="22" goto :TheForest
if "%op%"=="23" goto :YoutubersLife
if "%op%"=="24" goto :StartGames
if "%op%"=="" goto :StartGames
goto :StartGames


:COD2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Call of Duty 2 Optimized\1-Call Of Duty 2 - Normal.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Call of Duty 2 Optimized\1-Call Of Duty 2 - Normal.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\COD2.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Call of Duty 2 Optimized.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\COD2.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\COD2.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Call of Duty 2 Optimized\1-Call Of Duty 2 - Normal.bat"

:: Cerrar proceso
exit


:CupheadLITE
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat" (
	echo Ejecutando el Software...
	echo.
	start "%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Cuphead LITE.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Cuphead LITE.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Cuphead LITE.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Cuphead LITE.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat"

:: Cerrar proceso
exit


:Craftsman
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Craftsman PC Port 1.9\Craftsman.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Craftsman PC Port 1.9\Craftsman.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Craftsman_MOD_PC_PORT_By_OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Craftsman PC Port 1.9.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Craftsman PC Port 1.9.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Craftsman PC Port 1.9.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Craftsman PC Port 1.9\Craftsman.exe"

:: Cerrar proceso
exit


:CS16
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Counter Strike 1.6 OptiClient\Counter-Strike 1.6.bat" (
	echo Ejecutando el Software...
	echo.
    "%CD%\Downloaded\Games\Counter Strike 1.6 OptiClient\Counter-Strike 1.6.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Counter Strike 1.6 Opti-Client.7z?download=true"
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Counter Strike 1.6 OptiClient\Counter-Strike 1.6.bat"

:: Cerrar proceso
exit


:CSGO
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Resurrection Strike V1.0\csgo.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Resurrection Strike V1.0\csgo.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Resurrection Strike V1.0.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Resurrection Strike V1.0.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Resurrection Strike V1.0.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Resurrection Strike V1.0.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Resurrection Strike V1.0\csgo.exe"

:: Cerrar proceso
exit


:GeometryDash
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Geometry Dash 2.2 Optimizado By OptiJuegos\gd_data\GeometryDash.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Geometry Dash 2.2 Optimizado By OptiJuegos\gd_data\GeometryDash.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Geometry Dash 2.2 Optimizado By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Geometry Dash 2.2 Optimizado By OptiJuegos\gd_data\GeometryDash.exe"

:: Cerrar proceso
exit


:GtaIV
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\1-Grand Theft Auto IV - NORMAL.bat" (
	echo Ejecutando el Software...
	echo.
	"%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\1-Grand Theft Auto IV - NORMAL.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/GTA 4 LITE By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\1-Grand Theft Auto IV - NORMAL.bat"

:: Cerrar proceso
exit


:GTAV
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\GTA V LITE V4\1-Grand Theft Auto V - NORMAL.bat" (
	echo Ejecutando el Software...
	echo.
    "%CD%\Downloaded\Games\GTA V LITE V4\1-Grand Theft Auto V - NORMAL.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Grand Theft Auto V LITE.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/GTA V LITE V4.zip?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Grand Theft Auto V LITE.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Grand Theft Auto V LITE.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Grand Theft Auto V LITE\1-Grand Theft Auto V - NORMAL.bat"

:: Cerrar proceso
exit


:HelloNeighbor
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Hello Neighbor Optimizado Y Portable V2\1-Hello Neighbor.bat" (
	echo Ejecutando el Software...
	echo.
    "%CD%\Downloaded\Games\Hello Neighbor Optimizado Y Portable V2\1-Hello Neighbor.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Hello Neighbor Optimizado Y Portable V2.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Hello Neighbor Optimizado Y Portable V2\1-Hello Neighbor.bat"

:: Cerrar proceso
exit


:HollowKnight
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Hollow Knight Optimizado\Hollow Knight.bat" (
	echo Ejecutando el Software...
	echo.
    "%CD%\Downloaded\Games\Hollow Knight Optimizado\Hollow Knight.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hollow Knight Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Hollow Knight Optimizado.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Hollow Knight Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Hollow Knight Optimizado.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Hollow Knight Optimizado\Hollow Knight.bat"

:: Cerrar proceso
exit


:L4D2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Left 4 Dead 2 LITE By OptiJuegos\1-Left 4 Dead 2.bat" (
	echo Ejecutando el Software...
	echo.
    "%CD%\Downloaded\Games\Left 4 Dead 2 LITE By OptiJuegos\1-Left 4 Dead 2.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Left 4 Dead 2 LITE By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Left 4 Dead 2 LITE By OptiJuegos\1-Left 4 Dead 2.bat"

:: Cerrar proceso
exit


:PES6
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat" (
	echo Ejecutando el Software...
	echo.
    "%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\PES 6 Portable Y Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/PES 6 Portable Y Optimizado.7z?download=true"

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\PES 6 Portable Y Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\PES 6 Portable Y Optimizado.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat"

:: Cerrar proceso
exit


:PES13
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Pro Evolution Soccer 2013\Pro Evolution Soccer 13.bat" (
	echo Ejecutando el Software...
	echo.
    "%CD%\Downloaded\Games\Pro Evolution Soccer 2013\Pro Evolution Soccer 13.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Pro Evolution Soccer 2013.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Pro Evolution Soccer 2013.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Pro Evolution Soccer 2013.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Pro Evolution Soccer 2013.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Pro Evolution Soccer 2013\Pro Evolution Soccer 13.bat"

:: Cerrar proceso
exit


:PES17
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Pro Evolution Soccer 2017 Optimized\pesdata\PES2017.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Pro Evolution Soccer 2017 Optimized\pesdata\PES2017.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Pro Evolution Soccer 2017 Optimized.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Pro Evolution Soccer 2017 Optimized.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Pro Evolution Soccer 2017 Optimized.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Pro Evolution Soccer 2017 Optimized.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Pro Evolution Soccer 2017 Optimized\pesdata\PES2017.exe"

:: Cerrar proceso
exit


:PVZ
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Plants vs Zombies\PlantsVsZombies.exe" (
	echo Ejecutando el Software...
	echo.
	cd "%CD%\Downloaded\Games\Plants vs Zombies"
    start "" "PlantsVsZombies.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Plants_vs_Zombies.7z" "https://web.archive.org/web/20240507002159/https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Plants vs Zombies.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Plants_vs_Zombies.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\Games\Compressed"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
cd "%CD%\Downloaded\Games\Plants vs Zombies"
start "" "%CD%\PlantsVsZombies.exe"

:: Cerrar proceso
exit


:PolyBridge
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Poly Bridge v0.73b Optimizado\polydata\polybridge.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Poly Bridge v0.73b Optimizado\polydata\polybridge.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Poly_Bridge_v0.73b_Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Poly Bridge v0.73b Optimizado.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Poly_Bridge_v0.73b_Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "%CD%\Downloadeds\Compressed\Poly_Bridge_v0.73b_Optimizado.7z"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Poly Bridge v0.73b Optimizado\polydata\polybridge.exe"

:: Cerrar proceso
exit


:Portal
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Portal 1 LITE By OptiJuegos\portaldata\portal.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Portal 1 LITE By OptiJuegos\portaldata\portal.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Portal 1 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Portal 1 LITE By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Portal 1 LITE By OptiJuegos.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "%CD%\Downloaded\Compressed\Portal 1 LITE By OptiJuegos.7z"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Portal 1 LITE By OptiJuegos\portaldata\portal.exe"

:: Cerrar proceso
exit


:ProjectZomboid
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\OptiZomboid\1-OptiZomboid.bat" (
	echo Ejecutando el Software...
	echo.
	"%CD%\Downloaded\Games\OptiZomboid\1-OptiZomboid.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiZomboid.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiZomboid.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiZomboid.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "%CD%\Downloaded\Compressed\OptiZomboid.7z"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\OptiZomboid V4\1-OptiZomboid.bat"

:: Cerrar proceso
exit


:SH2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Silent Hill 2\Silent Hill 2.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Silent Hill 2\Silent Hill 2.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Silent Hill 2 Portable.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Silent Hill 2 Portable.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Silent Hill 2 Portable.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Silent Hill 2 Portable.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Silent Hill 2\Silent Hill 2.bat"

:: Cerrar proceso
exit




:Sonic
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Sonic 1\Sonic 1.exe" (
	echo Ejecutando el Software...
	echo.
	cd "%CD%\Downloaded\Games\Sonic 1"
	start "" "Sonic 1.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Sonic 1.zip" "https://web.archive.org/web/20240507010058/https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Sonic 1.zip?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Sonic 1.zip" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "%CD%\Downloaded\Compressed\Sonic 1.zip"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
cd "%CD%\Downloaded\Games\Sonic 1"
start "" "Sonic 1.exe"

:: Cerrar proceso
exit


:SM64
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\SM64\SM64-60.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\SM64\SM64-60.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Super_Mario_64.zip" "https://web.archive.org/web/20240507010436/https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Super_Mario_64.zip?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Super_Mario_64.zip" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "%CD%\Downloaded\Compressed\Super_Mario_64.zip"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\SM64\SM64-60.exe"

:: Cerrar proceso
exit


:TheForest
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\The Forest Lite V1.0\gamedata\TheForest32.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\The Forest Lite V1.0\gamedata\TheForest32.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\The Forest Lite V1.0.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/The Forest Lite V1.0.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\The Forest Lite V1.0.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\The Forest Lite V1.0.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\The Forest Lite V1.0\gamedata\TheForest32.exe"

:: Cerrar proceso
exit


:YoutubersLife
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Youtubers Life Optimizado\gamedata\YoutubersLife.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Youtubers Life Optimizado\gamedata\YoutubersLife.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Youtubers Life Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Youtubers Life Optimizado.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Youtubers Life Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Youtubers Life Optimizado.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Youtubers Life Optimizado\gamedata\YoutubersLife.exe"

:: Cerrar proceso
exit


:Utilities
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Actualizar Drivers con Driver Booster.
echo *2.- Borrar archivos Temporales
echo *3.- Instalar dependencias para programas (Visual C++)
echo *4.- Preguntas frecuentes de OptiCraft.
echo *5.- Volver para atras.
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="" goto :Utilities
if "%op%"=="1" goto :Drivers
if "%op%"=="2" goto :Temp
if "%op%"=="3" goto :Runtimes
if "%op%"=="4" goto :FAQ
if "%op%"=="5" goto :StartUtilities
if "%op%"=="" goto :Start

:Drivers
cls

::Comprobando si el software ya ha sido descargado
if exist "%CD%\Downloaded\Utilities\DriverBooster\DriverBoosterPortable.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Utilities\DriverBooster\DriverBoosterPortable.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\Driver_Booster.7z" "https://web.archive.org/web/20240319014108/https://lozanoalberto228gmailcom-my.sharepoint.com/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/Documents/ProjectsOpti/DriverBooster.7z?ga=1"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Driver_Booster.7z" -o"%CD%\Downloaded\Utilities"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Driver_Booster.7z"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Utilities\DriverBooster\DriverBoosterPortable.exe"

:: Cerrar proceso
exit


:Temp
cls

:: Borrando Archivos Temporales...
Del /S /F /Q "%temp%"
Del /S /F /Q "%SystemDrive%\Windows\Temp\*.*"
Del /S /F /Q "%SystemDrive%\Windows\Prefetch\*.*"

:: Avisar que se instalo el coso
cls
echo.
echo %LAUNCHER_TEXT%
echo.
echo ========================================
echo -Se han borrado los Archivos Temporales
echo -Que se encontraban en Temp y Prefetch.
echo ========================================

timeout 5 /nobreak
goto :Utilities


:Runtimes
cls

:: Descargando el Visual C++, Net Framework Y DirectX x86
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://web.archive.org/web/20240507020145/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2005_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://web.archive.org/web/20240507020255/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2008_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2010_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2012_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2013_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2015_2017_2019_x86.exe
cls

:: Instalando Visual C++ 2015-2017-2019-2022
echo Instalando Visual C++ 2005
"%CD%\Downloaded\Utilities\Runtimes\vcredist2005_x86.exe" /q
echo Instalando Visual C++ 2008
"%CD%\DownloadedUtilities\Runtimes\vcredist2008_x86.exe" /q /norestart
echo Instalando Visual C++ 2010
"%CD%\Downloaded\Utilities\Runtimes\vcredist2010_x86.exe" /install /passive
echo Instalando Visual C++ 2012
"%CD%\DownloadedUtilities\Runtimes\vcredist2012_x86.exe" /install /passive
echo Instalando Visual C++ 2013
"%CD%\Downloaded\Utilities\Runtimes\vcredist2013_x86.exe" /install /passive
echo Instalando Visual C++ 2015
"%CD%\Downloaded\Utilities\Runtimes\vcredist2015_2017_2019_x86.exe" /install /passive

:: Borrando los archivos Comprimidos
RD /S /Q "%CD%\Downloaded\Utilities\Runtimes"

:: Avisar que se instalo el coso
cls
echo %LAUNCHER_TEXT%
echo.
echo ========================================================
echo -Se ha instalado Visual C++ 2005-2022!
echo -
echo -Si tuviste algun error en la instalacion
echo -Porfavor comprueba de tener tu Sistema Operativo
echo -Con las ultimas actualizaciones y Parches de Seguridad.
echo ========================================================
echo.

timeout 3 /nobreak
exit


:FAQ
cls

:: Borrando las preguntas frecuentes Anteriores
del "%CD%\Downloaded\OptiCraft\FAQ\FAQ.txt

:: Descargando el bloc de notas con el FAQ
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\OptiCraft\FAQ\FAQ.txt" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/FAQ.txt?download=true"

:: Iniciando el NOTEPAD
start "" "notepad.exe" "%CD%\Downloaded\OptiCraft\FAQ\FAQ.txt"

:: Codigo para ir al menu con las Opciones
exit


:AboutPage
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.
echo =================================================================================
echo -Launcher creado desde cero por mi, pensado para computadoras de bajos recursos
echo -Utiliza WGET y 7Zip para descargar y descomprimir archivos
echo -
echo -Hecho en 1 semana, sin mucha dedicacion por dia
echo -Creado por OptiJuegos, tambien el creador del OptiCraft.
echo =================================================================================
echo.

:: Codigo para ir al menu con las Opciones
pause
goto :StartAbout


:Update
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Avisando al Usuario
echo ==========================================================
echo -Para actualizar el Launcher, presiona la tecla "Enter"
echo -El launcher descargara la ultima actualizacion disponible.
echo -
echo -Si quieres cancelar este proceso, cierra el Launcher.
echo ==========================================================
echo.
pause

:: Borrando la version antigua del .bat actualizador
del "%CD%\Assets\Update.bat"
timeout /t 1 /nobreak

:: Descargando la ultima version del .bat actualizador:
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Assets" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/update.bat
timeout /t 1 /nobreak

:: Descargando .bat de github
"%CD%\Assets\Update.bat"
timeout /t 1 /nobreak


:TV
cls

:: Comprobando si esta FFPLAY
if exist "%CD%\Assets\ffplay.exe" (
	goto :TVLOL
) else (
    goto :FFPLAY
)

:FFPLAY
echo Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" "https://web.archive.org/web/20240507225542/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe"
cls
goto :TVLOL

:TVLOL

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- ESPN Premium
echo *2.- TYC Sports
echo *3.- TYC Sports Play 
echo *4.- TNT Sports
echo *5 - Cartoon Network
echo *6 - Personalizado
echo *7 - Volver para Atras
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="1" goto :ESPN
if "%op%"=="2" goto :TYC
if "%op%"=="3" goto :TYCPlay
if "%op%"=="4" goto :TNT
if "%op%"=="5" goto :Cartoon
if "%op%"=="6" goto :CustomTV
if "%op%"=="7" goto :StartChannels
if "%op%"=="" goto :Start

:ESPN
%FFPLAY% https://edge-live11-sl.cvattv.com.ar/live/c7eds/Fox_Sports_Premiun_HD/SA_Live_dash_enc_2A/Fox_Sports_Premiun_HD.mpd -cenc_decryption_key 4186a7c2a15f590a9399886feaec4257 -vst v:3 -flags low_delay
goto :StartChannels

:TYC
%FFPLAY% https://edge-live32-hr.cvattv.com.ar/live/c7eds/TyCSport/SA_Live_dash_enc_2A/TyCSport.mpd -cenc_decryption_key cc23ea1fb32629f9e1f48c8deeae3e5b -vst v:3 -flags low_delay
goto :StartChannels

:TYCPlay
%FFPLAY% https://d320m3arb2wo8b.cloudfront.net/out/v1/34e0da501a8c4489b713809eb08a9bf3/index_13.m3u8 -flags low_delay
goto :StartChannels

:TNT
%FFPLAY% https://edge-live32-sl.cvattv.com.ar/live/c6eds/TNT_Sports_HD/SA_Live_dash_enc_2A/TNT_Sports_HD.mpd -cenc_decryption_key ea46e4e9f1132e8dd71fb77f7d55058a -vst v:3 -flags low_delay
goto :StartChannels

:Cartoon
%FFPLAY% https://edge-live13-sl.cvattv.com.ar/live/c3eds/CartoonNetwork/SA_Live_dash_enc/CartoonNetwork.mpd -cenc_decryption_key 8abb2ee9150d8b2af8ebec0de0f833c8 -vst v:3 -flags low_delay
goto :StartChannels

:CustomTV
cls

echo Establecer link personalizado
echo.

set /p URL=URL del video: 
set /p DECRYPTION_KEY=Clave de desencriptacion (dejar en blanco si no hay alguna):

IF "%DECRYPTION_KEY%"=="" (
    %FFPLAY% %URL%
) ELSE (
    %FFPLAY% %URL% -cenc_decryption_key %DECRYPTION_KEY%
)

goto :Start


:MOVIE
cls

:: Comprobando si esta FFPLAY
if exist "%CD%\Assets\ffplay.exe" (
	goto :MOVIELOL
) else (
    goto :FFPLAYMOVIE
)

:FFPLAYMOVIE
echo Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe
cls
goto :MOVIELOL

:MOVIELOL

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Super Mario Bros: La Pelicula
echo *2.- El Chavo: Vacaciones en Acapulco
echo *3 - Five nights at Freddy: La Pelicula
echo *4 - Wall-E
echo *5 - Oppenheimer
echo *6 - Argentina VS Francia Qatar 2022 (cualquiera)
echo *7 - Personalizado
echo *8 - Volver para Atras
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="1" goto :SMB
if "%op%"=="3" goto :ACAPULCO
if "%op%"=="4" goto :FNAF
if "%op%"=="5" goto :WALLE
if "%op%"=="6" goto :Oppenheimer
if "%op%"=="7" goto :Mundial
if "%op%"=="8" goto :StartMovies
if "%op%"=="9" goto :CustomMOVIE
if "%op%"=="" goto :Start

:SMB
%FFPLAY% https://cache008.peliscdn.online/newhls/b9f3f5e072aa9be99699e94bdf0924d6/EP.0.1.v2.1708682322.m3u8
goto :StartMovies

:ACAPULCO
%FFPLAY% https://archive.org/download/elchavo_201709/El%20Chavo%20del%208%20-%20Vacaciones%20en%20Acapulco.mp4
goto :StartMovies

:ACAPULCO
%FFPLAY% https://d2nvs31859zcd8.cloudfront.net/98e7c04c7eea92019916_stardetonador_96420261846_1856009047/chunked/index-muted-2GIYT9DRH4.m3u8
goto :StartMovies

:FNAF
%FFPLAY% https://cache018.peliscdn.online/newhls/b5501eb755e47e473787373877bc3265/EP.0.2.v0.1708598921.720.m3u8
goto :StartMovies

:WALLE
%FFPLAY% https://cache018.peliscdn.online/newhls/1b0a006b686bb395565173659004bb9d/EP.0.1.v0.1708749457.1080.m3u8
goto :StartMovies

:Oppenheimer
%FFPLAY% https://cache017.peliscdn.online/newhls/4c8ab7b7ea8a06df1e7ddceaa7490d9d/EP.0.0.v1.1708613656.720.m3u8
goto :StartMovies

:Mundial
%FFPLAY% https://d2nvs31859zcd8.cloudfront.net/a36dd5d176ef62012c0c_stardetonador_97571900428_7474081598/chunked/highlight-2056245952.m3u8
goto :StartMovies

:CustomMOVIE
cls

echo Establecer link personalizado
echo.

set /p URL=URL del video:

%FFPLAY% %URL%

goto :StartMovies