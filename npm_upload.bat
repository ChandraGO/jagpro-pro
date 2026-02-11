@echo off
title 🚀 Auto Publish jagproject ke NPM (Auto Update Date)
color 0a

echo ==========================================================
echo            AUTO UPLOAD jagproject ke NPM (Auto)
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

start cmd /k ^
"echo ========================================================== && ^
 echo 🔄 Git commit awal (kalau ada perubahan)... && ^
 git add . && git commit -m 'auto commit sebelum publish' || echo (tidak ada perubahan untuk di-commit) && ^
 echo ========================================================== && ^
 echo 🗓️ Set package.json.update = tanggal hari ini (id-ID)... && ^
 node -e "const fs=require('fs'); const pkg=JSON.parse(fs.readFileSync('package.json','utf8')); const t=new Date().toLocaleDateString('id-ID',{day:'2-digit',month:'long',year:'numeric'}); pkg.update=t; fs.writeFileSync('package.json', JSON.stringify(pkg,null,2)+'\n'); console.log('package.json update =', t);" && ^
 if errorlevel 1 (echo ❌ Gagal update package.json. && pause && exit /b) && ^
 echo ========================================================== && ^
 echo 🧾 Rewrite README dari package.json.update... && ^
 node -e "const fs=require('fs'); const pkg=JSON.parse(fs.readFileSync('package.json','utf8')); const t=pkg.update; const f=fs.existsSync('README.MD')?'README.MD':(fs.existsSync('README.md')?'README.md':null); if(!f){console.error('README tidak ditemukan'); process.exit(1);} let r=fs.readFileSync(f,'utf8'); const re=/<sub>\\s*Last update:\\s*<strong>[\\s\\S]*?<\\/strong>\\s*<\\/sub>/i; if(!re.test(r)){console.error('Tag Last update tidak ketemu di '+f); process.exit(2);} r=r.replace(re, `<sub>Last update: <strong>${t}</strong></sub>`); fs.writeFileSync(f,r); console.log('README synced:', f, t);" && ^
 if errorlevel 1 (echo ❌ Gagal rewrite README. Publish dibatalkan. && pause && exit /b) && ^
 echo ========================================================== && ^
 echo 🔎 CEK HASIL (harus sudah tanggal baru): && ^
 node -e "console.log('update(package.json)=', require('./package.json').update)" && ^
 findstr /i /c:\"Last update\" README.MD && ^
 echo ========================================================== && ^
 echo 🆙 Naikkan versi (patch)... && ^
 npm version patch && ^
 echo ========================================================== && ^
 echo 🚀 Publish ke NPM (verbose)... && ^
 npm publish --access public --loglevel verbose && ^
 echo ========================================================== && ^
 echo ✅ Upload selesai! && ^
 git push origin main && ^
 start https://www.npmjs.com/package/jagproject && ^
 echo ========================================================== && ^
 echo Tekan tombol apa saja untuk keluar... && pause"
