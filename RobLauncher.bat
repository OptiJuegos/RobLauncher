@echo off
setlocal enabledelayedexpansion
setlocal enableextensions
cd /d "%~dp0"

:: Establecer las Variables de Entorno...
set FFPLAY="Assets\ffplay.exe"
set WGET="Assets\wget.exe"
set LAUNCHER_TEXT=*RobLauncher V1.9 BETA - Un launcher para OptiCraft y Demas Proyectos.*
set LAUNCHER_VER=RobLauncher V1.9 BETA

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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\OptiCraft\FAQ\FAQ.txt" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/FAQ.txt?download=true"

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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.7.3.1 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.7.3.1 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.9.1.0 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.9.1.0 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.12.0 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.14.31 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.14.31 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.17.30 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.17.30 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.18.31 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.18.31 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.19.52 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.19.52 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft 1.20.10 By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft 1.20.10 By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.5.2.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.8.9.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.12.2.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z" https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiCraft JAVA 1.16.5.7z?download=true
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
echo *1.- 60! Seconds - (384 MB)		*25.- PES 17 - (684 MB)
echo *2 - A Hat In Time - (1.7 GB)		*26.- Plants vs Zombies - (684 MB
echo *3.- Assassin's Creed - (25 MB)         *27.- Poly Bridge - (684 MB)	
echo *4.- Bad Piggies - (139 MB)             *28.- Portal - (684 MB)     
echo *5.- Bully - (1.1 GB)                   *29.- Project Zomboid - (684 MB)     
echo *6.- Call of Duty 2 - (172 MB)		*30.- Silent Hill 2 - (684 MB)
echo *7.- Call Of Duty 4 - (11.3 GB)	        *31.- Sonic 1 - (684 MB)        
echo *8.- Counter Strike 1.6 - (44.7 GB)     *32.- Super Mario 64 - (684 MB)  
echo *9.- Counter Strike GO - (1.8 GB)       *33.- Tetris - (684 MB)
echo *10.- Cuphead - (1.8 GB) 	        *34.- The Forest - (684 MB)
echo *11.- Dark Souls - (936 MB)		*35.- Unturned
echo *12.- Far Cry 1 - (1.8 GB)	        *36.- Youtubers Life
echo *13.- Getting Over it - (1.1 GB)        *37.- Volver para atras.               
echo *14.- Geometry Dash - (3.8 GB)                 
echo *15.- GTA IV- (4.0 GB)                 
echo *16.- GTA V - (19 MB)       
echo *17.- Half Life - (77 MB)	
echo *18.- Hello Neighbor - (512 MB)		
echo *19.- Hollow Knight - (315 MB)       
echo *20.- Left 4 Dead 2 - (780 MB)
echo *21.- Limbo - (780 MB)			
echo *22.- Outlast - (33 MB)		
echo *23.- PES 6 - (15 MB)     
echo *24.- PES 13 - (1.1 GB)          
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
if "%opgm%"=="10" goto :CupheadLITE
if "%opgm%"=="11" goto :DarkSouls
if "%opgm%"=="12" goto :FarCry
if "%opgm%"=="13" goto :GettingOver
if "%opgm%"=="14" goto :GeometryDash
if "%opgm%"=="15" goto :GtaIV
if "%opgm%"=="16" goto :GTAV
if "%opgm%"=="17" goto :HalfLife
if "%opgm%"=="18" goto :HelloNeighbor
if "%opgm%"=="19" goto :HollowKnight
if "%opgm%"=="20" goto :L4D2
if "%opgm%"=="21" goto :Limbo
if "%opgm%"=="22" goto :Outlast
if "%opgm%"=="23" goto :PES6
if "%opgm%"=="24" goto :PES13
if "%opgm%"=="25" goto :PES17
if "%opgm%"=="26" goto :PVZ
if "%opgm%"=="27" goto :PolyBridge
if "%opgm%"=="28" goto :Portal
if "%opgm%"=="29" goto :ProjectZomboid
if "%opgm%"=="30" goto :SH2
if "%opgm%"=="31" goto :Sonic
if "%opgm%"=="32" goto :SM64
if "%opgm%"=="33" goto :Tetris
if "%opgm%"=="34" goto :TheForest
if "%opgm%"=="35" goto :Unturned
if "%opgm%"=="36" goto :YoutubersLife
if "%opgm%"=="37" goto :StartGames
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\60s.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/60 Seconds Optimized.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\AHatInTime.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/A Hat in Time.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Assassins.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/A Hat in Time.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\BadPiggies.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Bad_Piggies.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiBully.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiBully.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\COD2.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Call of Duty 2 Optimized.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\COD4.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Call of Duty 4 Modern Warfare Optimized.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Counter Strike 1.6 Opti-Client.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Resurrection Strike V1.0.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Resurrection Strike V1.0.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Cuphead LITE.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Cuphead LITE.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\DarkSouls.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Dark Souls 1 LITE.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\FarCry.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Far Cry 1.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GettingOverIt.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Getting Over It.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Geometry Dash 2.2 Optimizado By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/GTA 4 LITE By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GTA V LITE.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/GTA V LITE V4.zip?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Half Life.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Half Life Xash3D.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Hello Neighbor Optimizado Y Portable V2.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hollow Knight Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Hollow Knight Optimizado.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Left 4 Dead 2 LITE By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Limbo.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Limbo.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Outlast.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Outlast.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\PES 6 Portable Y Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/PES 6 Portable Y Optimizado.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Pro Evolution Soccer 2013.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Pro Evolution Soccer 2013.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Pro Evolution Soccer 2017 Optimized.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Pro Evolution Soccer 2017 Optimized.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Plants_vs_Zombies.7z" "https://web.archive.org/web/20240507002159/https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Plants vs Zombies.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Poly_Bridge_v0.73b_Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Poly Bridge v0.73b Optimizado.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Portal 1 LITE By OptiJuegos.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Portal 1 LITE By OptiJuegos.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiZomboid.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/OptiZomboid.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Silent Hill 2 Portable.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Silent Hill 2 Portable.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Sonic 1.zip" "https://web.archive.org/web/20240507010058/https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Sonic 1.zip?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Super_Mario_64.zip" "https://web.archive.org/web/20240507010436/https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Super_Mario_64.zip?download=true"
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
    start "" "%CD%\Downloaded\Games\Tetris.exee"
	exit
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Games\Tetris.exe" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Tetris_GameBoy.exe?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\The Forest Lite V1.0.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/The Forest Lite V1.0.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Unturned.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Unturned_3.9.9.5.7z?download=true"
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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Youtubers Life Optimizado.7z" "https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/Youtubers Life Optimizado.7z?download=true"
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
echo *1.- Actualizar Drivers con Driver Booster.
echo *2.- Borrar archivos Temporales
echo *3.- Instalar dependencias para programas (DirectX - Visual C++)
echo *4.- Optimizar Windows
echo *5.- Volver para atras. 
echo.

:: Codigo para ir al menu con las Opciones
set /p oput=Opcion: 
if "%oput%"=="1" goto :Drivers
if "%oput%"=="2" goto :Temp
if "%oput%"=="3" goto :Runtimes
if "%oput%"=="4" goto :OPC
if "%oput%"=="5" goto :StartUtilities
if "%oput%"=="" goto :Utilities


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
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -P "%TEMP%" "https://web.archive.org/web/20240420232338/https://huggingface.co/spaces/lozanogamer/lozanogamers/resolve/main/DirectX.exe?download=true"

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

:: Punto de restauracion
"powershell.exe" -Command "Checkpoint-Computer -Description 'Restauracion Optimizador'"

:: Optimizaciones bcdedit
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1

:: Deshabilitando Telemetria
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f

:: Deshabilitando Servicios
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagsvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SgrmBroker" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ssh-agent" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d 4 /f

:: Optimizando CPU
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v "MinVmVersionForCpuBasedMitigations" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "FeatureSettings" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MsMpEng.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ShellExperienceHost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 5 /f

:: Optimizando RAM
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "100" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "300" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "AlwaysUnloadDll" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d 1024000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "300" /
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" /v "LargeSystemCache" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCmds" /t REG_DWORD /d 100 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxThreads" /t REG_DWORD /d 100 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCollectionCount" /t REG_DWORD /d 32 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f

:: Optimizando Grafica
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f

cls
echo --------------------------------------------------
echo            Optimizacion completada!
echo --------------------------------------------------
echo.
echo Tu sistema operativo fue optimizado correctamente!	  
echo Porfavor reinicia tu pc para notar el cambio.
echo.
echo --------------------------------------------------
timeout /t 3 /nobreak
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
echo -Hecho en 1 semana, sin mucha dedicacion por dia
echo -Creado por OptiJuegos, tambien el creador del OptiCraft.
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

:: Comprobando si esta FFPLAY
if exist "%CD%\Assets\ffplay.exe" (
	goto :TVLOL
) else (
    goto :FFPLAY
)


:FFPLAY
:FFPLAY
echo Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" "https://web.archive.org/web/20240507225542/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe"
cls
goto :TVLOL


:TVLOL
:TVLOL
cls

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

:: Advertencia IP
echo =================================================================================
echo -Es posible que las transmisiones no funcionen si te encuentras en otro pais
echo -Que no sea argentina, esto sucede porque los creadores establecieron este limite
echo =================================================================================
echo.

:: Codigo para ir al menu con las Opciones
set /p optv=Opcion: 

if "%optv%"=="1" goto :ESPN
if "%optv%"=="2" goto :TYC
if "%optv%"=="3" goto :TYCPlay
if "%optv%"=="4" goto :TNT
if "%optv%"=="5" goto :Cartoon
if "%optv%"=="6" goto :CustomTV
if "%optv%"=="7" goto :StartChannels
if "%optv%"=="" goto :TVLOL


:ESPN
:ESPN
%FFPLAY% https://edge-live11-sl.cvattv.com.ar/live/c7eds/Fox_Sports_Premiun_HD/SA_Live_dash_enc_2A/Fox_Sports_Premiun_HD.mpd -cenc_decryption_key 4186a7c2a15f590a9399886feaec4257 -vst v:3 -flags low_delay
goto :StartChannels


:TYC
:TYC
%FFPLAY% https://edge-live32-hr.cvattv.com.ar/live/c7eds/TyCSport/SA_Live_dash_enc_2A/TyCSport.mpd -cenc_decryption_key cc23ea1fb32629f9e1f48c8deeae3e5b -vst v:3 -flags low_delay
goto :StartChannels


:TYCPlay
:TYCPlay
%FFPLAY% https://d320m3arb2wo8b.cloudfront.net/out/v1/34e0da501a8c4489b713809eb08a9bf3/index_13.m3u8 -flags low_delay
goto :StartChannels


:TNT
:TNT
%FFPLAY% https://edge-live32-sl.cvattv.com.ar/live/c6eds/TNT_Sports_HD/SA_Live_dash_enc_2A/TNT_Sports_HD.mpd -cenc_decryption_key ea46e4e9f1132e8dd71fb77f7d55058a -vst v:3 -flags low_delay
goto :StartChannels


:Cartoon
:Cartoon
%FFPLAY% https://edge-live13-sl.cvattv.com.ar/live/c3eds/CartoonNetwork/SA_Live_dash_enc/CartoonNetwork.mpd -cenc_decryption_key 8abb2ee9150d8b2af8ebec0de0f833c8 -vst v:3 -flags low_delay
goto :StartChannels


:CustomTV
:CustomTV
cls

echo Establecer video personalizado
echo.

set /p URL=Ruta o link del video: 
set /p DECRYPTION_KEY=Clave de desencriptacion (dejar en blanco si no hay alguna):

IF "%DECRYPTION_KEY%"=="" (
    %FFPLAY% "%URL%"
) ELSE (
    %FFPLAY% "%URL%" -cenc_decryption_key %DECRYPTION_KEY%
)

goto :Start


:MOVIE
:MOVIE
cls

:: Comprobando si esta FFPLAY
if exist "%CD%\Assets\ffplay.exe" (
	goto :MOVIELOL
) else (
    goto :FFPLAYMOVIE
)


:FFPLAYMOVIE
:FFPLAYMOVIE
echo Descargando el Software...
%WGET% -q --no-check-certificate --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" https://web.archive.org/web/20240507225542/https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe
cls
goto :MOVIELOL


:MOVIELOL
:MOVIELOL
cls

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
set /p opmov=Opcion: 

if "%opmov%"=="1" goto :SMB
if "%opmov%"=="2" goto :ACAPULCO
if "%opmov%"=="3" goto :FNAF
if "%opmov%"=="4" goto :WALLE
if "%opmov%"=="5" goto :Oppenheimer
if "%opmov%"=="6" goto :Mundial
if "%opmov%"=="7" goto :CustomMOVIE
if "%opmov%"=="8" goto :StartMovies
if "%opmov%"=="" goto :MOVIELOL


:SMB
:SMB
%FFPLAY% https://cache008.peliscdn.online/newhls/b9f3f5e072aa9be99699e94bdf0924d6/EP.0.1.v2.1708682322.m3u8
goto :StartMovies


:ACAPULCO
:ACAPULCO
%FFPLAY% "https://archive.org/download/elchavo_201709/El Chavo del 8 - Vacaciones en Acapulco.mp4"
goto :StartMovies


:FNAF
:FNAF
%FFPLAY% https://cache018.peliscdn.online/newhls/b5501eb755e47e473787373877bc3265/EP.0.2.v0.1708598921.720.m3u8
goto :StartMovies


:WALLE
:WALLE
%FFPLAY% https://cache018.peliscdn.online/newhls/1b0a006b686bb395565173659004bb9d/EP.0.1.v0.1708749457.1080.m3u8
goto :StartMovies


:Oppenheimer
:Oppenheimer
%FFPLAY% https://cache017.peliscdn.online/newhls/4c8ab7b7ea8a06df1e7ddceaa7490d9d/EP.0.0.v1.1708613656.720.m3u8
goto :StartMovies


:Mundial
:Mundial
%FFPLAY% https://d2nvs31859zcd8.cloudfront.net/a36dd5d176ef62012c0c_stardetonador_97571900428_7474081598/chunked/highlight-2056245952.m3u8
goto :StartMovies


:CustomMOVIE
:CustomMOVIE
cls

echo Establecer video personalizado
echo.

set /p URL=Ruta o link del video: 

%FFPLAY% "%URL%"

goto :StartMovies