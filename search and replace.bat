@echo off
setlocal enabledelayedexpansion

REM Set copyright text with newline
set "Copyright=Batch Script for Search and Replace Operation"
echo.
echo !Copyright!
echo.
echo Copyright (c) [https://khalil-shreateh.com/links]

pause
echo.
echo.
set /p "extension=Enter file extension (e.g., txt): "

REM Prompt user for search text
set /p "search=Enter text to search for: "

REM Prompt user for replacement text
set /p "replace=Enter text to replace with: "

for %%f in (*.%extension%) do (
    set "infile=%%~nf%%~xf"
    set "tempfile=!infile:%extension%=temp!"

    REM Create a temporary file to store the modified content
    type nul > "!tempfile!"

    for /f "usebackq delims=" %%i in ("%%f") do (
        set "line=%%i"
        REM Perform the search and replace operation
        set "line=!line:%search%=%replace%!"
        REM Append the modified line to the temporary file
        echo !line!>> "!tempfile!"
    )

    REM Replace the original file with the temporary file
    move /y "!tempfile!" "!infile!"
)

echo Search and replace operation completed.
pause
