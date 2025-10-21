### wileys

WhatsApp Web API Library

wileys is a modern TypeScript-based library for WhatsApp Web API integration with built-in fixes for group identifiers like @lid and @jid.

Donation (Solana)

```
8xN639anSq5q64793tseCjPaXNgXEPaKxr91CKEuggKd
```

## Features
@lid and @jid mapping

Multi-device support

End-to-End Encryption support

Handles all WhatsApp message types

Fast and stable
-----

Installation

```bash
npm install wileys
# or
yarn add wileys
```

Quick Start

```typescript
import makeWASocket from 'wileys'
import { getSenderLid, toJid } from 'wileys'

const sock = makeWASocket({ printQRInTerminal: true })

sock.ev.on('messages.upsert', ({ messages }) => {
    const msg = messages[0]
    const info = getSenderLid(msg)
    const jid = toJid(info.lid)
    console.log('normalized jid:', jid)
})
```

Advanced Usage (Multi-file Auth)

```typescript
import makeWASocket, { useMultiFileAuthState } from "wileys"

async function start() {
    const { state, saveCreds } = await useMultiFileAuthState("auth_info")
    const sock = makeWASocket({ auth: state, printQRInTerminal: true })

    sock.ev.on("creds.update", saveCreds)
    sock.ev.on("messages.upsert", ({ messages }) => {
        for (const m of messages) {
            console.log(m.key.remoteJid, m.message?.conversation)
        }
    })
}

start()
```

WhatsApp Connection

Connect with QR Code

```typescript
import makeWASocket, { Browsers } from 'wileys'

const sock = makeWASocket({
    browser: Browsers.ubuntu('My App'),
    printQRInTerminal: true
})
```

Connect with Pairing Code

```typescript
import makeWASocket from 'wileys'

const sock = makeWASocket({
    printQRInTerminal: false
})

if (!sock.authState.creds.registered) {
    const number = '6281234567890'
    const code = await sock.requestPairingCode(number)
    console.log('Pairing code:', code)
}
```

How to Get Participant JID from GroupMetadata

```typescript
import makeWASocket from 'wileys'

const sock = makeWASocket({ 
    // socket configuration
})

// Get group metadata
const groupJid = '123456789-123345@g.us'
const metadata = await sock.groupMetadata(groupJid)

// Get all participant JIDs
const participantJids = metadata.participants.map(participant => participant.id)
console.log('Participant JIDs:', participantJids)

// Resolve LID to JID for each participant
for (const participant of metadata.participants) {
    const lid = participant.id
    const jid = toJid(lid)
    console.log(`LID: ${lid} -> JID: ${jid}`)
}

// Utility function example
async function getAllGroupParticipantsJid(groupJid: string) {
    const metadata = await sock.groupMetadata(groupJid)
    return metadata.participants.map(p => ({
        lid: p.id,
        jid: toJid(p.id),
        isAdmin: p.admin !== undefined
    }))
}

// Usage
const participants = await getAllGroupParticipantsJid(groupJid)
participants.forEach(p => {
    console.log(`Participant: ${p.jid}, Admin: ${p.isAdmin}`)
})
```

Using Cache for Group Metadata (Recommended)

```typescript
import { NodeCache } from 'node-cache'

const groupCache = new NodeCache({ stdTTL: 5 * 60 })

const sock = makeWASocket({
    cachedGroupMetadata: async (jid) => groupCache.get(jid)
})

// Update cache on group changes
sock.ev.on('groups.update', async ([event]) => {
    const metadata = await sock.groupMetadata(event.id)
    groupCache.set(event.id, metadata)
})

sock.ev.on('group-participants.update', async (event) => {
    const metadata = await sock.groupMetadata(event.id)
    groupCache.set(event.id, metadata)
})
```

Connection Handling with Auto-Reconnect

```typescript
import makeWASocket, { DisconnectReason, useMultiFileAuthState } from 'wileys'
import { Boom } from '@hapi/boom'

async function connectToWhatsApp() {
    const { state, saveCreds } = await useMultiFileAuthState('auth_info')
    const sock = makeWASocket({
        auth: state,
        printQRInTerminal: true
    })
    
    sock.ev.on('connection.update', (update) => {
        const { connection, lastDisconnect } = update
        if (connection === 'close') {
            const shouldReconnect = (lastDisconnect.error as Boom)?.output?.statusCode !== DisconnectReason.loggedOut
            console.log('Connection closed, reconnecting:', shouldReconnect)
            if (shouldReconnect) {
                connectToWhatsApp()
            }
        } else if (connection === 'open') {
            console.log('Connection opened')
        }
    })
    
    sock.ev.on('creds.update', saveCreds)
}

connectToWhatsApp()
```

Sending Messages

Text Message

```typescript
await sock.sendMessage(jid, { text: 'Hello world' })
```

Message with Mention

```typescript
await sock.sendMessage(
    jid,
    {
        text: '@12345678901',
        mentions: ['12345678901@s.whatsapp.net']
    }
)
```

Media Message

```typescript
await sock.sendMessage(
    jid,
    {
        image: { url: 'path/to/image.jpg' },
        caption: 'Image description'
    }
)
```

Disclaimer

This project is not affiliated with WhatsApp Inc. Use it responsibly. Avoid spam, abuse, or any illegal activities.
Fork baileys

License

MIT © 2024
