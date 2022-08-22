$data = Import-Csv semart_test.csv -Delimiter '	' -Encoding UTF8

$data |%{
    $folder = ".\authors\test\$((Get-Culture).TextInfo.ToTitleCase($_.AUTHOR.ToLower().Replace('?', '')))"

    if (-not (Test-Path $folder)) { 
        New-Item $folder -ItemType Directory
    }

    Copy-Item -Path "Images/$($_.IMAGE_FILE)" -Destination $(Join-Path $folder $_.IMAGE_FILE)
}