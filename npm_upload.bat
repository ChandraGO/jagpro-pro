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

:: Jalankan publish dengan PowerShell agar log tetap tampil
powershell -NoExit -Command ^
  "$ErrorActionPreference='SilentlyContinue'; ^
   npm publish --access public; ^
   if ($LASTEXITCODE -eq 0) { ^
       Write-Host ''; ^
       Write-Host '✅ Publish ke NPM berhasil!'; ^
       Write-Host '==========================================================='; ^
       Write-Host '🔁 Mengirim perubahan ke GitHub...'; ^
       git push origin main; ^
       Write-Host '🌐 Membuka halaman NPM...'; ^
       Start-Process 'https://www.npmjs.com/package/jagproject'; ^
       Write-Host '==========================================================='; ^
       Write-Host '✅ Semua proses selesai! Tekan tombol apapun untuk keluar...'; ^
       Pause ^
   } else { ^
       Write-Host '❌ Publish gagal. Periksa pesan error di atas.'; ^
       Pause ^
   }"

exit /b
