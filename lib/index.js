"use strict";

const chalk = require("chalk");
const gradient = require("gradient-string");
const pkg = require("../package.json"); // root -> wileyss/package.json

// Ambil info dari package.json
const version = pkg.version || "-";
const updateDate = pkg.update || "Belum ditentukan";
const name = (pkg.name || "Jagoan Project").toString();

// Konfigurasi tampilan (silakan ubah sesuai kebutuhan)
const CONTACT = "6282252509320";
const YOUTUBE = "@jagoanproject";
const STATUS = "SC MD update setiap hari, Hubungi Admin sekrang.!!! 😱";

// Utils: lebar box otomatis mengikuti terminal, dengan batas aman
const termWidth = Math.max(60, Math.min(process.stdout.columns || 80, 100));
const boxInnerWidth = termWidth - 2;

function hr(char = "─") {
  return char.repeat(termWidth);
}

function padLine(text = "") {
  // Potong teks kalau kepanjangan
  const clean = text.length > boxInnerWidth - 2 ? text.slice(0, boxInnerWidth - 5) + "..." : text;
  const spaces = " ".repeat(Math.max(0, boxInnerWidth - 2 - clean.length));
return `│ ${clean}${spaces}`;
}

function centerLine(text = "") {
  const clean = text.length > boxInnerWidth - 2 ? text.slice(0, boxInnerWidth - 5) + "..." : text;
  const totalSpace = Math.max(0, boxInnerWidth - 2 - clean.length);
  const left = Math.floor(totalSpace / 2);
  const right = totalSpace - left;
return `│ ${" ".repeat(left)}${clean}${" ".repeat(right)}`;
}

function box(lines, colorFn = (x) => x) {
  const top = `┌${"─".repeat(boxInnerWidth)}┐`;
  const bot = `└${"─".repeat(boxInnerWidth)}┘`;
  console.log(colorFn(top));
  for (const line of lines) console.log(colorFn(line));
  console.log(colorFn(bot));
}

function printBanner() {
  // Header gradient
  const title = `⚡  ${name.toUpperCase()} — Baileys Jagoan Project ⚡`;
  const subtitle = "WhatsApp Web API Library (Multi-Device)";

  console.log();
  console.log(gradient.pastel.multiline(hr("═")));
console.log(chalk.redBright.bold(title));
  console.log(chalk.gray(subtitle));
  console.log(gradient.pastel.multiline(hr("═")));
  console.log();

  // Box info
  const infoLines = [
    centerLine(chalk.bold("INFORMASI PROJECT")),
    padLine(""),
    padLine(`${chalk.greenBright("Version")}  : ${chalk.whiteBright(version)}`),
    padLine(`${chalk.cyanBright("Update")}   : ${chalk.whiteBright(updateDate)}`),
    padLine(`${chalk.yellowBright("Iklan")}  : ${chalk.whiteBright(STATUS)}`),
    padLine(`${chalk.magentaBright("Youtube")} : ${chalk.whiteBright(YOUTUBE)}`),
    padLine(`${chalk.blueBright("Kontak")}  : ${chalk.whiteBright(CONTACT)}`),
    padLine(""),
    padLine(chalk.gray("Tip: di bailyes ini disarankan pakai Node >= 20.")),
  ];

  box(infoLines, (s) => chalk.white(s));
  console.log();
}

printBanner();

/**
PEMBATAS
 */

var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
        desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __exportStar = (this && this.__exportStar) || function(m, exports) {
    for (var p in m)
        if (p !== "default" && !Object.prototype.hasOwnProperty.call(exports, p))
            __createBinding(exports, m, p);
};
var __importDefault = (this && this.__importDefault) || function(mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};

Object.defineProperty(exports, "__esModule", { value: true });
exports.proto = exports.makeWASocket = void 0;

const WAProto_1 = require("../WAProto");
Object.defineProperty(exports, "proto", {
    enumerable: true,
    get: function() {
        return WAProto_1.proto;
    }
});

const Socket_1 = __importDefault(require("./Socket"));
exports.makeWASocket = Socket_1.default;

__exportStar(require("../WAProto"), exports);
__exportStar(require("./Utils"), exports);
__exportStar(require("./Types"), exports);
__exportStar(require("./Store"), exports);
__exportStar(require("./Defaults"), exports);
__exportStar(require("./WABinary"), exports);
__exportStar(require("./WAM"), exports);
__exportStar(require("./WAUSync"), exports);

exports.default = Socket_1.default;
