@echo off
setlocal EnableDelayedExpansion
setlocal enableextensions
chcp 65001 > nul
cd /d "%~dp0"

:: Establecer las Variables de Entorno...
set FFMPEG="Assets\ffmpeg.exe"
set FFPLAY="Assets\ffplay.exe"
set FFPLAYNOGUI="Assets\ffplaynogui.exe"
set WGET="Assets\wget.exe"
set YTDLP="Assets\yt-dlp.exe"
set LAUNCHER_TEXT=*RobLauncher V1.91 - Un launcher para OptiCraft y Demas Proyectos.*
set LAUNCHER_VER=RobLauncher V1.91

:: Establecer el Titulo del launcher
title %LAUNCHER_VER%

:: Crear la carpeta "Downloaded", donde van a ir todas las cosas descargadas.
mkdir "Assets\extra" >nul 2>&1	
mkdir "Downloaded" >nul 2>&1
mkdir "Downloaded\Compressed" >nul 2>&1
mkdir "Downloaded\Games" >nul 2>&1
mkdir "Downloaded\OptiCraft" >nul 2>&1
mkdir "Downloaded\OptiCraft\FAQ" >nul 2>&1
mkdir "Downloaded\Recordings" >nul 2>&1
mkdir "Downloaded\Recordings\Youtube" >nul 2>&1
mkdir "Downloaded\Utilities" >nul 2>&1


:Options
:Options
:: Comprobar si existe el archivo Options.txt, si no ir a un mini tutorial para los TOPOS (chiste los quiero mucho)
if exist "%CD%\Assets\extra\options.txt" (
    goto :Start
) else (
    goto :Tutorial
)


:Tutorial
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
:StartRadio
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
echo *8.- Peliculas y Series
echo *9.- Radios Argentinas
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
:OldOSWarning
echo ======================================================================================
echo -Tu Windows es bastante antiguo, lo que puede generar multiples fallas con el Launcher
echo -Te recomendamos que, si es posible, actualices a un Windows mas reciente.
echo ======================================================================================
echo.


:: Advertencia Links
:StartContinue
:StartContinue
echo ===========================================================================
echo -Te recomiendo actualizar frecuentemente el programa para corregir errores.
echo -Puedes hacerlo desde el apartado "Actualizar el Launcher"
echo ===========================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p opst=Opcion: 
if "%opst%"=="" goto :Start
if "%opst%"=="1" goto :OptiCraftBE
if "%opst%"=="2" goto :OptiCraftJE
if "%opst%"=="3" goto :OptiGames
if "%opst%"=="4" goto :Utilities
if "%opst%"=="5" goto :AboutPage
if "%opst%"=="6" goto :Update
if "%opst%"=="7" goto :TV
if "%opst%"=="8" goto :MOVIE
if "%opst%"=="9" goto :Radio
if "%opst%"=="" goto :Start


:OptiCraftBE
:OptiCraftBE
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Consultas frecuentes de OptiCraft (32 KB)
echo *2.- OptiCraft Bedrock 1.7.3.1 (25 MB)
echo *3.- OptiCraft Bedrock 1.9.1.0 (66 MB)
echo *4.- OptiCraft Bedrock 1.12.0 (92 MB)
echo *5.- OptiCraft Bedrock 1.14.31 (87 MB)
echo *6.- OptiCraft Bedrock 1.17.30 (100 MB)
echo *7.- OptiCraft Bedrock 1.18.31 (116 MB)
echo *8.- OptiCraft Bedrock 1.19.52 (172 MB)
echo *9.- OptiCraft Bedrock 1.20.10 (175 MB)
echo *10.- Volver para atras.
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
:W7Warning
echo ==============================================================================
echo -OptiCraft Bedrock requiere ciertas actualizaciones y dependencias que Windows
echo -No contiene por defecto, si el juego no te funciona o tienes algun error,
echo -Porfavor ve al apartado de Utilidades y instala todas las cosas de ahi (C++).
echo ==============================================================================
echo.


:: Aviso Render dragon
:Seguir
:Seguir
echo ===============================================================================
echo -Las versiones superiores a la 1.18.31 incluyen el motor grafico Render Dragon.
echo -Este mismo requiere un dispositivo con un soporte a DirectX 10 o Superior 
echo -Si el juego tiene problemas, porfavor actualiza tu Driver de Video.
echo ===============================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p opbe=Opcion: 
if "%oput%"=="1" goto :FAQ
if "%opbe%"=="2" goto :1.7.3.1
if "%opbe%"=="3" goto :1.9.1.0
if "%opbe%"=="4" goto :1.12.0
if "%opbe%"=="5" goto :1.14.31
if "%opbe%"=="6" goto :1.17.30
if "%opbe%"=="7" goto :1.18.31
if "%opbe%"=="8" goto :1.19.52
if "%opbe%"=="9" goto :1.20.10
if "%opbe%"=="10" goto :StartBE
if "%opbe%"=="" goto :OptiCraftBE


:FAQ
:FAQ
cls

:: Borrando las preguntas frecuentes Anteriores
del "%CD%\Downloaded\OptiCraft\FAQ\FAQ.txt"

:: Descargando el bloc de notas con el FAQ
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\OptiCraft\FAQ\FAQ.txt" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/FAQ.txt?download=true"

:: Iniciando el NOTEPAD
notepad.exe "%CD%\Downloaded\OptiCraft\FAQ\FAQ.txt"

:: Codigo para ir al menu con las Opciones
exit


:1.7.3.1
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.7.3.1 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.7.3.1 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.9.1.0 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.9.1.0 By OptiJuegos.7z?download=true"
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
:1.12.0
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft-1.12.0.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft-1.12.0.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.12.0 By OptiJuegos.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft-1.12.0.exe"

:: Cerrar proceso
exit


:1.14.31
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.14.31 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.14.31 By OptiJuegos.7z?download=true"
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


:1.17.30
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.17.30 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.17.30 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.18.31 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.18.31 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.19.52 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.19.52 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.20.10 By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft 1.20.10 By OptiJuegos.7z?download=true"
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
set /p opje=Opcion: 
if "%opje%"=="" goto :OptiCraftJE
if "%opje%"=="1" goto :1.5.2
if "%opje%"=="2" goto :1.8.9
if "%opje%"=="3" goto :1.12.2
if "%opje%"=="4" goto :1.16.5
if "%opje%"=="5" goto :StartJE
if "%opje%"=="" goto :OptiCraftJE


:1.5.2
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft JAVA 1.5.2.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft JAVA 1.8.9.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft JAVA 1.12.2.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z" https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiCraft JAVA 1.16.5.7z?download=true
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
:OptiGames
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- 60! Seconds - (384 MB)		*25.- PES 13 - (3.8 GB)
echo *2 - A Hat In Time - (2.8 GB)		*26.- PES 17 - (4.0 GB)
echo *3.- Assassin's Creed - (3.6 GB)        *27.- Plants vs Zombies - (25 MB)	
echo *4.- Bad Piggies - (30 MB)              *28.- Poly Bridge - (70 MB)     
echo *5.- Bully - (2.1 GB)                   *29.- Portal - (521 MB)     
echo *6.- Call of Duty 2 - (3.5 GB)		*30.- Project Zomboid - (307 MB)
echo *7.- Call Of Duty 4 - (2.8 GB)	        *31.- Silent Hill 2 - (703 MB)        
echo *8.- Counter Strike 1.6 - (155 MB)      *32.- Sonic 1 - (32 MB)  
echo *9.- Counter Strike GO - (1.1 GB)       *33.- Super Mario 64 - (15 MB)
echo *10.- Craftsman PC - (25 MB)            *34.- Tetris - (871 KB)
echo *11.- Cuphead - (1.8 GB) 	        *35.- The Forest - (1.0 GB)
echo *12.- Dark Souls - (3.5 GB)		*36.- Unturned - (20 MB)
echo *13.- Far Cry 1 - (1.9 GB)	        *37.- Youtubers Life - (684 MB)
echo *14.- Getting Over it - (481 MB)        *38.- Volver para atras.                  
echo *15.- Geometry Dash - (172 MB)                 
echo *16.- GTA IV- (11.3 GB)                 
echo *17.- GTA V - (44.4 GB)       
echo *18.- Half Life - (142 MB)	
echo *19.- Hello Neighbor - (1.5 GB)
echo *20.- Hollow Knight - (936 MB)       
echo *21.- Left 4 Dead 2 - (1.8 GB)
echo *22.- Limbo - (74 MB)			
echo *23.- Outlast - (2.3 GB)		
echo *24.- PES 6 - (1.1 GB)          
echo.

:: Codigo para ir al menu con las Opciones
set /p opgm=Opcion: 
if "%opgm%"=="1" goto :60s
if "%opgm%"=="2" goto :AHat
if "%opgm%"=="3" goto :Assassin
if "%opgm%"=="4" goto :BadPiggies
if "%opgm%"=="5" goto :Bully
if "%opgm%"=="6" goto :COD2
if "%opgm%"=="7" goto :COD4
if "%opgm%"=="8" goto :CS16
if "%opgm%"=="9" goto :CSGO
if "%opgm%"=="10" goto :Craftsman
if "%opgm%"=="11" goto :CupheadLITE
if "%opgm%"=="12" goto :DarkSouls
if "%opgm%"=="13" goto :FarCry
if "%opgm%"=="14" goto :GettingOver
if "%opgm%"=="15" goto :GeometryDash
if "%opgm%"=="16" goto :GTAIV
if "%opgm%"=="17" goto :GTAV
if "%opgm%"=="18" goto :HalfLife
if "%opgm%"=="19" goto :HelloNeighbor
if "%opgm%"=="20" goto :HollowKnight
if "%opgm%"=="21" goto :L4D2
if "%opgm%"=="22" goto :Limbo
if "%opgm%"=="23" goto :Outlast
if "%opgm%"=="24" goto :PES6
if "%opgm%"=="25" goto :PES13
if "%opgm%"=="26" goto :PES17
if "%opgm%"=="27" goto :PVZ
if "%opgm%"=="28" goto :PolyBridge
if "%opgm%"=="29" goto :Portal
if "%opgm%"=="30" goto :ProjectZomboid
if "%opgm%"=="31" goto :SH2
if "%opgm%"=="32" goto :Sonic
if "%opgm%"=="33" goto :SM64
if "%opgm%"=="34" goto :Tetris
if "%opgm%"=="35" goto :TheForest
if "%opgm%"=="36" goto :Unturned
if "%opgm%"=="37" goto :YoutubersLife
if "%opgm%"=="38" goto :StartGames
if "%opgm%"=="" goto :OptiGames


:60s
:60s
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\60 Seconds! Optimized\60Seconds.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\60 Seconds! Optimized\60Seconds.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\60s.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/60 Seconds Optimized.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\60s.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\60s.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\60 Seconds! Optimized\60Seconds.exe"

:: Cerrar proceso
exit


:AHat
:AHat
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\A Hat In Time\gamedata\Binaries\Win64\HatinTimeGame.exe" (
	echo Ejecutando el Software...
	echo.
	cd "%CD%\Downloaded\Games\A Hat In Time\gamedata\Binaries\Win64"
	start "" "HatinTimeGame.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\AHatInTime.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/A Hat in Time.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\AHatInTime.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\AHatInTime.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
cd "%CD%\Downloaded\Games\A Hat In Time\gamedata\Binaries\Win64"
start "" "HatinTimeGame.exe"

:: Cerrar proceso
exit


:Assassin
:Assassin
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Assassins Creed 1 Optimized\gamedata\AssassinsCreed_Dx9.exe" (
	echo Ejecutando el Software...
	echo.
	cd "%CD%\Downloaded\Games\Assassins Creed 1 Optimized\gamedata"
	start "" "AssassinsCreed_Dx9.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Assassins.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Assassins Creed 1 Optimized.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Assassins.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Assassins.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
cd "%CD%\Downloaded\Assassins Creed 1 Optimized\gamedata"
start "" "AssassinsCreed_Dx9.exe"

:: Cerrar proceso
exit

:BadPiggies
:BadPiggies
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Bad Piggies\BadPiggies.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Bad Piggies\BadPiggies.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\BadPiggies.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Bad_Piggies.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\BadPiggies.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\BadPiggies.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Bad Piggies\BadPiggies.exe"

:: Cerrar proceso
exit


:Bully
:Bully
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\OptiBully\bullydata\Bully.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\OptiBully\bullydata\Bully.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiBully.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiBully.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiBully.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiBully.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\OptiBully\bullydata\Bully.exe"

:: Cerrar proceso
exit


:COD2
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\COD2.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Call of Duty 2 Optimized.7z?download=true"
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


:COD4
:COD4
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Call of Duty 4 Modern Warfare Optimized\coddata\iw3sp.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Call of Duty 4 Modern Warfare Optimized\coddata\iw3sp.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\COD4.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Call of Duty 4 Modern Warfare Optimized.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\COD4.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\COD2.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Call of Duty 4 Modern Warfare Optimized\coddata\iw3sp.exe"

:: Cerrar proceso
exit

:CS16
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Counter Strike 1.6 Opti-Client.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Resurrection Strike V1.0.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Resurrection Strike V1.0.7z?download=true"
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


:CupheadLITE
:CupheadLITE
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat" (
	echo Ejecutando el Software...
	echo.
	%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Cuphead LITE.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Cuphead LITE.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Craftsman PC Port 1.9.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Craftsman PC Port 1.9.7z?download=true"
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


:DarkSouls
:DarkSouls
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Dark Souls 1 LITE\darkdata\DARKSOULS.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Dark Souls 1 LITE\darkdata\DARKSOULS.exe
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\DarkSouls.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Dark Souls 1 LITE.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\DarkSouls.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\DarkSouls.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" ""%CD%\Downloaded\Games\Dark Souls 1 LITE\darkdata\DARKSOULS.exe"

:: Cerrar proceso
exit


:FarCry
:FarCry
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Far Cry 1\gamedata\Bin32\FarCry.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Far Cry 1\gamedata\Bin32\FarCry.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\FarCry.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Far Cry 1.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\FarCry.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\GettingOverIt.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" ""%CD%\Downloaded\Games\Far Cry 1\gamedata\Bin32\FarCry.exe"

:: Cerrar proceso
exit


:GettingOver
:GettingOver
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Getting Over It\GettingOverIt.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Getting Over It\GettingOverIt.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GettingOverIt.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Getting Over It.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\GettingOverIt.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\GettingOverIt.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" ""%CD%\Downloaded\Games\Getting Over It\GettingOverIt.exe"

:: Cerrar proceso
exit


:GeometryDash
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Geometry Dash 2.2 Optimizado By OptiJuegos.7z?download=true"
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


:GTAIV
:GTAIV
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/GTA 4 LITE By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GTA V LITE.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/GTA V LITE V4.zip?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\GTA V LITE.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\GTA V LITE.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\GTA V LITE V4\1-Grand Theft Auto V - NORMAL.bat"

:: Cerrar proceso
exit


:HalfLife
:HalfLife
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Half Life Xash3D\Half Life.exe" (
	echo Ejecutando el Software...
	echo.
	cd "%CD%\Downloaded\Games\Half Life Xash3D"
    start "" "Half Life.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Half Life.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Half Life Xash3D.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Half Life.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Half Life.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Half Life Xash3D\Half Life.exe"

:: Cerrar proceso
exit


:HelloNeighbor
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Hello Neighbor Optimizado Y Portable V2.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hollow Knight Optimizado.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Hollow Knight Optimizado.7z?download=true"
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

:: Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Left 4 Dead 2 LITE By OptiJuegos.7z?download=true"
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


:Limbo
:Limbo
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Limbo\limbo.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Limbo\limbo.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Limbo.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Limbo.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Limbo.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Limbo.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Limbo\limbo.exe"

:: Cerrar proceso
exit


:Outlast
:Outlast
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Outlast\OutlastLauncher.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Outlast\OutlastLauncher.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Outlast.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Outlast.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Outlast.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Outlast.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Outlast\OutlastLauncher.exe"

:: Cerrar proceso
exit


:PES6
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\PES 6 Portable Y Optimizado.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/PES 6 Portable Y Optimizado.7z?download=true"
cls

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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Pro Evolution Soccer 2013.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Pro Evolution Soccer 2013.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Pro Evolution Soccer 2013.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Games\Pro Evolution Soccer 2013\Pro Evolution Soccer 13.bat"

:: Cerrar proceso
exit


:PES17
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Pro Evolution Soccer 2017 Optimized.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Pro Evolution Soccer 2017 Optimized.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Plants_vs_Zombies.7z" "https://web.archive.org/web/20240507002159/https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Plants vs Zombies.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Poly_Bridge_v0.73b_Optimizado.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Poly Bridge v0.73b Optimizado.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Portal 1 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Portal 1 LITE By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiZomboid.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/OptiZomboid.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Silent Hill 2 Portable.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Silent Hill 2 Portable.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Sonic 1.zip" "https://web.archive.org/web/20240507010058/https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Sonic 1.zip?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Super_Mario_64.zip" "https://web.archive.org/web/20240507010436/https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Super_Mario_64.zip?download=true"
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


:Tetris
:Tetris
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Tetris.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Tetris.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Games\Tetris.exe" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Tetris_GameBoy.exe?download=true"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Tetris.exe"

:: Cerrar proceso
exit


:TheForest
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\The Forest Lite V1.0.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/The Forest Lite V1.0.7z?download=true"
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


:Unturned
:Unturned
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Unturned 3.9.9.5\Unturned.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Unturned 3.9.9.5\Unturned.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Unturned.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Unturned_3.9.9.5.7z?download=true"
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Unturned.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Unturned.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Unturned 3.9.9.5\Unturned.exe"

:: Cerrar proceso
exit


:YoutubersLife
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Youtubers Life Optimizado.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Youtubers Life Optimizado.7z?download=true"
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
:Utilities
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Activar Windows
echo *2.- Actualizar Drivers
echo *3.- Borrar Archivos Temporales
echo *4.- Descargar Videos de Sitios Web
echo *5.- Deshabilitar Windows Defender
echo *6.- Grabar Transmisiones o Directos
echo *7.- Instalar Dependencias (Visual C++ - DirectX)
echo *8.- Optimizar Internet
echo *9.- Optimizar Sistema
echo *10.- Psiphon VPN
echo *11.- Volver para atras.
echo.

:: Codigo para ir al menu con las Opciones
set /p oput=Opcion: 
if "%oput%"=="1" goto :AWindows
if "%oput%"=="2" goto :Drivers
if "%oput%"=="3" goto :Temp
if "%oput%"=="4" goto :VidYT
if "%oput%"=="5" goto :DefenderDisable
if "%oput%"=="6" goto :FFRecording
if "%oput%"=="7" goto :Runtimes
if "%oput%"=="8" goto :Internet
if "%oput%"=="9" goto :OPC
if "%oput%"=="10" goto :VPNCrota
if "%oput%"=="11" goto :StartUtilities
if "%oput%"=="" goto :Utilities


:AWindows
:AWindows
cls

::Comprobando si el software ya ha sido descargado
if exist "%CD%\Downloaded\Utilities\Activar.cmd" (
	echo Ejecutando el Software...
	echo.
	"%CD%\Downloaded\Utilities\Activar.cmd"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Activar.7z" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/Activar.7z?download=true"

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Activar.7z" -o"%CD%\Downloaded\Utilities"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Activar.7z"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
"%CD%\Downloaded\Utilities\Activar.cmd"

:: Cerrar proceso
exit

:Drivers
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Driver_Booster.7z" "https://web.archive.org/web/20240319014108/https://lozanoalberto228gmailcom-my.sharepoint.com/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/Documents/ProjectsOpti/DriverBooster.7z?ga=1"
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
:Temp
cls

:: Borrando Archivos Temporales...
del /S /F /Q "%temp%\*.*"
del /S /F /Q "%SystemDrive%\Windows\Temp\*.*"
del /S /F /Q "%SystemDrive%\Windows\Prefetch\*.*"

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


:VidYT
:VidYT
cls

:: Comprobando si esta YT-DLP
if exist "%CD%\Assets\yt-dlp.exe" (
	cls
) else (
    %WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\yt-dlp.exe" "https://web.archive.org/web/20240802051734/https://github.com/yt-dlp/yt-dlp/releases/download/2024.08.01/yt-dlp_x86.exe"
	cls
)

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

echo ========================================
echo -Los videos se encuentran en la carpeta
echo -RobLauncher, Downloaded, Recordings
echo =======================================
echo.

:: Hacer que el usuario establezca el link del video
echo *Link del video: 
set /p LINK=
echo.

:: Hacer que el usuario nombre el video
echo *Nombre del Video: 
set /p NAMEL=
echo.

:: Descargar el video usando YT-DlP
cls
%YTDLP% %LINK% -o "Downloaded\Recordings\%NAMEL%"

:: Volver para atras
goto :StartUtilities


:DefenderDisable
:DefenderDisable
cls

:: BatchGotAdmin
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPromptD
) else ( goto scriptD )


:UACPromptD
:UACPromptD
cls
echo.
echo ------------------------------------------------------
echo               Deshabilitar Defender
echo ------------------------------------------------------
echo.
echo Este apartado requiere privilegios de administrador
echo Para funcionar correctamente. Se cerrara el Launcher
echo.
echo ------------------------------------------------------
echo.
pause
exit


:ScriptD
:ScriptD
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Deshabilitar Defender
echo *2.- Habilitar Defender
echo *3.- Volver para atras.
echo.

:: Codigo para ir al menu con las Opciones
set /p oput=Opcion: 
if "%oput%"=="1" goto :DF
if "%oput%"=="2" goto :DE
if "%oput%"=="3" goto :Utilities
if "%oput%"=="" goto :Utilities


:DF
:DF
cls
echo.
echo --------------------------------------------------
echo        Deshabilitando Windows Defender
echo --------------------------------------------------
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d 1 /f
timeout /t 3 /nobreak
goto :StartUtilities


:DE
:DE
cls
echo.
echo --------------------------------------------------
echo            Habilitando Windows Defender.
echo --------------------------------------------------
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d 0 /f
timeout /t 3 /nobreak
goto StartUtilities


:FFRecording
:FFRecording
cls

:: Comprobando si esta FFMPEG
if exist "%CD%\Assets\ffmpeg.exe" (
	cls
) else (
    %WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Assets\ffmpeg.exe" "https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/ffmpeg.exe?download=true"
	cls
)

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

echo =======================================
echo -Los videos se encuentran en la carpeta
echo -RobLauncher, Downloaded, Recordings
echo =======================================
echo.

:: Establecer URL del .M3U8 o .MPD
echo *Enlace del archivo de transmision (.MPD - .M3U8):
set /p URLR=
echo.

:: Hacer que el usuario nombre el video
echo *Nombre de la Grabacion: 
set /p NAME=
echo.

:: Clave de desencriptacion para los MPD
echo *Decryption Key (dejar en blanco si no hay alguna): 
set /p DECRYPTION_KEYR=

:: Codigo para descargar la transmisiones
cls
IF "%DECRYPTION_KEYR%"=="" (
    %FFMPEG% -i "%URLR%" -loglevel error -hide_banner -c copy "Downloaded\Recordings\Recording.mp4"
	timeout 3 /nobreak
) ELSE (
    %FFMPEG% -i "%URLR%" -cenc_decryption_key %DECRYPTION_KEYR% -loglevel error -hide_banner -c copy "Downloaded\Recordings\%NAME%.mp4"
	timeout 3 /nobreak
)

goto :StartMovies

:Runtimes
:Runtimes
cls

:: Descargando el Visual C++, Net Framework Y DirectX x86
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240507020145/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2005_x86.exe"
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240507020255/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2008_x86.exe"
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240507020619/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2010_x86.exe"
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240507020735/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2012_x86.exe"
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240507020704/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2013_x86.exe"
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240507020710/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2015_2017_2019_x86.exe"
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240420232338/https://huggingface.co/spaces/OptiJuegos/lozanogamers/resolve/main/DirectX.exe?download=true"

:: Instalando Visual C++ 2015-2017-2019-2022
echo Instalando Visual C++ 2005...
"%TEMP%\vcredist2005_x86.exe" /q
echo Instalando Visual C++ 2008...
"%TEMP%\vcredist2008_x86.exe" /q /norestart
echo Instalando Visual C++ 2010...
"%TEMP%\vcredist2010_x86.exe" /install /passive
echo Instalando Visual C++ 2012...
"%TEMP%\vcredist2012_x86.exe" /install /passive
echo Instalando Visual C++ 2013...
"%TEMP%\vcredist2013_x86.exe" /install /passive
echo Instalando Visual C++ 2015...
"%TEMP%\vcredist2015_2017_2019_x86.exe" /install /passive
echo Instalando DirectX
"%TEMP%\DirectX.exe" /install /passive

:: Borrando los archivos Comprimidos
rd /s /q "%TEMP%"

:: Avisar que se instalo el coso
cls
echo %LAUNCHER_TEXT%
echo.
echo ========================================================
echo -Se han instalado los Visual C++ y DirectX!
echo -Si tuviste algun error en la instalacion
echo -Porfavor comprueba de tener tu Sistema Operativo
echo -Con las ultimas actualizaciones y Parches de Seguridad.
echo ========================================================
echo.

timeout 3 /nobreak
exit


:Internet
:Internet
cls

:: BatchGotAdmin
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPromptI
) else ( goto scriptinternet )


:UACPromptI
:UACPromptI
cls
echo.
echo ------------------------------------------------------
echo                   Optimizador
echo ------------------------------------------------------
echo.
echo El optimizador requiere privilegios de administrador
echo Para funcionar correctamente. Se cerrara el Launcher
echo.
echo ------------------------------------------------------
echo.
pause
exit


:scriptinternet
:scriptinternet
cls

echo === Punto de restauracion ===
echo.
"powershell.exe" Enable-ComputerRestore -Drive "%SystemDrive%"
"powershell.exe" -Command "Checkpoint-Computer -Description 'Restauracion Internet'"

echo === Limpiando cache DNS ===
echo.
ipconfig /flushdns >nul 2>&1

echo === Aplicando DNS de Cloudfare ===
echo.
FOR /F "tokens=* delims=:" %%a IN ('IPCONFIG ^| FIND /I "ETHERNET ADAPTER"') DO (
SET adapterName=%%a >nul 2>&1
SET adapterName=!adapterName:~17! >nul 2>&1
SET adapterName=!adapterName:~0,-1! >nul 2>&1
netsh interface ipv4 set dns name="!adapterName!" static 1.1.1.1 primary >nul 2>&1
netsh interface ipv4 add dns name="!adapterName!" 1.0.0.1 index=2 >nul 2>&1
)

echo === Eliminando el limite QoS ===
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\QoS" /v LimitReservableBandwidth /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul 2>&1
echo.

echo === Aplicando regedit (TCP) ===
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0x7FFF /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpNumConnections /t REG_DWORD /d 0xFFFFFF /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 32 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCP1323opts /t REG_DWORD /d 1 /f >nul 2>&1

cls
echo --------------------------------------------------
echo            Optimizacion completada!
echo --------------------------------------------------
echo.
echo Tu internet fue optimizado correctamente!	  
echo Porfavor reinicia tu pc para notar el cambio.
echo.
echo --------------------------------------------------
pause
exit


:OPC
:OPC
cls

:: BatchGotAdmin
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto script )


:UACPrompt
:UACPrompt
cls
echo.
echo ------------------------------------------------------
echo                   Optimizador
echo ------------------------------------------------------
echo.
echo El optimizador requiere privilegios de administrador
echo Para funcionar correctamente. Se cerrara el Launcher
echo.
echo ------------------------------------------------------
echo.
pause
exit


:script
:script

echo === Punto de restauracion ===
echo.
"powershell.exe" Enable-ComputerRestore -Drive "%SystemDrive%"
"powershell.exe" -Command "Checkpoint-Computer -Description 'Restauracion Optimizador!'"

echo === Optimizaciones bcdedit ===
echo.
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
powercfg -h off >nul 2>&1

echo === Deshabilitando Telemetria ===
echo.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f

echo === Deshabilitando Servicios ===
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagsvc" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SgrmAgent" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SgrmBroker" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ssh-agent" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d 4 /f
echo === Servicios en Manual ====
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc" /v "Start" /t REG_DWORD /d 3 /f
echo.

echo === Optimizando CPU ===
echo.
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v "MinVmVersionForCpuBasedMitigations" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "FeatureSettings" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MsMpEng.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ShellExperienceHost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f

echo === Optimizando RAM ===
echo.
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "3000" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "3000" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "AlwaysUnloadDll" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d 8388608 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "300" / >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCmds" /t REG_DWORD /d 100 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxThreads" /t REG_DWORD /d 100 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCollectionCount" /t REG_DWORD /d 32 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul 2>&1

echo === Optimizando Grafica ===
echo.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul 2>&1

cls
echo --------------------------------------------------
echo            Optimizacion completada!
echo --------------------------------------------------
echo.
echo Tu sistema operativo fue optimizado correctamente!	  
echo Porfavor reinicia tu pc para notar el cambio.
echo.
echo --------------------------------------------------
pause
exit


:VPNCrota
cls

::Comprobando si el software ya ha sido descargado
if exist "%CD%\Downloaded\Utilities\psiphon3-legacy.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Utilities\psiphon3-legacy.exe"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Utilities\psiphon3-legacy.exe" "https://web.archive.org/web/20200720005015/https://psiphon.s3.amazonaws.com/legacy/psiphon3-legacy.exe"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Utilities\psiphon3-legacy.exe"

:: Cerrar proceso
exit


:AboutPage
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
echo -Creado por OptiJuegos, tambien el creador del OptiCraft.
echo -https://optijuegos.github.io
echo =================================================================================
echo.

:: Codigo para ir al menu con las Opciones
pause
goto :StartAbout


:Update
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Assets" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/update.bat
timeout /t 1 /nobreak

:: Descargando .bat de github
"%CD%\Assets\Update.bat"
timeout /t 1 /nobreak


:TV
:TV
cls

:: Comprobando si esta ffplay
if exist "%CD%\Assets\ffplay.exe" (
	cls
) else (
    %WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" https://web.archive.org/web/20240507225542/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe
	cls
)


:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1 - Bein Sports 
echo *2 - Cartoon Network
echo *3 - Disney Channel
echo *4.- ESPN 1
echo *5.- ESPN 2
echo *6.- ESPN 3
echo *7.- ESPN 4
echo *8.- ESPN Premium
echo *9.- FOX Sports
echo *10.- FOX Sports 2
echo *11.- FOX Sports 3
echo *12 - Las Estrellas
echo *13.- Nickelodeon
echo *14.- Telefe
echo *15.- TYC Sports
echo *16.- TNT Sports
echo *17 - Personalizado
echo *18 - Volver para Atras
echo.

:: Advertencia IP
echo ====================================================================================
echo -Los canales solo estan disponibles en Argentina, Uruguay y Paraguay.
echo -Si no estas en ninguno de estos paises, no podras acceder a menos que uses una VPN.
echo ====================================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p optv=Opcion: 
if "%optv%"=="1" goto :Bein
if "%optv%"=="2" goto :Cartoon
if "%optv%"=="3" goto :DISNEYC
if "%optv%"=="4" goto :ESPN
if "%optv%"=="5" goto :ESPN2
if "%optv%"=="6" goto :ESPN3
if "%optv%"=="7" goto :ESPN4
if "%optv%"=="8" goto :ESPNP
if "%optv%"=="9" goto :FOXS1
if "%optv%"=="10" goto :FOXS2
if "%optv%"=="11" goto :FOXS3
if "%optv%"=="12" goto :Estrellas
if "%optv%"=="13" goto :NICK
if "%optv%"=="14" goto :TELEFE
if "%optv%"=="15" goto :TYC
if "%optv%"=="16" goto :TNT
if "%optv%"=="17" goto :CustomTV
if "%optv%"=="18" goto :StartChannels
if "%optv%"=="" goto :TV


:Bein
:Bein
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://d35j504z0x2vu2.cloudfront.net/v1/master/0bc8e8376bd8417a1b6761138aa41c26c7309312/bein-sports-xtra-en-espanol/playlist.m3u8
goto :StartChannels

:Cartoon
:Cartoon
cls
%FFPLAY% -hide_banner -cenc_decryption_key 8abb2ee9150d8b2af8ebec0de0f833c8 -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-live13-sl.cvattv.com.ar/live/c3eds/CartoonNetwork/SA_Live_dash_enc/CartoonNetwork.mpd
goto :StartChannels

:DISNEYC
:DISNEYC
cls
%FFPLAY% -hide_banner -cenc_decryption_key 0df77ede9bc744376836d21afa137dda -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-mix03-mus.cvattv.com.ar/live/c3eds/DisneyChannelHD/SA_Live_dash_enc/DisneyChannelHD.mpd
goto :StartChannels

:ESPN
:ESPN
cls
%FFPLAY% -hide_banner -cenc_decryption_key cb89ee3961599e3e648a5aad60895f34 -probesize 32 -analyzeduration 0 -window_title "Reproductor" -fflags nobuffer -flags +low_delay -sn -ac 2 -vst v:3 -fast https://edge1-ccast-sl.cvattv.com.ar/live/c3eds/ESPN2HD/SA_Live_dash_enc/ESPN2HD.mpd 
goto :StartChannels

:ESPN2
:ESPN2
cls
%FFPLAY% -hide_banner -cenc_decryption_key 0b40ae9f78a7bac3b57ecbf72d3c081e -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge2-ccast-sl.cvattv.com.ar/live/c6eds/ESPN2_Arg/SA_Live_dash_enc/ESPN2_Arg.mpd 
goto :StartChannels

:ESPN3
:ESPN3
cls
%FFPLAY% -hide_banner -cenc_decryption_key 1743cd03dfe3736b2c95da91a783af38 -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-mix04-coe.cvattv.com.ar/live/c3eds/ESPN3/SA_Live_dash_enc/ESPN3.mpd
goto :StartChannels

:ESPN4
:ESPN4
cls
%FFPLAY% -hide_banner -cenc_decryption_key fb85d059687ab0fc67805806204edbdf -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge5-hr.cvattv.com.ar/live/c3eds/ESPNHD/SA_Live_dash_enc/ESPNHD.mpd
goto :StartChannels

:ESPNP
:ESPNP
cls
%FFPLAY% -hide_banner -cenc_decryption_key 4186a7c2a15f590a9399886feaec4257 -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-live11-sl.cvattv.com.ar/live/c7eds/Fox_Sports_Premiun_HD/SA_Live_dash_enc_2A_wl/Fox_Sports_Premiun_HD.mpd 
goto :StartChannels

:FOXS1
:FOXS1
cls
%FFPLAY% -hide_banner -cenc_decryption_key aac61b730e2ac1df23f1e872e7541c1b -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge6-hr.cvattv.com.ar/live/c3eds/FoxSports/SA_Live_dash_enc/FoxSports.mpd 
goto :StartChannels

:FOXS2
:FOXS2
cls
%FFPLAY% -hide_banner -cenc_decryption_key 5086d370e840010232cf4532b16e197f -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge6-hr.cvattv.com.ar/live/c3eds/FoxSports2HD/SA_Live_dash_enc/FoxSports2HD.mpd
goto :StartChannels

:FOXS3
:FOXS3
cls
%FFPLAY% -hide_banner -cenc_decryption_key fa39e855543c5d70f30600d59e5e4c1b -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-mix02-cte.cvattv.com.ar/live/c3eds/FoxSports3HD/SA_Live_dash_enc/FoxSports3HD.mpd
goto :StartChannels

:NICK
:NICK
cls
%FFPLAY% -hide_banner -cenc_decryption_key 38d6f650cbf9a38fd9f35c01f98e647a -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-mix03-mus.cvattv.com.ar/live/c3eds/Nickelodeon/SA_Live_dash_enc/Nickelodeon.mpd
goto :StartChannels

:Estrellas
:Estrellas
cls
%FFPLAY% -hide_banner -cenc_decryption_key 917309c98f072b0bd484dd6560c6d166 -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-live01-mun.cvattv.com.ar/live/c6eds/Canal_de_las_estrellas/SA_Live_dash_enc/Canal_de_las_estrellas.mpd
goto :StartChannels

:TELEFE
:TELEFE
cls
%FFPLAY% -hide_banner -cenc_decryption_key c69f3afde2085dcaaaddbf55246a0323 -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-mix03-mus.cvattv.com.ar/live/c6eds/TelefeHD/SA_Live_dash_enc/TelefeHD.mpd
goto :StartChannels

:TYC
:TYC
cls
%FFPLAY% -hide_banner -cenc_decryption_key cc23ea1fb32629f9e1f48c8deeae3e5b -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-mix04-coe.cvattv.com.ar/live/c7eds/TyCSport/SA_Live_dash_enc/TyCSport.mpd
goto :StartChannels

:TYCPlay
:TYCPlay
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://d320m3arb2wo8b.cloudfront.net/out/v1/34e0da501a8c4489b713809eb08a9bf3/index_13.m3u8
goto :StartChannels

:TNT
:TNT
cls
%FFPLAY% -hide_banner -cenc_decryption_key ea46e4e9f1132e8dd71fb77f7d55058a -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -vst v:3 -fast https://edge-live32-sl.cvattv.com.ar/live/c6eds/TNT_Sports_HD/SA_Live_dash_enc_2A/TNT_Sports_HD.mpd
goto :StartChannels


:CustomTV
:CustomTV
cls

echo Establecer video personalizado
echo.

set /p URL=Link del video: 
set /p DECRYPTION_KEY=Decryption Key (dejar en blanco si no hay alguna): 

IF "%DECRYPTION_KEY%"=="" (
    %FFPLAY% "%URL%" -s 1280:720 -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast
) ELSE (
    %FFPLAY% "%URL%" -cenc_decryption_key %DECRYPTION_KEY% -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast
)

goto :Start


:MOVIE
:MOVIE
cls

:: Comprobando si esta ffplay
if exist "%CD%\Assets\ffplay.exe" (
	cls
) else (
    %WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" https://web.archive.org/web/20240507225542/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe
	cls
)

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Super Mario Bros: La Pelicula
echo *2.- El Chavo: Vacaciones en Acapulco
echo *3 - Five nights at Freddy: La Pelicula
echo *4 - Los Simpsons
echo *5 - Wall-E
echo *6 - Oppenheimer
echo *7 - Argentina VS Francia Qatar 2022 (cualquiera)
echo *8 - Personalizado
echo *9 - Volver para Atras
echo.

:: Codigo para ir al menu con las Opciones
set /p opmov=Opcion: 

if "%opmov%"=="1" goto :SMB
if "%opmov%"=="2" goto :ACAPULCO
if "%opmov%"=="3" goto :FNAF
if "%opmov%"=="4" goto :SIMP
if "%opmov%"=="5" goto :WALLE
if "%opmov%"=="6" goto :Oppenheimer
if "%opmov%"=="7" goto :Mundial
if "%opmov%"=="8" goto :CustomMOVIE
if "%opmov%"=="9" goto :StartMovies
if "%opmov%"=="" goto :MOVIE


:SMB
:SMB
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://cache008.peliscdn.online/newhls/b9f3f5e072aa9be99699e94bdf0924d6/EP.0.1.v2.1708682322.m3u8
goto :StartMovies

:ACAPULCO
:ACAPULCO
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast "https://archive.org/download/elchavo_201709/El Chavo del 8 - Vacaciones en Acapulco.mp4"
goto :StartMovies

:FNAF
:FNAF
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://cache018.peliscdn.online/newhls/b5501eb755e47e473787373877bc3265/EP.0.2.v0.1708598921.720.m3u8
goto :StartMovies

:SIMP
:SIMP
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://lozanogamer-simpfull.hf.space/stream.m3u8
goto :StartMovies

:WALLE
:WALLE
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://cache018.peliscdn.online/newhls/1b0a006b686bb395565173659004bb9d/EP.0.1.v0.1708749457.1080.m3u8
goto :StartMovies

:Oppenheimer
:Oppenheimer
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://cache017.peliscdn.online/newhls/4c8ab7b7ea8a06df1e7ddceaa7490d9d/EP.0.0.v1.1708613656.720.m3u8
goto :StartMovies

:Mundial
:Mundial
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://d2nvs31859zcd8.cloudfront.net/a36dd5d176ef62012c0c_stardetonador_97571900428_7474081598/chunked/highlight-2056245952.m3u8
goto :StartMovies

:RatMovie
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://web.archive.org/web/20240808044026/https://huggingface.co/spaces/OptiJuegos/d/resolve/main/rat.m3u8?download=true
goto :StartMovies

:Toy1
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://web.archive.org/web/20240808195254/https://huggingface.co/spaces/OptiJuegos/e/resolve/main/toy1.m3u8?download=true
goto :StartMovies

:ArgNew
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://web.archive.org/web/20240808200804/https://huggingface.co/spaces/OptiJuegos/f/resolve/main/argnew.m3u8?download=true
goto :StartMovies


:CustomMOVIE
:CustomMOVIE
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

echo Establecer video personalizado
echo.

set /p URL=Ruta o link del video: 

%FFPLAY% "%URL%" -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast

goto :StartMovies

:Radio
:Radio
cls

:: Comprobando si esta ffplay
if exist "%CD%\Assets\ffplay.exe" (
	cls
) else (
    %WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" https://web.archive.org/web/20240507225542/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe
	cls
)

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Aspen FM 102.3
echo *2.- Radio Disney FM 94.3
echo *3 - La Red FM 98.3
echo *4 - Rock And Pop FM 95.9
echo *5 - Urbana Play FM 104.3
echo *6 - Radio Rivadavia AM 630
echo *7 - Radio Con Vos FM 89.9
echo *8 - Volver para Atras
echo.

:: Codigo para ir al menu con las Opciones
set /p opra=Opcion: 

if "%opra%"=="1" goto :ASPEN
if "%opra%"=="2" goto :DISNEYRA
if "%opra%"=="3" goto :LARED
if "%opra%"=="4" goto :ROCKPOP
if "%opra%"=="5" goto :URBANA
if "%opra%"=="6" goto :RIVADAVIA
if "%opra%"=="7" goto :ConVos
if "%opra%"=="8" goto :StartRadio
if "%opra%"=="" goto :Radio

:ASPEN
:ASPEN
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://24283.live.streamtheworld.com/ASPENAAC.aac
goto :StartRadio

:DISNEYRA
:DISNEYRA
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://26563.live.streamtheworld.com/DISNEY_ARG_BA_ADP/HLS/playlist.m3u8
goto :StartRadio

:LARED
:LARED
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast http://stream.lt8.com.ar:8080/laredrosario.mp3
goto :StartRadio

:ROCKPOP
:ROCKPOP
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://playerservices.streamtheworld.com/api/livestream-redirect/ROCKANDPOPAAC_SC
goto :StartRadio

:URBANA
:URBANA
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://g2.vxral-slo.transport.edge-access.net/nx-beta/nx.hor.livetx.01/60083afdba6eb40016c35954_240p/index.m3u8
goto :StartRadio

:RIVADAVIA
:RIVADAVIA
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://playerservices.streamtheworld.com/api/livestream-redirect/RIVADAVIAAAC_SC
goto :StartRadio

:ConVos
cls
%FFPLAY% -hide_banner -window_title "Reproductor" -fflags nobuffer -flags low_delay -sn -ac 2 -fast https://server1.stweb.tv/rcvos/live/playlist.m3u8
goto :StartRadio