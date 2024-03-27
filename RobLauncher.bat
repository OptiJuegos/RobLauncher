@echo off
======================================================================================================================================================================================	

CD /D "%~dp0"
	
=========================================================================================================================================================

:: Establecer las Variables de Entorno...
set FFPLAY="%CD%\Assets\ffplay.exe"
set WGET="%CD%\Assets\wget.exe"
set LAUNCHER_TEXT=*RobLauncher V1.7 - Un launcher para OptiCraft y Demas Proyectos.*
set LAUNCHER_VER=RobLauncher V1.7

:: Establecer el Titulo del launcher
title %LAUNCHER_VER%

:: Crear la carpeta "Downloaded", donde van a ir todas las cosas descargadas.	
mkdir "Downloaded"

:: Comprobar si existe el archivo Options.txt, si no ir a un mini tutorial para los TOPOS (chiste los quiero mucho)
if exist "%CD%\Assets\extra\options.txt" (
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

========================================================================================================================================================

:Start
:StartBE
:StartJE
:StartGames
:StartUtilities
:StartAbout

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

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.7.3.1
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft 1.7.3.1 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.7.3.1 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EbBfZnzUT8NDkvU4PEQ8sLkBBVJY63qsN95a2QtR6miE3g?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.9.1.0
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft 1.9.1.0 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.9.1.0 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EelOarM7FixMlYd4bk4ys9sBE9qPPZWL3LCTOAGOZ6yR7g?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.12.0
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.12.0 By OptiJuegos\OptiCraft 1.12.0 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.12.0 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EUibyg9ig3lNg9Cgh7s6JJQBFT_uvm6o6XbASSWARDI9vg?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.14.31
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.14.31 By OptiJuegos\OptiCraft 1.14.31 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.14.31 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/ET6v9hflz6tJqaWSlAe-JUkBEfxByvVl_Cu9u8fAMw2JsA?download=1
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

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.17.30 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.17.30 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EV76CXR9Px1Bt43vqoSneB0BpivVLo06L6f4Vc9AaL5sXw?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.18.31
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.18.31 By OptiJuegos\OptiCraft 1.17.30 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.18.31 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EWIFeD7fVFNFkbrvCrS5MA0BXhlN24dAvEaiFwKNSe89VA?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.19.52
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.19.52 By OptiJuegos\OptiCraft 1.19.52 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.19.52 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EQ-F0QrwMyVAmJAd31zR_FEBK7NBq-IwcSiA1LQwSBlxCw?download=1

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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.20.10
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft 1.20.10 By OptiJuegos\OptiCraft 1.20.10 By OptiJuegos\OptiCraft.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft 1.20.10 By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EZDFCsnoNjpEoN44RThvEIYBP_NQVMS35TBPq4diBzmynw?download=1

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
pause

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.5.2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.5.2\1-OptiCraft.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.5.2\1-OptiCraft.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/Eb9CPCrBaFlEvqjeuqkW54wBcXbXO-Bt6Igyk8uNbTJpVA?download=1

cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.5.2.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.5.2\1-OptiCraft.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.8.9
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.8.9\1-OptiCraft.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.8.9\1-OptiCraft.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EVu8C8G2gQBFjDtJ4rSpGnwBP6go4KtIDHzH8VjsuiAuHw?download=1

cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.8.9.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.8.9\1-OptiCraft.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.12.2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/ESpZMLg3YC1DncbdUeNfXv0BxTdlQcO6OMYV47SRNu6fPQ?download=1

cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.12.2 FORGE.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.12.2 FORGE\1-Minecraft.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:1.16.5
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.16.5\1-Minecraft Sodium.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.16.5\1-Minecraft Sodium.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/Ea6mincAo9ZNo2VaeEBHIQcB3OXyCyVAbLznBjRCXHXKaw?download=1

cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\OptiCraft JAVA 1.16.5.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\OptiCraft\OptiCraft JAVA 1.16.5\1-Minecraft Sodium.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

========================================================================================================================================================

:OptiGames
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.

:: Opciones para seleccionar
echo *1.- Cuphead - (1.7 GB)
echo *2.- Craftsman PC - (25 MB)
echo *3.- Counter Strike 1.6 - (139 MB)
echo *4.- Counter Strike Global Offensive - (1.1 GB)
echo *5.- Geometry Dash - (172 MB)
echo *6.- Gta IV Lite - (11.3 GB)
echo *7.- Gta V Lite - (51.7 GB)
echo *8.- Hello Neighbor - (1.8 GB)
echo *9.- Hollow Knight - (936 MB)
echo *10.- Left 4 Dead 2 - (1.8 GB)
echo *11.- PES 6 - (1.1 GB)
echo *12.- Plants VS Zombies - (19 MB)
echo *13.- Poly Bridge 1 - (77 MB)
echo *14.- Portal 1 Lite - (10 MB)
echo *15.- Project Zomboid Lite - (360 MB)
echo *16.- Silent Hill 2 - (780 MB)
echo *17.- Sonic 1 PC - (33 MB)
echo *18.- Super Mario 64 PC - (15 MB)
echo *19.- The Forest Lite - (1.1 GB)
echo *20.- Youtubers Life - (684 MB)
echo *21.- Volver para atras.
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="1" goto :CupheadLITE
if "%op%"=="2" goto :Craftsman
if "%op%"=="3" goto :CS16
if "%op%"=="4" goto :CSGO
if "%op%"=="5" goto :GeometryDash
if "%op%"=="6" goto :GtaIV
if "%op%"=="7" goto :GtaV
if "%op%"=="8" goto :HelloNeighbor
if "%op%"=="9" goto :HollowKnight
if "%op%"=="10" goto :L4D2
if "%op%"=="11" goto :PES6
if "%op%"=="12" goto :PVZ
if "%op%"=="13" goto :PolyBridge
if "%op%"=="14" goto :Portal
if "%op%"=="15" goto :ProjectZomboid
if "%op%"=="16" goto :SH2
if "%op%"=="17" goto :Sonic
if "%op%"=="18" goto :SM64
if "%op%"=="19" goto :TheForest
if "%op%"=="20" goto :YoutubersLife
if "%op%"=="21" goto :StartGames
if "%op%"=="" goto :Start

goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:CupheadLITE
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Cuphead LITE.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EQCx2poRgApFlKgS0WeQXw4BYpellRizN6fTRn2plYoD8A?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Cuphead LITE.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Cuphead LITE.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Cuphead LITE\1-Cuphead.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Craftsman
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Craftsman MOD PC PORT By OptiJuegos\Craftsman.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Craftsman MOD PC PORT By OptiJuegos\Craftsman.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Craftsman_MOD_PC_PORT_By_OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EWLINayBsM9Iv6JSqLrk29IB_1A8HXm3Dkn9DXRA5zCyZw?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Craftsman_MOD_PC_PORT_By_OptiJuegos.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Craftsman_MOD_PC_PORT_By_OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Craftsman MOD PC PORT By OptiJuegos\Craftsman.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:CS16
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Counter Strike 1.6 OptiClient\Counter-Strike 1.6.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Counter Strike 1.6 OptiClient\Counter-Strike 1.6.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EYd2l17iwvxKkjQzwcodQ7EBsTYQ7eNHq-gBZn3NYhVhAg?download=1
cls

:: Descomprimiendo el Juego...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Counter Strike 1.6 Opti-Client.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Counter Strike 1.6 OptiClient\Counter-Strike 1.6.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:CSGO
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Resurrection Strike V1.0\csgo.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Resurrection Strike V1.0\csgo.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Resurrection Strike V1.0.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EQyCaTGMnMFPoVmzL9kK_BcB9YPdgW4LdMUsMq-EyWoSiw?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:GeometryDash
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Geometry Dash 2.2 Optimizado\1-Geometry Dash.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Geometry Dash 2.2 Optimizado\1-Geometry Dash.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EU_wwY5XlvRLkZnWJmMs8WIBR5h_TOeaPlzqCBLStU7IIg?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Geometry Dash 2.204 Optimizado By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Geometry Dash 2.2 Optimizado\1-Geometry Dash.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:GtaIV
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\1-Grand Theft Auto IV - NORMAL.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\1-Grand Theft Auto IV - NORMAL.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EdP10Hk0kvBKvRJY5fHwqNwBhgPYl-CqGSrW1kj0qqQdFQ?download=1

cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z" -o"%CD%\Downloaded\OptiCraft"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\GTA 4 LITE By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\GTA 4 LITE By OptiJuegos\1-Grand Theft Auto IV - NORMAL.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:GTAV
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Grand Theft Auto V LITE\1-Grand Theft Auto V - NORMAL.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Grand Theft Auto V LITE\1-Grand Theft Auto V - NORMAL.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Grand Theft Auto V LITE.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EWDAX7CzKFlFh7A-2qWOlFAByg2Lt2fcR64EmX5qJPfQ8A?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Grand Theft Auto V LITE.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Grand Theft Auto V LITE.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Grand Theft Auto V LITE\1-Grand Theft Auto V - NORMAL.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:HelloNeighbor
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Hello Neighbor Optimizado Y Portable V2\1-Hello Neighbor.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Hello Neighbor Optimizado Y Portable V2\1-Hello Neighbor.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/ERFWd9GAa1BKokhCFOsd01ABWsoO5_r_jU43UWfzor1mfQ?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Hello Neighbor Optimizado Y Portable V2.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Hello Neighbor Optimizado Y Portable V2\1-Hello Neighbor.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:HollowKnight
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Hollow Knight Optimizado\Hollow Knight.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Hollow Knight Optimizado\Hollow Knight.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Hollow Knight Optimizado.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EUQmeV1zm29ClXLC_g5gLlkBm__x_oCA8ric_YxFEu_MEg?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Hollow Knight Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Hollow Knight Optimizado.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Hollow Knight Optimizado\Hollow Knight.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:L4D2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Left 4 Dead 2 LITE By OptiJuegos\1-Left 4 Dead 2.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Left 4 Dead 2 LITE By OptiJuegos\1-Left 4 Dead 2.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EXU0YmAjlx1Cv5q1Z7bUy3ABm3zjiLsVTtEiGdjb8_c1LQ?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Left 4 Dead 2 LITE By OptiJuegos.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Left 4 Dead 2 LITE By OptiJuegos\1-Left 4 Dead 2.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:PES6
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\PES 6 Portable Y Optimizado.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EfJSjBmH3zRHpciahJUxdusB3FH3KAVQtZj9w1fdGvLIAQ?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\PES 6 Portable Y Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\PES 6 Portable Y Optimizado.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\PES 6 Portable Y Optimizado\Pro Evolution Soccer 6.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:PVZ
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Plants vs Zombies\PlantsVsZombies.exe" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Plants vs Zombies\PlantsVsZombies.exe" -changedir
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Plants_vs_Zombies.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/ERLh0ATa6hNBitFNvDn1jT4BjR6tdPIbv5tllmCKDEGsaw?download=1
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
start "" "%CD%\Downloaded\Games\Plants vs Zombies\PlantsVsZombies.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:PolyBridge
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Poly Bridge v0.73b Optimizado\polydata\polybridge.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Poly Bridge v0.73b Optimizado\polydata\polybridge.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

pause

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Poly_Bridge_v0.73b_Optimizado.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EVMIndhnLv1FvYuMxXAXX4wBdAcQgnJxk1lxrPAB9CfXhA?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Poly_Bridge_v0.73b_Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "%CD%\Downloadeds\Compressed\Poly_Bridge_v0.73b_Optimizado.7z"
cls

:: Ir al game downloaded para Avisar
goto :SoftDownloaded


--------------------------------------------------------------------------------------------------------------------------------------------------------

:Portal
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Portal 1 LITE By OptiJuegos\Portal 1.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Portal 1 LITE By OptiJuegos\Portal 1.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Portal 1 LITE By OptiJuegos.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EbALKai1TZZOsVLioKXDyTwBpDlEalRi2AmHoyUpV2NaQA?download=1
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
start "" "%CD%\Downloaded\Games\Portal 1 LITE By OptiJuegos\Portal 1.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:ProjectZomboid
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\OptiZomboid V2\1-OptiZomboid.bat" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\OptiZomboid V2\1-OptiZomboid.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\OptiZomboid V2.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EdoZWBekbBxLg4cA87TmOMsB2H6Hj1l6D1-R2bClD0AqoQ?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\OptiZomboid V2.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "%CD%\Downloaded\Compressed\OptiZomboid V2.7z"
cls

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\OptiZomboid V2\1-OptiZomboid.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:SH2
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Silent Hill 2\Silent Hill 2.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Silent Hill 2\Silent Hill 2.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando las Partes del Software
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Silent Hill 2 Portable.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EVr1U07JDcVLi_7nzqiMSVoBwQm_UipBqqhBUKc2j16ncQ?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start



--------------------------------------------------------------------------------------------------------------------------------------------------------

:Sonic
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Sonic 1\Sonic 1.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\Sonic 1\Sonic 1.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Sonic 1.zip" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EQXwXDpiaaxJhG6T61sspaYBM5hA_9bIq4PZiLlGgTdM5w?download=1
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
start "" "%CD%\Downloaded\Games\Sonic 1\Sonic 1.exe"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:SM64
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\SM64\SM64-60.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Games\SM64\SM64-60.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Super_Mario_64.zip" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/ETw3DmdOjXJNq7mJbasRI88BZ_-ptyWdR1XH92LKa6UrGQ?download=1
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

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:TheForest
cls

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\The Forest Lite V1.0\1-The Forest.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\The Forest Lite V1.0\1-The Forest.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\The Forest Lite V1.0.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EfnqfgzGPalBm6vx2btYadUB2UZXy9RxcK36_c2faXNfrw?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\The Forest Lite V1.0.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\The Forest Lite V1.0.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\The Forest Lite V1.0\1-The Forest.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:YoutubersLife
pause

::Comprobando si el Software ya ha sido descargado
if exist "%CD%\Downloaded\Games\Youtubers Life Optimizado\1-Youtubers Life.bat" (
	echo Ejecutando el Software...
	echo.
    start "" "%CD%\Downloaded\Games\Youtubers Life Optimizado\1-Youtubers Life.bat"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando el Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "Downloaded\Compressed\Youtubers Life Optimizado.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/EfJSjBmH3zRHpciahJUxdusB3FH3KAVQtZj9w1fdGvLIAQ?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Youtubers Life Optimizado.7z" -o"%CD%\Downloaded\Games"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Youtubers Life Optimizado.7z"

:: Ejecutando el Software...
cls
echo Ejecutando el Software...
start "" "%CD%\Downloaded\Games\Youtubers Life Optimizado\1-Youtubers Life.bat"

:: Ir al menu inicial cuando se cierre el proceso.
timeout 1 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:SoftDownloaded
cls

:: Nefasta decoracion del Launcher porque me crashean los textos ascii anda a saber porq
echo.
echo %LAUNCHER_TEXT%
echo.
echo =========================================================
echo -El archivo se ha descargado y descomprimido correctamente.
echo -Visita la carpeta especifica para encontrarlo.
echo =========================================================
echo.
pause

:: Ir al inicio
goto :OptiGames

========================================================================================================================================================

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
if "%op%"=="5" goto :Start
if "%op%"=="" goto :Start

goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Runtimes
cls

:: Descargando el Visual C++, Net Framework Y DirectX x86
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2005_x86.exe
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%\Downloaded\Utilities\Runtimes" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/visual/vcredist2008_x86.exe
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
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Updates
:: Comprobando si el sistema es Windows 7
ver | findstr /i "6\.1\."
if %errorlevel%==0 (
	goto :StartUpdateW7
) else (
	goto :NotWin7
)

:NotWin7
cls
echo.
echo %LAUNCHER_TEXT%
echo.
echo =======================================
echo -Tu sistema no esta corriendo Windows 7
echo -No se instalara ninguna Actualizacion.
echo =======================================
timeout /t 3 /nobreak
goto :Start

:StartUpdateW7
cls

:: Cartel de comprobacion
echo.
echo ===============================================
echo -Antes de realizar este paso
echo -Es recomendable crear un punto de restauracion
echo -Por si te ocurre algun error!
echo ===============================================
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
echo ==============================================
echo -Las actualizaciones se han Instalado.
echo -Tu computadora se reiniciara en 15 Segundos.
echo ==============================================
echo.
shutdown /r /t 0

--------------------------------------------------------------------------------------------------------------------------------------------------------

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

timeout 3 /nobreak
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:FAQ
cls

:: Borrando las preguntas frecuentes Anteriores
del "%CD%\Downloaded\OptiCraft\FAQ\FAQ.txt

:: Descargando el bloc de notas con el FAQ
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\OptiCraft\FAQ\FAQ.txt" https://lozanoalberto228gmailcom-my.sharepoint.com/:t:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/Eb3GT04Wp7tBkPjAXdxOYFkBgcrLRWLfbq7b6fKL1iUPKg?download=1

:: Iniciando el NOTEPAD
start "" "notepad.exe" "%CD%\Downloaded\OptiCraft\FAQ\FAQ.txt"

:: Codigo para ir al menu con las Opciones
goto :Start

--------------------------------------------------------------------------------------------------------------------------------------------------------

:Drivers
cls

::Comprobando si el software ya ha sido descargado
if exist "%CD%\Downloaded\Utilities\DriverBooster\DriverBoosterPortable.exe" (
	echo Ejecutando el Software...
	echo.
	start "" "%CD%\Downloaded\Utilities\DriverBooster\DriverBoosterPortable.exe"
	goto :Start
) else (
    echo Descargando el Software...
	echo.
)

:: Descargando Software...
%WGET% -q --show-progress --connect-timeout=15 --tries=3  -O "Downloaded\Compressed\Driver_Booster.7z" https://lozanoalberto228gmailcom-my.sharepoint.com/:u:/g/personal/dea_lozanoalberto228gmailcom_onmicrosoft_com/ERLufby56YdClj7lkSQnqWoBaoicdH2pDDoYqqyEN9PP_g?download=1
cls

:: Descomprimiendo el Software...
"%CD%\Assets\7z.exe" -bsp1 x "%CD%\Downloaded\Compressed\Driver_Booster.7z" -o"%CD%\Downloaded\Utilities"
timeout /t 1 /nobreak

:: Borrando los archivos Comprimidos
del "Downloaded\Compressed\Driver_Booster.7z"
cls

:: Ir al game downloaded para Avisar
goto :SoftDownloaded

========================================================================================================================================================

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

========================================================================================================================================================

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

========================================================================================================================================================

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
%WGET% -q --show-progress --connect-timeout=15 --tries=3 -O "%CD%\Assets\ffplay.exe" https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/Assets/ffplay.exe
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
echo *3.- TNT Sports
echo *4 - Television Publica
echo *5 - Cartoon Network
echo *6 - Personalizado
echo *7 - Volver para Atras
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="1" goto :ESPN
if "%op%"=="2" goto :TYC
if "%op%"=="3" goto :TNT
if "%op%"=="4" goto :TVP
if "%op%"=="5" goto :Cartoon
if "%op%"=="6" goto :CustomTV
if "%op%"=="7" goto :Start
if "%op%"=="" goto :Start

:ESPN
%FFPLAY% https://edge-live11-sl.cvattv.com.ar/live/c7eds/Fox_Sports_Premiun_HD/SA_Live_dash_enc_2A/Fox_Sports_Premiun_HD.mpd -cenc_decryption_key 4186a7c2a15f590a9399886feaec4257 -vst v:3 -flags low_delay
goto :Start

:TYC
%FFPLAY% https://edge-live32-hr.cvattv.com.ar/live/c7eds/TyCSport/SA_Live_dash_enc_2A/TyCSport.mpd -cenc_decryption_key cc23ea1fb32629f9e1f48c8deeae3e5b -vst v:3 -flags low_delay
goto :Start

:TNT
%FFPLAY% https://edge-live32-sl.cvattv.com.ar/live/c6eds/TNT_Sports_HD/SA_Live_dash_enc_2A/TNT_Sports_HD.mpd -cenc_decryption_key ea46e4e9f1132e8dd71fb77f7d55058a -vst v:3 -flags low_delay
goto :Start

:TVP
%FFPLAY% https://edge-mix01-coe.cvattv.com.ar/live/c6eds/Canal7/SA_Live_dash_enc_2A/Canal7.mpd -cenc_decryption_key cc4aae173dd2ef17ae26be3f7ae87662 -vst v:3 -flags low_delay-flags low_delay
goto :Start

:Cartoon
%FFPLAY% https://edge-live13-sl.cvattv.com.ar/live/c3eds/CartoonNetwork/SA_Live_dash_enc/CartoonNetwork.mpd -cenc_decryption_key 8abb2ee9150d8b2af8ebec0de0f833c8 -vst v:3 -flags low_delay
goto :Start

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

:Telefe
%FFPLAY% https://edge9-sl.cvattv.com.ar/live/c6eds/TelefeHD/SA_Live_dash_enc/TelefeHD.mpd -cenc_decryption_key c69f3afde2085dcaaaddbf55246a0323 -vst v:4
goto :Start

========================================================================================================================================================

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
echo *2.- Ratatouille 
echo *3.- El Chavo: Vacaciones en Acapulco
echo *4 - Five nights at Freddy: La Pelicula
echo *5 - Wall-E
echo *6 - Oppenheimer
echo *7 - Argentina VS Francia Qatar 2022 (cualquiera)
echo *8 - Personalizado
echo *9 - Volver para Atras
echo.

:: Codigo para ir al menu con las Opciones
set /p op=Opcion: 

if "%op%"=="1" goto :SMB
if "%op%"=="2" goto :RAT
if "%op%"=="3" goto :ACAPULCO
if "%op%"=="4" goto :FNAF
if "%op%"=="5" goto :WALLE
if "%op%"=="6" goto :Oppenheimer
if "%op%"=="7" goto :Mundial
if "%op%"=="9" goto :CustomMOVIE
if "%op%"=="" goto :Start

:SMB
%FFPLAY% https://cache008.peliscdn.online/newhls/b9f3f5e072aa9be99699e94bdf0924d6/EP.0.1.v2.1708682322.m3u8 -vst v:2
goto :Start

:RAT
%FFPLAY% https://cdn-cached-fs-43-w.dailymotians.cam/hls/liwalcp6ka2nsti77evsuwsdwifl7f6q3iv7nm2tu,ifsxaenforl2efuyiaa,b7sxaenforl4axkrcba,.urlset/master.m3u8 -vst v:3
goto :Start

:ACAPULCO
%FFPLAY% https://d2nvs31859zcd8.cloudfront.net/98e7c04c7eea92019916_stardetonador_96420261846_1856009047/chunked/index-muted-2GIYT9DRH4.m3u8
goto :Start

:FNAF
%FFPLAY% https://cache018.peliscdn.online/newhls/b5501eb755e47e473787373877bc3265/EP.0.2.v0.1708598921.720.m3u8
goto :Start

:WALLE
%FFPLAY% https://cache018.peliscdn.online/newhls/1b0a006b686bb395565173659004bb9d/EP.0.1.v0.1708749457.1080.m3u8
goto :Start

:Oppenheimer
%FFPLAY% https://cache017.peliscdn.online/newhls/4c8ab7b7ea8a06df1e7ddceaa7490d9d/EP.0.0.v1.1708613656.720.m3u8
goto :Start

:Mundial
%FFPLAY% https://d2nvs31859zcd8.cloudfront.net/a36dd5d176ef62012c0c_stardetonador_97571900428_7474081598/chunked/highlight-2056245952.m3u8
goto :Start

:CustomMOVIE
cls

echo Establecer link personalizado
echo.

set /p URL=URL del video:

%FFPLAY% %URL%

goto :Start