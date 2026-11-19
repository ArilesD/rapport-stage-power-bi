@echo off
setlocal
cd /d "%~dp0"
if not exist "Equipements-IDF-Stage.pbix" (
  echo Extrais d'abord tout le ZIP du projet dans un dossier.
  pause
  exit /b 1
)
echo Ouverture du rapport dans Power BI Desktop.
echo Power BI Desktop doit etre installe : https://powerbi.microsoft.com/desktop/
start "" "%~dp0Equipements-IDF-Stage.pbix"
if errorlevel 1 pause
