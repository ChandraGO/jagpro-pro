"use strict";

const fs = require("fs");
const path = require("path");
const axios = require("axios");

const URL = "https://wppconnect.io/whatsapp-versions/";
const OUT_FILE = path.join(__dirname, "wileys-version.json");


function parseCurrentVersion(html) {
  // cari "Current Version" lalu ambil versi setelahnya (format: 2.3000.1032562324-alpha)
  const m = html.match(/Current Version[\s\S]{0,800}?\b(\d+\.\d+\.\d+(?:-[a-zA-Z0-9]+)?)\b/);
  if (!m) return null;

  const full = m[1];                 // "2.3000.1032562324-alpha"
  const numeric = full.split("-")[0]; // "2.3000.1032562324"

  const parts = numeric.split(".").map((x) => Number(x));
  if (parts.length !== 3 || parts.some((n) => !Number.isFinite(n))) return null;

  return { full, parts };
}

async function main() {
  try {
    const res = await axios.get(URL, {
      timeout: 15000,
      headers: {
        // biar gak gampang diblok
        "User-Agent": "Mozilla/5.0 (Node.js) wileyss-wa-version-updater",
        "Accept": "text/html,application/xhtml+xml",
      },
    });

    const parsed = parseCurrentVersion(res.data);
    if (!parsed) throw new Error("Gagal parse Current Version dari halaman.");

    const payload = {
      version: parsed.parts,
      source: URL,
      fetchedAt: new Date().toISOString(),
      raw: parsed.full,
    };

    fs.writeFileSync(OUT_FILE, JSON.stringify(payload, null, 2), "utf8");
    console.log("[wileyss] WA Web version updated:", parsed.full, "=>", parsed.parts);
  } catch (err) {
    console.log("[wileyss] Skip update WA Web version (offline / gagal fetch).");
    console.log("[wileyss] Reason:", err?.message || err);
    // jangan bikin install gagal
    process.exit(0);
  }
}

main();
