@echo off
title 🚀 Publish jagproject ke NPM + Push GitHub
color 0a

echo ==========================================================
echo             AUTO UPLOAD / UPDATE jagproject
echo ==========================================================
echo.

cd /d "E:\SC BOT PRIBADI\wileyss"
if %errorlevel% neq 0 (
    echo ❌ Gagal masuk ke direktori E:\SC BOT PRIBADI\wileyss
    pause
    exit /b
)

echo [DEBUG] Memeriksa npm...
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ NPM tidak ditemukan.
    pause
    exit /b
)

echo [DEBUG] Memeriksa git...
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git tidak ditemukan.
    pause
    exit /b
)

echo [DEBUG] Memeriksa login npm...
for /f "delims=" %%A in ('npm whoami 2^>^&1') do set "npmuser=%%A"
if "%npmuser%"=="" (
    echo ❌ Belum login ke NPM!
    pause
    exit /b
)
echo ✅ Login sebagai: %npmuser%

echo [DEBUG] Menyimpan perubahan ke Git...
git add .
git commit -m "auto commit sebelum publish" > git_commit.log 2>&1
if %errorlevel% neq 0 (
    echo ⚠️ Tidak ada perubahan baru untuk di-commit. Lihat git_commit.log untuk detail.
    type git_commit.log
) else (
    echo ✅ Commit berhasil.
)

echo [DEBUG] Meningkatkan versi package...
echo [DEBUG] Menjalankan npm version patch...
npm version patch > npm_version.log 2>&1
set "ERROR_CODE=%errorlevel%"
echo [DEBUG] Errorlevel setelah npm version patch: %ERROR_CODE%
if %ERROR_CODE% neq 0 (
    echo ❌ Gagal menaikkan versi package. Lihat npm_version.log untuk detail.
    type npm_version.log
    pause
    exit /b
)
echo ✅ Versi package berhasil ditingkatkan.

echo [DEBUG] Mengupload package ke NPM...
npm publish --access public > npm_publish.log 2>&1
if %errorlevel% neq 0 (
    echo ❌ Publish gagal. Lihat npm_publish.log untuk detail.
    type npm_publish.log
    pause
    exit /b
)
echo ✅ Publish ke NPM berhasil!

echo [DEBUG] Mengirim perubahan ke GitHub...
git push origin main > git_push.log 2>&1
if %errorlevel% neq 0 (
    echo ❌ Gagal push ke GitHub. Lihat git_push.log untuk detail.
    type git_push.log
    pause
    exit /b
)

echo 🌐 Membuka halaman NPM...
start https://www.npmjs.com/package/jagproject
echo ==========================================================
echo ✅ Semua proses selesai!
pause
exit /b