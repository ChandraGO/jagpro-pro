@echo off
title 🚀 Auto Publish jagproject ke NPM (Verbose Mode)
color 0a

echo ==========================================================
echo            AUTO UPLOAD jagproject ke NPM (Verbose)
echo ==========================================================
echo.

cd /d "E:\SC BOT PRIBADI\wileyss"

echo 🔍 Mengecek login NPM...
for /f "delims=" %%A in ('npm whoami 2^>^&1') do set "npmuser=%%A"
if "%npmuser%"=="" (
    echo ❌ Belum login ke NPM.
    echo Jalankan "npm login" terlebih dahulu.
    pause
    exit /b
)
echo ✅ Login sebagai: %npmuser%
echo.

:: Buka jendela baru dan langsung jalankan semua langkah
start cmd /k ^
"echo ========================================================== && ^
 echo 🔄 Menyimpan perubahan dan menaikkan versi... && ^
 git add . && git commit -m 'auto commit sebelum publish' && npm version patch && ^
 echo ========================================================== && ^
 echo 🚀 Memulai upload ke NPM (verbose)... && ^
 npm publish --access public --loglevel verbose && ^
 echo ========================================================== && ^
 echo ✅ Upload selesai! && ^
 git push origin main && ^
 start https://www.npmjs.com/package/jagproject && ^
 echo ========================================================== && ^
 echo Tekan tombol apa saja untuk keluar... && pause"
