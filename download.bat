@echo off
:: -----------------------------
:: Script otomatis push ke GitHub
:: -----------------------------

:: Ganti ini sesuai folder project
cd /d "E:\SC BOT PRIBADI\wileyss"

:: Tambahkan semua perubahan
git add .

:: Commit dengan pesan waktu sekarang
set datetime=%date% %time%
git commit -m "Update otomatis %datetime%"

:: Push ke main
git push

echo.
echo ✅ Semua perubahan sudah di-push ke GitHub!
pause
