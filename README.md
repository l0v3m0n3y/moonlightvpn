# moonlightvpn
api for moonlightvpn vpn service for android
# Example
```nim
import asyncdispatch, moonlightvpn, json

let data = waitFor get_servers()
for server in data:
  echo server["ip"].getStr() & ":" & $server["port"]
  echo server["country_code"].getStr()
  echo server["protocol"].getStr()
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
