import asyncdispatch, httpclient, json, strutils

const api = "http://15.235.199.120/api/v1"
var headers = newHttpHeaders({"Connection": "keep-alive",  "Host": "15.235.199.120",  "Content-Type": "application/json",  "accept": "application/json, text/plain, */*", "user-agent":"Mozilla/5.0 (Android; Android 7.1.1; LG-H910 Build/NRD90M) AppleWebKit/536.38 (KHTML, like Gecko)  Chrome/55.0.1973.314 Mobile Safari/600.3"})

proc get_servers*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/list?p=com.fast_secure.moonlight_vpn")
    let body = await response.body
    result=parseJson(body)
  finally:
    client.close()

proc my_ip*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/request-ip")
    let body = await response.body
    result=parseJson(body)
  finally:
    client.close()
