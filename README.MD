
# <div align='center'>Baileys Modification</div>

<div align="center">

  <img src="https://cdn.antaranews.com/cache/800x533/2023/05/17/Screenshot_20230517_132501_Gallery.jpg" />

  <a href="https://www.npmjs.com/package/jagoan-project">
    <img src="https://img.shields.io/npm/v/jagoan-project?color=red&label=Version&logo=npm" alt="npm version" />
  </a>

  <a href="https://www.npmjs.com/package/jagoan-project">
    <img src="https://img.shields.io/npm/dt/jagoan-project?color=red&label=Downloads&logo=npm" alt="npm downloads" />
  </a>

  <a href="https://whatsapp.com/channel/0029VanhMDo42DcjiRGJOc2m ">
    <img src="https://img.shields.io/badge/WhatsApp-Channel-25D366?logo=whatsapp&logoColor=white" alt="WhatsApp Channel" />
  </a>

</div>


## 📖 Tentang Jagoan Project

**Jagoan Project** adalah modifikasi dokumentasi dari *baileys*, sebuah library modern berbasis TypeScript untuk integrasi WhatsApp Web API.  
Library ini sudah mendukung sistem *multi-device*, enkripsi end-to-end, dan kompatibilitas tinggi untuk semua tipe pesan di WhatsApp.  
Selain itu, Jagoan Project menghadirkan dokumentasi bergaya modern agar mudah dibaca dan dipahami oleh para pengembang.  

📦 **Donasi (Qris)**  
[Klik di sini untuk melihat QRIS](https://raw.githubusercontent.com/ChandraGO/Data-Jagoan-Project/refs/heads/master/qris.jpg)


---

## ⚙️ Fitur Utama

- Pemetaaan `@lid` dan `@jid`
- Dukungan *multi-device*
- Dukungan enkripsi *End-to-End*
- Menangani semua jenis pesan WhatsApp
- Kinerja cepat dan stabil ⚡

---

## 📦 Instalasi

Gunakan salah satu perintah berikut untuk menginstal:

```bash
npm install jagproject
# atau
yarn add jagproject
```

---


# Documentation

- [Connecting Account](#connecting-account) 
    - [Connect with QR-CODE](#starting-socket-with-qr-code)
    - [Connect with Pairing Code](#starting-socket-with-pairing-code)
    - [Receive Full History](#receive-full-history)
- [Important Notes About Socket Config](#important-notes-about-socket-config)
    - [Caching Group Metadata (Recommended)](#caching-group-metadata-recommended)
    - [Improve Retry System & Decrypt Poll Votes](#improve-retry-system--decrypt-poll-votes)
    - [Receive Notifications in Whatsapp App](#receive-notifications-in-whatsapp-app)

- [Save Auth Info](#saving--restoring-sessions)
- [Handling Events](#handling-events)
    - [Example to Start](#example-to-start)
    - [Decrypt Poll Votes](#decrypt-poll-votes)
    - [Summary of Events on First Connection](#summary-of-events-on-first-connection)
- [Implementing a Data Store](#implementing-a-data-store)
- [Whatsapp IDs Explain](#whatsapp-ids-explain)
- [Utility Functions](#utility-functions)
- [Broadcast Lists & Stories](#broadcast-lists--stories)
    - [Send Broadcast & Stories](#send-broadcast--stories)
    - [Send Global Channel (upswgc)](#send-global-channel-upswgc)
    - [Query a Broadcast List's Recipients & Name](#query-a-broadcast-lists-recipients--name)
- [Sending Messages](#sending-messages)
    - [Non-Media Messages](#non-media-messages)
        - [Buttons Message](#buttons-message)
        - [Buttons Flow](#buttons-flow)
        - [Interactive Message](#interactive-message)
        - [Text Message](#text-message)
        - [Quote Message](#quote-message-works-with-all-types)
        - [Mention User](#mention-user-works-with-most-types)
        - [Mention Status](#mention-status)
        - [Result Poll From Newsletter](#result-poll-from-newsletter)
        - [SendAlbumMessage](#send-album-message)
        - [Interactive Response](#interactive-response)
        - [Request Payment](#request-payment)
        - [Event Message](#event-message)
        - [Interactive](#interactive)
        - [Forward Messages](#forward-messages)
        - [Location Message](#location-message)
        - [Contact Message](#contact-message)
        - [Reaction Message](#reaction-message)
        - [Pin Message](#pin-message)
        - [Poll Message](#poll-message)
    - [Sending with Link Preview](#sending-messages-with-link-previews)
    - [Media Messages](#media-messages)
        - [Gif Message](#gif-message)
        - [Video Message](#video-message)
        - [Audio Message](#audio-message)
        - [Image Message](#image-message)
        - [ViewOnce Message](#view-once-message)
- [Modify Messages](#modify-messages)
    - [Delete Messages (for everyone)](#deleting-messages-for-everyone)
    - [Edit Messages](#editing-messages)
- [Manipulating Media Messages](#manipulating-media-messages)
    - [Thumbnail in Media Messages](#thumbnail-in-media-messages)
    - [Downloading Media Messages](#downloading-media-messages)
    - [Re-upload Media Message to Whatsapp](#re-upload-media-message-to-whatsapp)
- [Reject Call](#reject-call)
- [Send States in Chat](#send-states-in-chat)
    - [Reading Messages](#reading-messages)
    - [Update Presence](#update-presence)
- [Modifying Chats](#modifying-chats)
    - [Archive a Chat](#archive-a-chat)
    - [Mute/Unmute a Chat](#muteunmute-a-chat)
    - [Mark a Chat Read/Unread](#mark-a-chat-readunread)
    - [Delete a Message for Me](#delete-a-message-for-me)
    - [Delete a Chat](#delete-a-chat)
    - [Star/Unstar a Message](#starunstar-a-message)
    - [Disappearing Messages](#disappearing-messages)
- [User Querys](#user-querys)
    - [Check If ID Exists in Whatsapp](#check-if-id-exists-in-whatsapp)
    - [Query Chat History (groups too)](#query-chat-history-groups-too)
    - [Fetch Status](#fetch-status)
    - [Fetch Profile Picture (groups too)](#fetch-profile-picture-groups-too)
    - [Fetch Bussines Profile (such as description or category)](#fetch-bussines-profile-such-as-description-or-category)
    - [Fetch Someone's Presence (if they're typing or online)](#fetch-someones-presence-if-theyre-typing-or-online)
- [Change Profile](#change-profile)
    - [Change Profile Status](#change-profile-status)
    - [Change Profile Name](#change-profile-name)
    - [Change Display Picture (groups too)](#change-display-picture-groups-too)
    - [Remove display picture (groups too)](#remove-display-picture-groups-too)
- [Groups](#groups)
    - [Create a Group](#create-a-group)
    - [Add/Remove or Demote/Promote](#addremove-or-demotepromote)
    - [Change Subject (name)](#change-subject-name)
    - [Change Description](#change-description)
    - [Change Settings](#change-settings)
    - [Leave a Group](#leave-a-group)
    - [Get Invite Code](#get-invite-code)
    - [Revoke Invite Code](#revoke-invite-code)
    - [Join Using Invitation Code](#join-using-invitation-code)
    - [Get Group Info by Invite Code](#get-group-info-by-invite-code)
    - [Query Metadata (participants, name, description...)](#query-metadata-participants-name-description)
    - [Join using groupInviteMessage](#join-using-groupinvitemessage)
    - [Get Request Join List](#get-request-join-list)
    - [Approve/Reject Request Join](#approvereject-request-join)
    - [Get All Participating Groups Metadata](#get-all-participating-groups-metadata)
    - [Toggle Ephemeral](#toggle-ephemeral)
    - [Change Add Mode](#change-add-mode)
- [Privacy](#privacy)
    - [Block/Unblock User](#blockunblock-user)
    - [Get Privacy Settings](#get-privacy-settings)
    - [Get BlockList](#get-blocklist)
    - [Update LastSeen Privacy](#update-lastseen-privacy)
    - [Update Online Privacy](#update-online-privacy)
    - [Update Profile Picture Privacy](#update-profile-picture-privacy)
    - [Update Status Privacy](#update-status-privacy)
    - [Update Read Receipts Privacy](#update-read-receipts-privacy)
    - [Update Groups Add Privacy](#update-groups-add-privacy)
    - [Update Default Disappearing Mode](#update-default-disappearing-mode)
- [Broadcast Lists & Stories](#broadcast-lists--stories)
    - [Send Broadcast & Stories](#send-broadcast--stories)
    - [Query a Broadcast List's Recipients & Name](#query-a-broadcast-lists-recipients--name)
- [Writing Custom Functionality](#writing-custom-functionality)
    - [Enabling Debug Level in Baileys Logs](#enabling-debug-level-in-baileys-logs)
    - [How Whatsapp Communicate With Us](#how-whatsapp-communicate-with-us)
    - [Register a Callback for Websocket Events](#register-a-callback-for-websocket-events)

<a id="connecting-account"></a>
## 🔗 Menghubungkan Akun

WhatsApp provides a multi-device API that allows Baileys to be authenticated as a second WhatsApp client by scanning a **QR code** or **Pairing Code** with WhatsApp on your phone.

<a id="starting-socket-with-qr-code"></a>
### 🔹 Memulai Socket dengan Kode QR

> [!TIP]
> You can customize browser name if you connect with **QR-CODE**, with `Browser` constant, we have some browsers config, **see [here](https://baileys.whiskeysockets.io/types/BrowsersMap.html)**

```javascript
const { default: makeWASocket } = require("jagproject")


const sock = makeWASocket({
    // can provide additional config here
    browser: Browsers.ubuntu('My App'),
    printQRInTerminal: true
})
```

If the connection is successful, you will see a QR code printed on your terminal screen, scan it with WhatsApp on your phone and you'll be logged in!

<a id="starting-socket-with-pairing-code"></a>
### 🔹 Memulai Socket dengan **Kode Pairing**


> [!IMPORTANT]
> Pairing Code isn't Mobile API, it's a method to connect Whatsapp Web without QR-CODE, you can connect only with one device, see [here](https://faq.whatsapp.com/1324084875126592/?cms_platform=web)

The phone number can't have `+` or `()` or `-`, only numbers, you must provide country code

```javascript
const { default: makeWASocket } = require("jagproject")

const sock = makeWASocket({
    // can provide additional config here
    printQRInTerminal: false //need to be false
})

- Normal Pairing
if (!sock.authState.creds.registered) {
    const number = 'XXXXXXXXXXX'
    const code = await sock.requestPairingCode(number)
    console.log(code)
}

- Costum Pairing
if (!sock.authState.creds.registered) {
    const pair = "12345678" // only 8 digit numbers or letters (no more or less)
    const number = 'XXXXXXXXXXX'
    const code = await sock.requestPairingCode(number, pair)
    console.log(code)
}
```

<a id="receive-full-history"></a>
### 🔹 Menerima Riwayat Penuh

1. Set `syncFullHistory` as `true`
2. Baileys, by default, use chrome browser config
    - If you'd like to emulate a desktop connection (and receive more message history), this browser setting to your Socket config:

```javascript
const sock = makeWASocket({
    ...otherOpts,
    // can use Windows, Ubuntu here too
    browser: Browsers.macOS('Desktop'),
    syncFullHistory: true
})
```

<a id="important-notes-about-socket-config"></a>
## ⚙️ Catatan Penting tentang Konfigurasi Socket

<a id="caching-group-metadata-recommended"></a>
### 🧠 Caching Metadata Grup (Direkomendasikan)
- If you use baileys for groups, we recommend you to set `cachedGroupMetadata` in socket config, you need to implement a cache like this:

    ```javascript
    const groupCache = new NodeCache({stdTTL: 5 * 60, useClones: false})

    const sock = makeWASocket({
        cachedGroupMetadata: async (jid) => groupCache.get(jid)
    })

    sock.ev.on('groups.update', async ([event]) => {
        const metadata = await sock.groupMetadata(event.id)
        groupCache.set(event.id, metadata)
    })

    sock.ev.on('group-participants.update', async (event) => {
        const metadata = await sock.groupMetadata(event.id)
        groupCache.set(event.id, metadata)
    })
    ```

<a id="handling-events"></a>
### 🔁 Perbaiki Sistem Retry & Dekripsi Polling
- If you want to improve sending message, retrying when error occurs and decrypt poll votes, you need to have a store and set `getMessage` config in socket like this:
    ```javascript
    const sock = makeWASocket({
        getMessage: async (key) => await getMessageFromStore(key)
    })
    ```
<a id="handling-events"></a>
### 🔔 Menerima Notifikasi di Aplikasi WhatsApp
- If you want to receive notifications in whatsapp app, set `markOnlineOnConnect` to `false`
    ```javascript
    const sock = makeWASocket({
        markOnlineOnConnect: false
    })
    ```
<a id="handling-events"></a>    
## 📦 Menyimpan & Mengembalikan Sesi

You obviously don't want to keep scanning the QR code every time you want to connect.

So, you can load the credentials to log back in:
```javascript
const makeWASocket = require("jagproject").default;
const { useMultiFileAuthState } = require("jagproject");

const { state, saveCreds } = await useMultiFileAuthState('auth_info_baileys')

// will use the given state to connect
// so if valid credentials are available -- it'll connect without QR
const sock = makeWASocket({ auth: state })

// this will be called as soon as the credentials are updated
sock.ev.on('creds.update', saveCreds)
```

> [!IMPORTANT]
> `useMultiFileAuthState` is a utility function to help save the auth state in a single folder, this function serves as a good guide to help write auth & key states for SQL/no-SQL databases, which I would recommend in any production grade system.

> [!NOTE]
> When a message is received/sent, due to signal sessions needing updating, the auth keys (`authState.keys`) will update. Whenever that happens, you must save the updated keys (`authState.keys.set()` is called). Not doing so will prevent your messages from reaching the recipient & cause other unexpected consequences. The `useMultiFileAuthState` function automatically takes care of that, but for any other serious implementation -- you will need to be very careful with the key state management.

<a id="handling-events"></a>
## 📡 Penanganan Event

- Baileys uses the EventEmitter syntax for events.
They're all nicely typed up, so you shouldn't have any issues with an Intellisense editor like VS Code.

> [!IMPORTANT]
> **The events are [these](https://baileys.whiskeysockets.io/types/BaileysEventMap.html)**, it's important you see all events

You can listen to these events like this:
```javascript
const sock = makeWASocket()
sock.ev.on('messages.upsert', ({ messages }) => {
    console.log('got messages', messages)
})
```

<a id="handling-events"></a>
### 🛠️ Contoh Awal

> [!NOTE]
> This example includes basic auth storage too

```javascript
const makeWASocket = require("jagproject").default;
const { DisconnectReason, useMultiFileAuthState } = require("jagproject");
const Boom = require('@hapi/boom');

async function connectToWhatsApp () {
    const { state, saveCreds } = await useMultiFileAuthState('auth_info_baileys')
    const sock = makeWASocket({
        // can provide additional config here
        auth: state,
        printQRInTerminal: true
    })
    sock.ev.on('connection.update', (update) => {
        const { connection, lastDisconnect } = update
        if(connection === 'close') {
            const shouldReconnect = (lastDisconnect.error as Boom)?.output?.statusCode !== DisconnectReason.loggedOut
            console.log('connection closed due to ', lastDisconnect.error, ', reconnecting ', shouldReconnect)
            // reconnect if not logged out
            if(shouldReconnect) {
                connectToWhatsApp()
            }
        } else if(connection === 'open') {
            console.log('opened connection')
        }
    })
    sock.ev.on('messages.upsert', event => {
        for (const m of event.messages) {
            console.log(JSON.stringify(m, undefined, 2))

            console.log('replying to', m.key.remoteJid)
            await sock.sendMessage(m.key.remoteJid!, { text: 'Hello Word' })
        }
    })

    // to storage creds (session info) when it updates
    sock.ev.on('creds.update', saveCreds)
}
// run in main file
connectToWhatsApp()
```

> [!IMPORTANT]
> In `messages.upsert` it's recommended to use a loop like `for (const message of event.messages)` to handle all messages in array

<a id="handling-events"></a>
### 🔐 Dekripsi Pilihan Polling

- By default poll votes are encrypted and handled in `messages.update`
- That's a simple example
```javascript
sock.ev.on('messages.update', event => {
    for(const { key, update } of event) {
        if(update.pollUpdates) {
            const pollCreation = await getMessage(key)
            if(pollCreation) {
                console.log(
                    'got poll update, aggregation: ',
                    getAggregateVotesInPollMessage({
                        message: pollCreation,
                        pollUpdates: update.pollUpdates,
                    })
                )
            }
        }
    }
})
```

- `getMessage` is a [store](#implementing-a-data-store) implementation (in your end)

<a id="handling-events"></a>
### 🔎 Ringkasan Event pada Koneksi Pertama

1. When you connect first time, `connection.update` will be fired requesting you to restart sock
2. Then, history messages will be received in `messaging.history-set`

<a id="handling-events"></a>
## 💾 Mengimplementasikan Data Store

- Baileys does not come with a defacto storage for chats, contacts, or messages. However, a simple in-memory implementation has been provided. The store listens for chat updates, new messages, message updates, etc., to always have an up-to-date version of the data.

> [!IMPORTANT]
> I highly recommend building your own data store, as storing someone's entire chat history in memory is a terrible waste of RAM.

It can be used as follows:

```javascript
const makeWASocket = require("jagproject").default;
const { makeInMemoryStore } = require("jagproject");
// the store maintains the data of the WA connection in memory
// can be written out to a file & read from it
const store = makeInMemoryStore({ })
// can be read from a file
store.readFromFile('./baileys_store.json')
// saves the state to a file every 10s
setInterval(() => {
    store.writeToFile('./baileys_store.json')
}, 10_000)

const sock = makeWASocket({ })
// will listen from this socket
// the store can listen from a new socket once the current socket outlives its lifetime
store.bind(sock.ev)

sock.ev.on('chats.upsert', () => {
    // can use 'store.chats' however you want, even after the socket dies out
    // 'chats' => a KeyedDB instance
    console.log('got chats', store.chats.all())
})

sock.ev.on('contacts.upsert', () => {
    console.log('got contacts', Object.values(store.contacts))
})

```

The store also provides some simple functions such as `loadMessages` that utilize the store to speed up data retrieval.

<a id="handling-events"></a>
## 🆔 Penjelasan ID WhatsApp

- `id` is the WhatsApp ID, called `jid` too, of the person or group you're sending the message to.
    - It must be in the format ```[country code][phone number]@s.whatsapp.net```
            - Example for people: ```+19999999999@s.whatsapp.net```.
            - For groups, it must be in the format ``` 123456789-123345@g.us ```.
    - For broadcast lists, it's `[timestamp of creation]@broadcast`.
    - For stories, the ID is `status@broadcast`.

<a id="handling-events"></a>
## 🧰 Fungsi Utilitas

- `getContentType`, returns the content type for any message
- `getDevice`, returns the device from message
- `makeCacheableSignalKeyStore`, make auth store more fast
- `downloadContentFromMessage`, download content from any message


---
<a id="broadcast-lists--stories"></a>
## 💫 Status Mention Grup (upswgc)

Digunakan untuk mengirim status WhatsApp (story) Grup baik berupa teks maupun media ke status@broadcast.

`
[!NOTE]
Fungsi ini sudah otomatis mendeteksi tipe konten (teks, gambar, video, audio).
Jika teks dan media digabung, hanya satu yang akan dikirim tergantung prioritas konten.
`

### Kirim teks ke status WhatsApp
```javascript
await conn.upswgc("status@broadcast", {
    text: "Halo dunia! ini teks status 📢"
})
```

### Kirim gambar ke status WhatsApp
```javascript
await conn.upswgc("status@broadcast", {
    image: { url: "https://example.com/image.jpg" },
    caption: "Testing gambar status!"
})
```
### Kirim video ke status WhatsApp
```javascript
await conn.upswgc("status@broadcast", {
    video: { url: "https://example.com/video.mp4" },
    caption: "Testing video status!"
})
```
### Kirim audio (voice note) ke status WhatsApp
```javascript
await conn.upswgc("status@broadcast", {
    audio: { url: "https://example.com/audio.mp3" },
    mimetype: "audio/mp4"
})
```

`[!TIP]
Jika kamu ingin mengirim ke story + broadcast sekaligus, gunakan fungsi sendMessage()
dengan broadcast: true seperti dijelaskan pada bagian sebelumnya.`

---

<a id="handling-events"></a>
## 💬 Mengirim Pesan

- Send all types of messages with a single function
    - **[Here](https://baileys.whiskeysockets.io/types/AnyMessageContent.html) you can see all message contents supported, like text message**
    - **[Here](https://baileys.whiskeysockets.io/types/MiscMessageGenerationOptions.html) you can see all options supported, like quote message**

    ```javascript
    const jid: string
    const content: AnyMessageContent
    const options: MiscMessageGenerationOptions

    sock.sendMessage(jid, content, options)
    ```

<a id="handling-events"></a>
### ✉️ Pesan Non-Media

<a id="handling-events"></a>
#### 🔘 Pesan Tombol (Buttons)
```javascript
// send a buttons message!
sock.sendMessage(jid, {
     text: "Hello World !",
     footer: "jagproject - 2025",
     buttons: [
     {
     buttonId: `🚀`, 
     buttonText: {
     displayText: '🗿'
     },
     type: 1 
     }
     ],
     headerType: 1,
     viewOnce: true
 },{ quoted: null })
```

<a id="handling-events"></a>
#### 🔁 Alur Tombol
```javascript
sock.sendMessage(jid, {
  text: "Hello Wolrd !;", 
  footer: "© jagproject Dev",
  buttons: [
  {
    buttonId: '.tes',
    buttonText: {
      displayText: 'TESTING BOT'
    },
    type: 1,
  },
  {
    buttonId: ' ',
    buttonText: {
      displayText: 'PRIVATE SCRIPT'
    },
    type: 1,
  },
  {
    buttonId: 'action',
    buttonText: {
      displayText: 'ini pesan interactiveMeta'
    },
    type: 4,
    nativeFlowInfo: {
      name: 'single_select',
      paramsJson: JSON.stringify({
        title: 'message',
        sections: [
          {
            title: 'jagproject - 2025',
            highlight_label: '😜',
            rows: [
              {
                header: 'HEADER',
                title: 'TITLE',
                description: 'DESCRIPTION',
                id: 'YOUR ID',
              },
              {
                header: 'HEADER',
                title: 'TITLE',
                description: 'DESCRIPTION',
                id: 'YOUR ID',
              },
            ],
          },
        ],
      }),
    },
  },
  ],
  headerType: 1,
  viewOnce: true
}, { quoted: m });
```

<a id="handling-events"></a>
#### 🧩 Pesan Interaktif
```javascript
let msg = generateWAMessageFromContent(m.chat, {
 viewOnceMessage: {
   message: {
       "messageContextInfo": {
         "deviceListMetadata": {},
         "deviceListMetadataVersion": 2
       },
       interactiveMessage: proto.Message.InteractiveMessage.create({
         body: proto.Message.InteractiveMessage.Body.create({
           text: "jagproject Dev"
         }),
         footer: proto.Message.InteractiveMessage.Footer.create({
           text: "Bot"
         }),
         header: proto.Message.InteractiveMessage.Header.create({
           title: "Igna",
           subtitle: "test",
           hasMediaAttachment: false
         }),
         nativeFlowMessage: proto.Message.InteractiveMessage.NativeFlowMessage.create({
           buttons: [
             {
               "name": "single_select",
               "buttonParamsJson": "{\"title\":\"title\",\"sections\":[{\".menu\":\".play dj webito\",\"highlight_label\":\"label\",\"rows\":[{\"header\":\"header\",\"title\":\"title\",\"description\":\"description\",\"id\":\"id\"},{\"header\":\"header\",\"title\":\"title\",\"description\":\"description\",\"id\":\"id\"}]}]}"
             },
             {
               "name": "cta_reply",
               "buttonParamsJson": "{\"display_text\":\"quick_reply\",\"id\":\"message\"}"
             },
             {
                "name": "cta_url",
                "buttonParamsJson": "{\"display_text\":\"url\",\"url\":\"https://www.google.com\",\"merchant_url\":\"https://www.google.com\"}"
             },
             {
                "name": "cta_call",
                "buttonParamsJson": "{\"display_text\":\"call\",\"id\":\"message\"}"
             },
             {
                "name": "cta_copy",
                "buttonParamsJson": "{\"display_text\":\"copy\",\"id\":\"123456789\",\"copy_code\":\"message\"}"
             },
             {
                "name": "cta_reminder",
                "buttonParamsJson": "{\"display_text\":\"Recordatorio\",\"id\":\"message\"}"
             },
             {
                "name": "cta_cancel_reminder",
                "buttonParamsJson": "{\"display_text\":\"cta_cancel_reminder\",\"id\":\"message\"}"
             },
             {
                "name": "address_message",
                "buttonParamsJson": "{\"display_text\":\"address_message\",\"id\":\"message\"}"
             },
             {
                "name": "send_location",
                "buttonParamsJson": ""
             }
          ],
         })
       })
   }
 }
}, {})

return sock.relayMessage(msg.key.remoteJid, msg.message, { messageId: msg.key.id })
```

<a id="handling-events"></a>
#### 📝 Pesan Teks
```javascript
await sock.sendMessage(jid, { text: 'hello word' })
```

<a id="handling-events"></a>
#### ❝ Pesan Quote (bekerja untuk semua tipe)
```javascript
await sock.sendMessage(jid, { text: 'hello word' }, { quoted: message })
```

<a id="handling-events"></a>
#### 🏷️ Mention Pengguna (bekerja di kebanyakan tipe)
- @number is to mention in text, it's optional
```javascript
await sock.sendMessage(
    jid,
    {
        text: '@12345678901',
        mentions: ['12345678901@s.whatsapp.net']
    }
)
```

<a id="handling-events"></a>
#### 📣 Mention Status
- [ jid ] If the Jid Group and Jid Private Chat are included in the JID list, try to make the JID group first starting from the Jid Private Chat or Jid Private Chat in the middle between the group Jid
```javascript
await sock.StatusMentions(
     {
        text: "Hello", // or image / video / audio ( url or buffer )
     },
     [
      "123456789123456789@g.us",
      "123456789@s.whatsapp.net",
      // Enter jid chat here
     ] 
)  
```

<a id="handling-events"></a>
#### 📊 Hasil Poll dari Newsletter
```javascript
await client.sendMessage(
    jid,
    {
        pollResult: {
            name: "Text poll",
            votes: [["Options 1", 10], ["Options 2", 10]], // 10 For Fake Polling Count Results
        }
    }, { quoted : message }
)
```

<a id="handling-events"></a>
#### 🖼️ Mengirim Pesan Album
- url or buffer ( image or video ) 
```javascript
await sock.sendAlbumMessage(
    jid,
    [
       {
          image: { url: "https://example.jpg" }, // or buffer
          caption: "Hello World",
       },
       {
          video: { url: "https://example.mp4" }, // or buffer
          caption: "Hello World",
       },
    ],
    { 
       quoted : message, 
       delay : 2000 // number in seconds
    }
)

```

<a id="handling-events"></a>
#### 🔔 Respon Interaktif 
```javascript
await client.sendMessage(
    jid, 
    {
        buttonReply: {
             text: 'Text',
             nativeFlow: { 
                version: 3,
             },
        },
        type: 'interactive',
        ephemeral: true,
    }
)

```

<a id="handling-events"></a>
#### 💳 Permintaan Pembayaran
```javascript
- Example non media sticker
await client.sendMessage(
    jid,
    {
        requestPayment: {      
           currency: "IDR",
           amount: "10000000",
           from: "123456@s.whatsapp.net",
           note: "Hai Guys",
           background: { ...background of the message }
        }
    },
    { quoted : message }
)

- with media sticker buffer
await client.sendMessage(
    jid,
    {
        requestPayment: {      
           currency: "IDR",
           amount: "10000000",
           from: "123456@s.whatsapp.net",
           sticker: Buffer,
           background: { ...background of the message }
        }
    },
    { quoted : message }
)

- with media sticker url
await client.sendMessage(
    jid,
    {
        requestPayment: {      
           currency: "IDR",
           amount: "10000000",
           from: "123456@s.whatsapp.net",
           sticker: { url: Sticker Url },
           background: { ...background of the message }
        }
    },
    { quoted : message }
)
```

<a id="handling-events"></a>
#### 📆 Pesan Event
```javascript
await client.sendMessage(
   jid, 
   { 
       event: {
           isCanceled: false, // or true for cancel event 
           name: "Name Event", 
           description: "Description Event",
           location: { 
               degressLatitude: -0, 
               degressLongitude: - 0 
           },
           link: Call Link,
           startTime: m.messageTimestamp.low,
           endTime: m.messageTimestamp.low + 86400, // 86400 is day in seconds
           extraGuestsAllowed: true // or false
       }
   },
   { quoted : message }
)
```

<a id="handling-events"></a>
#### 🔗 Interaktif
```javascript
- Example non header media
await client.sendMessage(
    jid,
    {
        text: "Description Of Messages", //Additional information
        title: "Title Of Messages",
        subtitle: "Subtitle Message",
        footer: "Footer Messages",
        interactiveButtons: [
             {
                name: "quick_reply",
                buttonParamsJson: JSON.stringify({
                     display_text: "Display Button",
                     id: "ID"
                })
             },
             {
                name: "cta_url",
                buttonParamsJson: JSON.stringify({
                     display_text: "Display Button",
                     url: "https://www.example.com"
                })
             }
        ]
    },
  {
    quoted : message
  }
)

- Example with media
await client.sendMessage(
    jid,
    {
        image: { url : "https://example.jpg" }, // Can buffer
        caption: "Description Of Messages", //Additional information
        title: "Title Of Messages",
        subtitle: "Subtile Message",
        footer: "Footer Messages",
        media: true,
        interactiveButtons: [
             {
                name: "quick_reply",
                buttonParamsJson: JSON.stringify({
                     display_text: "Display Button",
                     id: "ID"
                })
             },
             {
                name: "cta_url",
                buttonParamsJson: JSON.stringify({
                     display_text: "Display Button",
                     url: "https://www.example.com"
                })
             }
        ]
    },
  {
    quoted : message
  }
)

- Example with header product
await client.sendMessage(
    jid,
    {
        product: {
            productImage: { url: "https://example.jpg }, //or buffer
            productImageCount: 1,
            title: "Title Product",
            description: "Description Product",
            priceAmount1000: 20000 * 1000,
            currencyCode: "IDR",
            retailerId: "Retail",
            url: "https://example.com",            
        },
        businessOwnerJid: "1234@s.whatsapp.net",
        caption: "Description Of Messages", //Additional information
        title: "Title Of Messages",
        footer: "Footer Messages",
        media: true,
        interactiveButtons: [
             {
                name: "quick_reply",
                buttonParamsJson: JSON.stringify({
                     display_text: "Display Button",
                     id: "ID"
                })
             },
             {
                name: "cta_url",
                buttonParamsJson: JSON.stringify({
                     display_text: "Display Button",
                     url: "https://www.example.com"
                })
             }
        ]
    },
  {
    quoted : message
  }
)
```

<a id="handling-events"></a>
#### 📤 Meneruskan Pesan
- You need to have message object, can be retrieved from [store](#implementing-a-data-store) or use a [message](https://baileys.whiskeysockets.io/types/WAMessage.html) object
```javascript
const msg = getMessageFromStore() // implement this on your end
await sock.sendMessage(jid, { forward: msg }) // WA forward the message!
```

<a id="handling-events"></a>
#### 📍 Pesan Lokasi
```javascript
await sock.sendMessage(
    jid,
    {
        location: {
            degreesLatitude: 24.121231,
            degreesLongitude: 55.1121221
        }
    }
)
```

<a id="handling-events"></a>
#### 👤 Pesan Kontak
```javascript
const vcard = 'BEGIN:VCARD\n' // metadata of the contact card
            + 'VERSION:3.0\n'
            + 'FN:Jeff Singh\n' // full name
            + 'ORG:Ashoka Uni;\n' // the organization of the contact
            + 'TEL;type=CELL;type=VOICE;waid=911234567890:+91 12345 67890\n' // WhatsApp ID + phone number
            + 'END:VCARD'

await sock.sendMessage(
    id,
    {
        contacts: {
            displayName: 'Jeff',
            contacts: [{ vcard }]
        }
    }
)
```

<a id="handling-events"></a>
#### ❤️ Pesan Reaksi
- You need to pass the key of message, you can retrieve from [store](#implementing-a-data-store) or use a [key](https://baileys.whiskeysockets.io/types/WAMessageKey.html) object
```javascript
await sock.sendMessage(
    jid,
    {
        react: {
            text: '💖', // use an empty string to remove the reaction
            key: message.key
        }
    }
)
```

<a id="handling-events"></a>
#### 📌 Pesan Pin
- You need to pass the key of message, you can retrieve from [store](#implementing-a-data-store) or use a [key](https://baileys.whiskeysockets.io/types/WAMessageKey.html) object

- Time can be:

| Time  | Seconds        |
|-------|----------------|
| 24h    | 86.400        |
| 7d     | 604.800       |
| 30d    | 2.592.000     |

```javascript
await sock.sendMessage(
    jid,
    {
        pin: {
            type: 1, // 0 to remove
            time: 86400
            key: message.key
        }
    }
)
```

<a id="handling-events"></a>
#### 🗳️ Pesan Poll
```javascript
await sock.sendMessage(
    jid,
    {
        poll: {
            name: 'My Poll',
            values: ['Option 1', 'Option 2', ...],
            selectableCount: 1,
            toAnnouncementGroup: false // or true
        }
    }
)
```

<a id="handling-events"></a>
### 💬 Mengirim Pesan with Link Previews

1. By default, wa does not have link generation when sent from the web
2. Baileys has a function to generate the content for these link previews
3. To enable this function's usage, add `link-preview-js` as a dependency to your project with `yarn add link-preview-js`
4. Send a link:
```javascript
await sock.sendMessage(
    jid,
    {
        text: 'Hi, this was sent using https://github.com/whiskeysockets/baileys'
    }
)
```

### 🎞️ Pesan Media

Sending media (video, stickers, images) is easier & more efficient than ever.

> [!NOTE]
> In media messages, you can pass `{ stream: Stream }` or `{ url: Url }` or `Buffer` directly, you can see more [here](https://baileys.whiskeysockets.io/types/WAMediaUpload.html)

- When specifying a media url, Baileys never loads the entire buffer into memory; it even encrypts the media as a readable stream.

> [!TIP]
> It's recommended to use Stream or Url to save memory

<a id="handling-events"></a>
#### 🎬 Pesan GIF
- Whatsapp doesn't support `.gif` files, that's why we send gifs as common `.mp4` video with `gifPlayback` flag
```javascript
await sock.sendMessage(
    jid,
    {
        video: fs.readFileSync('Media/ma_gif.mp4'),
        caption: 'hello word',
        gifPlayback: true
    }
)
```

<a id="handling-events"></a>
#### 📹 Pesan Video
```javascript
await sock.sendMessage(
    id,
    {
        video: {
            url: './Media/ma_gif.mp4'
        },
        caption: 'hello word',
            ptv: false // if set to true, will send as a `video note`
    }
)
```

<a id="handling-events"></a>
#### 🔊 Pesan Audio
- To audio message work in all devices you need to convert with some tool like `ffmpeg` with this flags:
    ```bash
        codec: libopus //ogg file
        ac: 1 //one channel
        avoid_negative_ts
        make_zero
    ```
    - Example:
    ```bash
    ffmpeg -i input.mp4 -avoid_negative_ts make_zero -ac 1 output.ogg
    ```
```javascript
await sock.sendMessage(
    jid,
    {
        audio: {
            url: './Media/audio.mp3'
        },
        mimetype: 'audio/mp4'
    }
)
```

<a id="handling-events"></a>
#### 🖼️ Pesan Gambar
```javascript
await sock.sendMessage(
    id,
    {
        image: {
            url: './Media/ma_img.png'
        },
        caption: 'hello word'
    }
)
```

<a id="handling-events"></a>
#### 👁️ View Once (Sekali Lihat)

- You can send all messages above as `viewOnce`, you only need to pass `viewOnce: true` in content object

```javascript
await sock.sendMessage(
    id,
    {
        image: {
            url: './Media/ma_img.png'
        },
        viewOnce: true, //works with video, audio too
        caption: 'hello word'
    }
)
```

<a id="handling-events"></a>
## ✏️ Memodifikasi Pesan

<a id="handling-events"></a>
### 🗑️ Menghapus Pesan (untuk semua)

```javascript
const msg = await sock.sendMessage(jid, { text: 'hello word' })
await sock.sendMessage(jid, { delete: msg.key })
```

**Note:** deleting for oneself is supported via `chatModify`, see in [this section](#modifying-chats)

<a id="handling-events"></a>
### 🖊️ Mengedit Pesan

- You can pass all editable contents here
```javascript
await sock.sendMessage(jid, {
      text: 'updated text goes here',
      edit: response.key,
    });
```

<a id="handling-events"></a>
## 🛠️ Manipulasi Pesan Media

<a id="handling-events"></a>
### 🖼️ Thumbnail pada Pesan Media
- For media messages, the thumbnail can be generated automatically for images & stickers provided you add `jimp` or `sharp` as a dependency in your project using `yarn add jimp` or `yarn add sharp`.
- Thumbnails for videos can also be generated automatically, though, you need to have `ffmpeg` installed on your system.

<a id="handling-events"></a>
### ⬇️ Mengunduh Pesan Media

If you want to save the media you received
```javascript
const { createWriteStream } = require('fs');
const { downloadMediaMessage, getContentType } = require("jagproject");

sock.ev.on('messages.upsert', async ({ [m] }) => {
    if (!m.message) return // if there is no text or media message
    const messageType = getContentType(m) // get what type of message it is (text, image, video...)

    // if the message is an image
    if (messageType === 'imageMessage') {
        // download the message
        const stream = await downloadMediaMessage(
            m,
            'stream', // can be 'buffer' too
            { },
            {
                logger,
                // pass this so that baileys can request a reupload of media
                // that has been deleted
                reuploadRequest: sock.updateMediaMessage
            }
        )
        // save to file
        const writeStream = createWriteStream('./my-download.jpeg')
        stream.pipe(writeStream)
    }
}
```

<a id="handling-events"></a>
### 🔁 Mengunggah Ulang Pesan Media ke WhatsApp

- WhatsApp automatically removes old media from their servers. For the device to access said media -- a re-upload is required by another device that has it. This can be accomplished using:
```javascript
await sock.updateMediaMessage(msg)
```

<a id="handling-events"></a>
## 🚫 Menolak Panggilan

- You can obtain `callId` and `callFrom` from `call` event

```javascript
await sock.rejectCall(callId, callFrom)
```

<a id="handling-events"></a>
## 📡 Status Pengiriman di Chat

<a id="handling-events"></a>
### 📖 Membaca Pesan
- A set of message [keys](https://baileys.whiskeysockets.io/types/WAMessageKey.html) must be explicitly marked read now.
- You cannot mark an entire 'chat' read as it were with Baileys Web.
This means you have to keep track of unread messages.

```javascript
const key: WAMessageKey
// can pass multiple keys to read multiple messages as well
await sock.readMessages([key])
```

The message ID is the unique identifier of the message that you are marking as read.
On a `WAMessage`, the `messageID` can be accessed using ```messageID = message.key.id```.

<a id="handling-events"></a>
### 🟢 Memperbarui Presence

- ``` presence ``` can be one of [these](https://baileys.whiskeysockets.io/types/WAPresence.html)
- The presence expires after about 10 seconds.
- This lets the person/group with `jid` know whether you're online, offline, typing etc.

```javascript
await sock.sendPresenceUpdate('available', jid)
```

> [!NOTE]
> If a desktop client is active, WA doesn't send push notifications to the device. If you would like to receive said notifications -- mark your Baileys client offline using `sock.sendPresenceUpdate('unavailable')`

<a id="handling-events"></a>
## 🗂️ Memodifikasi Chat

WA uses an encrypted form of communication to send chat/app updates. This has been implemented mostly and you can send the following updates:

> [!IMPORTANT]
> If you mess up one of your updates, WA can log you out of all your devices and you'll have to log in again.

<a id="handling-events"></a>
### 🗃️ Arsipkan Chat
```javascript
const lastMsgInChat = await getLastMessageInChat(jid) // implement this on your end
await sock.chatModify({ archive: true, lastMessages: [lastMsgInChat] }, jid)
```

<a id="handling-events"></a>
### 🔕 Mute/Unmute Chat

- Supported times:

| Time  | Miliseconds     |
|-------|-----------------|
| Remove | null           |
| 8h     | 86.400.000     |
| 7d     | 604.800.000    |

```javascript
// mute for 8 hours
await sock.chatModify({ mute: 8 * 60 * 60 * 1000 }, jid)
// unmute
await sock.chatModify({ mute: null }, jid)
```

<a id="handling-events"></a>
### ✅ Tandai Chat Baca/Belum Baca
```javascript
const lastMsgInChat = await getLastMessageInChat(jid) // implement this on your end
// mark it unread
await sock.chatModify({ markRead: false, lastMessages: [lastMsgInChat] }, jid)
```

<a id="handling-events"></a>
### 🧹 Hapus Pesan untuk Saya
```javascript
await sock.chatModify(
    {
        clear: {
            messages: [
                {
                    id: 'ATWYHDNNWU81732J',
                    fromMe: true,
                    timestamp: '1654823909'
                }
            ]
        }
    },
    jid
)

```

<a id="handling-events"></a>
### ❌ Hapus Chat
```javascript
const lastMsgInChat = await getLastMessageInChat(jid) // implement this on your end
await sock.chatModify({
        delete: true,
        lastMessages: [
            {
                key: lastMsgInChat.key,
                messageTimestamp: lastMsgInChat.messageTimestamp
            }
        ]
    },
    jid
)
```

<a id="handling-events"></a>
### 📌 Pin/Unpin Chat
```javascript
await sock.chatModify({
        pin: true // or `false` to unpin
    },
    jid
)
```

<a id="handling-events"></a>
### ⭐ Star/Unstar Pesan
```javascript
await sock.chatModify({
        star: {
            messages: [
                {
                    id: 'messageID',
                    fromMe: true // or `false`
                }
            ],
            star: true // - true: Star Message; false: Unstar Message
        }
    },
    jid
)
```

<a id="handling-events"></a>
### 🕒 Pesan yang Menghilang (Disappearing)

- Ephemeral can be:

| Time  | Seconds        |
|-------|----------------|
| Remove | 0          |
| 24h    | 86.400     |
| 7d     | 604.800    |
| 90d    | 7.776.000  |

- You need to pass in **Seconds**, default is 7 days

```javascript
// turn on disappearing messages
await sock.sendMessage(
    jid,
    // this is 1 week in seconds -- how long you want messages to appear for
    { disappearingMessagesInChat: WA_DEFAULT_EPHEMERAL }
)

// will send as a disappearing message
await sock.sendMessage(jid, { text: 'hello' }, { ephemeralExpiration: WA_DEFAULT_EPHEMERAL })

// turn off disappearing messages
await sock.sendMessage(
    jid,
    { disappearingMessagesInChat: false }
)
```

<a id="handling-events"></a>
## 🔎 Query Pengguna

<a id="handling-events"></a>
### 🔍 Cek Jika ID Ada di WhatsApp
```javascript
const [result] = await sock.onWhatsApp(jid)
if (result.exists) console.log (`${jid} exists on WhatsApp, as jid: ${result.jid}`)
```

<a id="handling-events"></a>
### 📜 Query Riwayat Chat (termasuk grup)

- You need to have oldest message in chat
```javascript
const msg = await getOldestMessageInChat(jid)
await sock.fetchMessageHistory(
    50, //quantity (max: 50 per query)
    msg.key,
    msg.messageTimestamp
)
```
- Messages will be received in `messaging.history-set` event

<a id="handling-events"></a>
### 📣 Ambil Status
```javascript
const status = await sock.fetchStatus(jid)
console.log('status: ' + status)
```

<a id="handling-events"></a>
### 🖼️ Ambil Foto Profil (termasuk grup)
- To get the display picture of some person/group
```javascript
// for low res picture
const ppUrl = await sock.profilePictureUrl(jid)
console.log(ppUrl)

// for high res picture
const ppUrl = await sock.profilePictureUrl(jid, 'image')
```

<a id="handling-events"></a>
### 🏷️ Ambil Profil Bisnis (deskripsi/kategori)
```javascript
const profile = await sock.getBusinessProfile(jid)
console.log('business description: ' + profile.description + ', category: ' + profile.category)
```

<a id="handling-events"></a>
### 👀 Ambil Presence Seseorang (sedang mengetik/online)
```javascript
// the presence update is fetched and called here
sock.ev.on('presence.update', console.log)

// request updates for a chat
await sock.presenceSubscribe(jid)
```

<a id="handling-events"></a>
## 🧑‍💼 Mengubah Profil

<a id="handling-events"></a>
### 🧑‍💼 Mengubah Profil Status
```javascript
await sock.updateProfileStatus('Hello World!')
```
<a id="handling-events"></a>
### 🧑‍💼 Mengubah Profil Name
```javascript
await sock.updateProfileName('My name')
```
<a id="handling-events"></a>
### 🖼️ Ubah Foto Profil (termasuk grup)
- To change your display picture or a group's

> [!NOTE]
> Like media messages, you can pass `{ stream: Stream }` or `{ url: Url }` or `Buffer` directly, you can see more [here](https://baileys.whiskeysockets.io/types/WAMediaUpload.html)

```javascript
await sock.updateProfilePicture(jid, { url: './new-profile-picture.jpeg' })
```
<a id="handling-events"></a>
### 🗑️ Hapus Foto Profil (termasuk grup)
```javascript
await sock.removeProfilePicture(jid)
```

<a id="handling-events"></a>
## 👥 Grup

- To change group properties you need to be admin

<a id="handling-events"></a>
### ➕ Buat Grup
```javascript
// title & participants
const group = await sock.groupCreate('My Fab Group', ['1234@s.whatsapp.net', '4564@s.whatsapp.net'])
console.log('created group with id: ' + group.gid)
await sock.sendMessage(group.id, { text: 'hello there' }) // say hello to everyone on the group
```
<a id="handling-events"></a>
### ➕/➖ Tambah/Hapus atau Turunkan/Naikkan Status
```javascript
// id & people to add to the group (will throw error if it fails)
await sock.groupParticipantsUpdate(
    jid,
    ['abcd@s.whatsapp.net', 'efgh@s.whatsapp.net'],
    'add' // replace this parameter with 'remove' or 'demote' or 'promote'
)
```
<a id="handling-events"></a>
### ✏️ Ubah Subjek (Nama)
```javascript
await sock.groupUpdateSubject(jid, 'New Subject!')
```
<a id="handling-events"></a>
### 📝 Ubah Deskripsi
```javascript
await sock.groupUpdateDescription(jid, 'New Description!')
```
<a id="handling-events"></a>
### ⚙️ Ubah Pengaturan
```javascript
// only allow admins to send messages
await sock.groupSettingUpdate(jid, 'announcement')
// allow everyone to send messages
await sock.groupSettingUpdate(jid, 'not_announcement')
// allow everyone to modify the group's settings -- like display picture etc.
await sock.groupSettingUpdate(jid, 'unlocked')
// only allow admins to modify the group's settings
await sock.groupSettingUpdate(jid, 'locked')
```
<a id="handling-events"></a>
### 🚪 Keluar Grup
```javascript
// will throw error if it fails
await sock.groupLeave(jid)
```
<a id="handling-events"></a>
### 🔐 Dapatkan Kode Undangan
- To create link with code use `'https://chat.whatsapp.com/' + code`
```javascript
const code = await sock.groupInviteCode(jid)
console.log('group code: ' + code)
```
<a id="handling-events"></a>
### 🔄 Cabut Kode Undangan
```javascript
const code = await sock.groupRevokeInvite(jid)
console.log('New group code: ' + code)
```
<a id="handling-events"></a>
### ➿ Bergabung Menggunakan Kode Undangan
- Code can't have `https://chat.whatsapp.com/`, only code
```javascript
const response = await sock.groupAcceptInvite(code)
console.log('joined to: ' + response)
```
<a id="handling-events"></a>
### ℹ️ Dapatkan Info Grup lewat Kode Undangan
```javascript
const response = await sock.groupGetInviteInfo(code)
console.log('group information: ' + response)
```
<a id="handling-events"></a>
### 🔎 Query Metadata (peserta, nama, deskripsi...)
```javascript
const metadata = await sock.groupMetadata(jid)
console.log(metadata.id + ', title: ' + metadata.subject + ', description: ' + metadata.desc)
```
<a id="handling-events"></a>
### Join using `groupInviteMessage`
```javascript
const response = await sock.groupAcceptInviteV4(jid, groupInviteMessage)
console.log('joined to: ' + response)
```
<a id="handling-events"></a>
### 📥 Dapatkan Daftar Permintaan Bergabung
```javascript
const response = await sock.groupRequestParticipantsList(jid)
console.log(response)
```
<a id="handling-events"></a>
### ✅/❌ Setuju/Tolak Permintaan Bergabung
```javascript
const response = await sock.groupRequestParticipantsUpdate(
    jid, // group id
    ['abcd@s.whatsapp.net', 'efgh@s.whatsapp.net'],
    'approve' // or 'reject'
)
console.log(response)
```
<a id="handling-events"></a>
### 📚 Dapatkan Semua Metadata Grup yang Diikuti
```javascript
const response = await sock.groupFetchAllParticipating()
console.log(response)
```
<a id="handling-events"></a>
### ⏳ Toggle Ephemeral

- Ephemeral can be:

| Time  | Seconds        |
|-------|----------------|
| Remove | 0          |
| 24h    | 86.400     |
| 7d     | 604.800    |
| 90d    | 7.776.000  |

```javascript
await sock.groupToggleEphemeral(jid, 86400)
```

<a id="handling-events"></a>
### 🔐 Ubah Mode Penambahan
```javascript
await sock.groupMemberAddMode(
    jid,
    'all_member_add' // or 'admin_add'
)
```

<a id="handling-events"></a>
## 🔒 Privasi

<a id="handling-events"></a>
### ⛔/✅ Blokir/Buka Blokir Pengguna
```javascript
await sock.updateBlockStatus(jid, 'block') // Block user
await sock.updateBlockStatus(jid, 'unblock') // Unblock user
```
<a id="handling-events"></a>
### ⚙️ Dapatkan Pengaturan Privasi
```javascript
const privacySettings = await sock.fetchPrivacySettings(true)
console.log('privacy settings: ' + privacySettings)
```
<a id="handling-events"></a>
### 📛 Dapatkan Daftar Blokir
```javascript
const response = await sock.fetchBlocklist()
console.log(response)
```
<a id="handling-events"></a>
### 👀 Update Privasi LastSeen
```javascript
const value = 'all' // 'contacts' | 'contact_blacklist' | 'none'
await sock.updateLastSeenPrivacy(value)
```
<a id="handling-events"></a>
### 🟢 Update Privasi Online
```javascript
const value = 'all' // 'match_last_seen'
await sock.updateOnlinePrivacy(value)
```
<a id="handling-events"></a>
### 🖼️ Update Privasi Foto Profil
```javascript
const value = 'all' // 'contacts' | 'contact_blacklist' | 'none'
await sock.updateProfilePicturePrivacy(value)
```
<a id="handling-events"></a>
### 📣 Update Privasi Status
```javascript
const value = 'all' // 'contacts' | 'contact_blacklist' | 'none'
await sock.updateStatusPrivacy(value)
```
<a id="handling-events"></a>
### ✅ Update Privasi Read Receipts
```javascript
const value = 'all' // 'none'
await sock.updateReadReceiptsPrivacy(value)
```
<a id="handling-events"></a>
### 👥 Update Privasi Tambah Grup
```javascript
const value = 'all' // 'contacts' | 'contact_blacklist'
await sock.updateGroupsAddPrivacy(value)
```
<a id="handling-events"></a>
### 🕒 Update Mode Default Disappearing

- Like [this](#disappearing-messages), ephemeral can be:

| Time  | Seconds        |
|-------|----------------|
| Remove | 0          |
| 24h    | 86.400     |
| 7d     | 604.800    |
| 90d    | 7.776.000  |

```javascript
const ephemeral = 86400
await sock.updateDefaultDisappearingMode(ephemeral)
```

<a id="handling-events"></a>
## 📢 Broadcast & Story

<a id="handling-events"></a>
### 📤 Kirim Broadcast & Story
- Messages can be sent to broadcasts & stories. You need to add the following message options in sendMessage, like this:
```javascript
await sock.sendMessage(
    jid,
    {
        image: {
            url: url
        },
        caption: caption
    },
    {
        backgroundColor: backgroundColor,
        font: font,
        statusJidList: statusJidList,
        broadcast: true
    }
)
```
- Message body can be a `extendedTextMessage` or `imageMessage` or `videoMessage` or `voiceMessage`, see [here](https://baileys.whiskeysockets.io/types/AnyRegularMessageContent.html)
- You can add `backgroundColor` and other options in the message options, see [here](https://baileys.whiskeysockets.io/types/MiscMessageGenerationOptions.html)
- `broadcast: true` enables broadcast mode
- `statusJidList`: a list of people that you can get which you need to provide, which are the people who will get this status message.

- You can send messages to broadcast lists the same way you send messages to groups & individual chats.
- Right now, WA Web does not support creating broadcast lists, but you can still delete them.
- Broadcast IDs are in the format `12345678@broadcast`
<a id="handling-events"></a>
### 🔎 Query Penerima & Nama Broadcast List
```javascript
const bList = await sock.getBroadcastListInfo('1234@broadcast')
console.log (`list name: ${bList.name}, recps: ${bList.recipients}`)
```

<a id="handling-events"></a>
## ✍️ Menulis Fungsionalitas Kustom
Baileys is written with custom functionality in mind. Instead of forking the project & re-writing the internals, you can simply write your own extensions.

<a id="handling-events"></a>
### 🐛 Mengaktifkan Level Debug di Log Baileys
First, enable the logging of unhandled messages from WhatsApp by setting:
```javascript
const sock = makeWASocket({
    logger: P({ level: 'debug' }),
})
```
This will enable you to see all sorts of messages WhatsApp sends in the console.

<a id="handling-events"></a>
### 🔬 Bagaimana WhatsApp Berkomunikasi dengan Kita

> [!TIP]
> If you want to learn whatsapp protocol, we recommend to study about Libsignal Protocol and Noise Protocol

- **Example:** Functionality to track the battery percentage of your phone. You enable logging and you'll see a message about your battery pop up in the console:
    ```
    {
        "level": 10,
        "fromMe": false,
        "frame": {
            "tag": "ib",
            "attrs": {
                "from": "@s.whatsapp.net"
            },
            "content": [
                {
                    "tag": "edge_routing",
                    "attrs": {},
                    "content": [
                        {
                            "tag": "routing_info",
                            "attrs": {},
                            "content": {
                                "type": "Buffer",
                                "data": [8,2,8,5]
                            }
                        }
                    ]
                }
            ]
        },
        "msg":"communication"
    }
    ```

The `'frame'` is what the message received is, it has three components:
- `tag` -- what this frame is about (eg. message will have 'message')
- `attrs` -- a string key-value pair with some metadata (contains ID of the message usually)
- `content` -- the actual data (eg. a message node will have the actual message content in it)
- read more about this format [here](/src/WABinary/readme.md)

<a id="handling-events"></a>
### 🔁 Mendaftarkan Callback untuk Event Websocket

> [!TIP]
> Recommended to see `onMessageReceived` function in `socket.ts` file to understand how websockets events are fired

```javascript
// for any message with tag 'edge_routing'
sock.ws.on('CB:edge_routing', (node: BinaryNode) => { })

// for any message with tag 'edge_routing' and id attribute = abcd
sock.ws.on('CB:edge_routing,id:abcd', (node: BinaryNode) => { })

// for any message with tag 'edge_routing', id attribute = abcd & first content node routing_info
sock.ws.on('CB:edge_routing,id:abcd,routing_info', (node: BinaryNode) => { })
```

> [!NOTE]
> Also, this repo is now licenced under GPL 3 since it uses [libsignal-node](https://git.questbook.io/backend/service-coderunner/-/merge_requests/1)


<a id="handling-events"></a>
## ⚠️ Catatan

Proyek ini **tidak berafiliasi dengan WhatsApp Inc.**  
Gunakan secara bertanggung jawab dan hindari aktivitas ilegal atau penyalahgunaan.

---

<a id="handling-events"></a>
## Lisensi

📘 *Documentation powered by jagoan project*  
🧑‍💻 **Modified and Presented by Jagoan Project**
