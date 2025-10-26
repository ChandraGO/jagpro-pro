@echo off
title 🚀 Publish jagproject ke NPM + Push GitHub
color 0a

echo ==========================================================
echo             AUTO UPLOAD / UPDATE jagproject
echo ==========================================================
echo.

:: Masuk ke folder project
cd /d "E:\SC BOT PRIBADI\wileyss"

:: Pastikan npm dan git tersedia
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ NPM tidak ditemukan. Pastikan Node.js sudah terinstal.
    pause
    exit /b
)

where git >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git tidak ditemukan. Pastikan Git sudah terinstal.
    pause
    exit /b
)

:: Cek login NPM
for /f "delims=" %%A in ('npm whoami 2^>^&1') do set "npmuser=%%A"
if "%npmuser%"=="" (
    echo ❌ Belum login ke NPM!
    echo Jalankan perintah: npm login
    pause
    exit /b
)

echo ✅ Login sebagai: %npmuser%
echo ==========================================================
echo 🔄 Menyimpan perubahan ke Git...
git add .
git commit -m "auto commit sebelum publish" >nul 2>&1

if %errorlevel% neq 0 (
    echo ⚠️ Tidak ada perubahan baru untuk di-commit.
) else (
    echo ✅ Commit berhasil.
)

echo ==========================================================
echo 🔼 Meningkatkan versi package...
npm version patch
if %errorlevel% neq 0 (
    echo ❌ Gagal menaikkan versi package. Periksa error di atas.
    pause
    exit /b
)

echo ==========================================================
echo 🚀 Mengupload package ke NPM...
echo ==========================================================
npm publish --access public
if %errorlevel% neq 0 (
    echo ❌ Publish gagal. Periksa pesan error di atas.
    pause
    exit /b
)

echo ✅ Publish ke NPM berhasil!
echo ==========================================================
echo 🔁 Mengirim perubahan ke GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ❌ Gagal push ke GitHub. Periksa pesan error di atas.
    pause
    exit /b
)

echo 🌐 Membuka halaman NPM...
start https://www.npmjs.com/package/jagproject
echo ==========================================================
echo ✅ Semua proses selesai!
pause
exit /b