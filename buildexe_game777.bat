@echo off
setlocal enabledelayedexpansion

set APPNAME=Game777
set OUTEXE=%APPNAME%.exe

set VBC=
for %%v in (v4.0.30319 v4.0.30128 v4.0.21006 v4.0.20506) do (
    if exist "%WINDIR%\Microsoft.NET\Framework\%%v\vbc.exe" (
        set "VBC=%WINDIR%\Microsoft.NET\Framework\%%v\vbc.exe"
    )
)
if "%VBC%"=="" (
    if exist "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\vbc.exe" (
        set "VBC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\vbc.exe"
    )
)

if "%VBC%"=="" (
    echo [LOI] Khong tim thay vbc.exe cho .NET Framework 4.x
    echo Kiem tra thu muc %WINDIR%\Microsoft.NET\Framework\ hoac Framework64\
    pause
    exit /b 1
)

echo Dung trinh bien dich: %VBC%
echo Dang build %OUTEXE% ...
echo.

"%VBC%" /nologo /target:winexe /out:%OUTEXE% /optimize+ /optionstrict+ /optionexplicit+ ^
    /reference:System.dll,System.Windows.Forms.dll,System.Drawing.dll ^
    Program.vb Form1.vb Game777Game.vb NetworkPeer.vb NetworkHub.vb

if errorlevel 1 (
    echo.
    echo [LOI] Build that bai.
    pause
    exit /b 1
) else (
    echo.
    echo [OK] Build thanh cong: %OUTEXE%
    if exist "Assets" (
        echo Da thay thu muc Assets ^(sprite bieu tuong 777 + nohu^) canh file exe - OK.
    ) else (
        echo [CANH BAO] Khong thay thu muc Assets canh file .bat nay.
        echo            Game van chay binh thuong nhung se fallback ve hinh tron mau
        echo            don gian thay vi sprite. Dat thu muc Assets ^(chuong.png, cherry.png,
        echo            chanh.png, so7do.png, kimcuong.png, bar.png, cam.png, duahau.png,
        echo            so7vang.png, nho.png, mongngua.png, tao.png, Logo777.png^) cung cap
        echo            voi %OUTEXE% de hien sprite.
    )
)

pause
