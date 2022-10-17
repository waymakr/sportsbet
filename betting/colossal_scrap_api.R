library(httr)

res <- VERB("GET", url = "curl "https://apicob.generationweb.net.au/GWBetService/r/b/GetEventMatch/5863181?rand=1664393959764" ^
  -H "authority: apicob.generationweb.net.au" ^
  -H "accept: application/json, text/plain, */*" ^
  -H "accept-language: en-US,en;q=0.9,es;q=0.8" ^
  -H "authorization: clientKey=colossalbet&timestamp=1664393959779&signature=981726fb5235a0761fca98a5ecbf371102b6e574" ^
  -H "origin: https://www.colossalbet.com.au" ^
  -H "referer: https://www.colossalbet.com.au/" ^
  -H "sec-ch-ua: ^\^"Microsoft Edge^\^";v=^\^"105^\^", ^\^"Not)A;Brand^\^";v=^\^"8^\^", ^\^"Chromium^\^";v=^\^"105^\^"" ^
  -H "sec-ch-ua-mobile: ?0" ^
  -H "sec-ch-ua-platform: ^\^"Windows^\^"" ^
  -H "sec-fetch-dest: empty" ^
  -H "sec-fetch-mode: cors" ^
  -H "sec-fetch-site: cross-site" ^
  -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.53" ^
  --compressed")

cat(content(res, 'text'))
