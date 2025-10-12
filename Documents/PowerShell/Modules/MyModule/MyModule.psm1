#Get-Content .env | foreach {
#  $name, $value = $_.split('=')
#  if ([string]::IsNullOrWhiteSpace($name) -or $name.Contains('#')) {
#    # skip empty or comment line in ENV file
#    return
#  }
#  Set-Content env:\$name $value
#}

function which ($command) { 
    Get-Command -Name $command -ErrorAction SilentlyContinue | 
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue 
}

function config { 
  param(
    [ArgumentCompleter(
      {
        param($cmd, $param, $wordToComplete)
        [array] $validValues = Get-ChildItem "$env:XDG_DATA_HOME/chezmoi/dot_config" | Select-Object -ExpandProperty BaseName
        $validValues -like "$wordToComplete*"
      }
    )]
    $name
  )
  $configFiles = Get-ChildItem $env:XDG_DATA_HOME/chezmoi/dot_config/$name
  if ($configFiles) {
    if ($configFiles.Count -eq 1) {
      edit $configFiles[0].FullName
    } else {
      edit $configFiles[0].Parent.FullName
    }
  }
}

function Get-Tags {
	Get-ChildItem -Name | Select-String '#\w+' -AllMatches | Select-Object -ExpandProperty Matches | Select-Object Value -Unique 
}

function Search-EnvironmentVariables {
    $didGetQuery = $false
    Get-ChildItem env: | oss -Width 9999 | fzf -m --print-query | ForEach-Object {
        if ($didGetQuery) {
            Select-String -InputObject $_ -AllMatches -Pattern $query
        } else {
            $query = $_
            $didGetQuery = $true
        }
    }
}

function Set-AlacrittyTheme {
  param(
    [ArgumentCompleter(
      {
        param($cmd, $param, $wordToComplete)
        [array] $validValues = Get-ChildItem "$env:XDG_CONFIG_HOME\alacritty\themes\themes" | Select-Object -ExpandProperty BaseName
        $validValues -like "$wordToComplete*"
      }
    )]
    $name
  ) 

  nvim --headless +"%s/\v(theme.{-})([^\/]+).toml/\1$name.toml/" +"wq" $env:XDG_CONFIG_HOME\alacritty\alacritty.toml
}

function Optimize-PdfSize {
  [CmdletBinding(PositionalBinding=$false)]
  param(
    [int]$DPI,
    [string]$Quality,
    [ValidateSet('JPEG','ZIP')]
    [string]$Compression,
    [switch]$Grayscale,
    [string]$OCR,
    [ValidateSet('A0', 'A1', 'A2', 'A3', 'A4', 'A4Small', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'ArchA', 'ArchB', 'ArchC', 'ArchD', 'ArchE', 'B0', 'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'B10', 'C0', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'CSheet', 'DSheet', 'ESheet', 'Executive', 'FLSA', 'FLSE', 'Folio', 'HalfLetter', 'ISOB0', 'ISOB1', 'ISOB10', 'ISOB2', 'ISOB3', 'ISOB4', 'ISOB5', 'ISOB6', 'ISOB7', 'ISOB8', 'ISOB9', 'JISB0', 'JISB1', 'JISB2', 'JISB3', 'JISB4', 'JISB5', 'JISB6', 'Ledger', 'Legal', 'Letter', 'LetterSmall', 'Monarch', 'Quarto', 'Statement', 'Tabloid')]
    [string]$Paper,
    [ValidateSet('GhostScript','ImageMagick')]
    [string]$Program = 'GhostScript',
    [ValidateSet('default', 'prepress', 'printer', 'ebook', 'screen')]
    [string]$GSPreset,
    [string]$GSArgs = "",
    [Parameter(Position=0)]
    [string]$Path,
    [Parameter(Position=1)]
    [string]$Output
  )

  $PaperSizes = @{
    'A0'          = 2384, 3370
    'A1'          = 1684, 2384
    'A2'          = 1191, 1684
    'A3'          = 842, 1191
    'A4'          = 595, 842
    'A4Small'     = 595, 842
    'A5'          = 420, 595
    'A6'          = 298, 420
    'A7'          = 210, 298
    'A8'          = 147, 210
    'A9'          = 105, 147
    'A10'         = 74, 105
    'ArchA'       = 648, 864
    'ArchB'       = 864, 1296
    'ArchC'       = 1296, 1728
    'ArchD'       = 1728, 2592
    'ArchE'       = 2592, 3456
    'B0'          = 2920, 4127
    'B1'          = 2064, 2920
    'B2'          = 1460, 2064
    'B3'          = 1032, 1460
    'B4'          = 729, 1032
    'B5'          = 516, 729
    'B6'          = 363, 516
    'B7'          = 258, 363
    'B8'          = 181, 258
    'B9'          = 127, 181
    'B10'         = 91, 127
    'C0'          = 2599, 3676
    'C1'          = 1837, 2599
    'C2'          = 1298, 1837
    'C3'          = 918, 1296
    'C4'          = 649, 918
    'C5'          = 459, 649
    'C6'          = 323, 459
    'C7'          = 230, 323
    'CSheet'      = 1224, 1584
    'DSheet'      = 1584, 2448
    'ESheet'      = 2448, 3168
    'Executive'   = 540, 720
    'FLSA'        = 612, 936
    'FLSE'        = 612, 936
    'Folio'       = 612, 936
    'HalfLetter'  = 396, 612
    'ISOB0'       = 2835, 4008
    'ISOB1'       = 2004, 2835
    'ISOB10'      = 88, 125
    'ISOB2'       = 1417, 2004
    'ISOB3'       = 1001, 1417
    'ISOB4'       = 709, 1001
    'ISOB5'       = 499, 709
    'ISOB6'       = 354, 499
    'ISOB7'       = 249, 354
    'ISOB8'       = 176, 249
    'ISOB9'       = 125, 176
    'JISB0'       = 1030, 1456
    'JISB1'       = 728, 1030
    'JISB2'       = 515, 728
    'JISB3'       = 364, 515
    'JISB4'       = 257, 364
    'JISB5'       = 182, 257
    'JISB6'       = 128, 182
    'Ledger'      = 1224, 792
    'Legal'       = 612, 1008
    'Letter'      = 612, 792
    'LetterSmall' = 612, 792
    'Monarch'     = 279, 540
    'Quarto'      = 610, 780
    'Statement'   = 396, 612
    'Tabloid'     = 792, 1224
  }

  $GSFilters = @{
    'JPEG' = 'DCTEncode'
    'ZIP' = 'FlateEncode'
  }
  $inputFileExtension = (Get-Item $Path).Extension;

  # magick - -units PixelsPerInch -density 300 -resize 2480x3508 -gravity north -extent 2480x3508 -colorspace Gray -compress JPEG -quality 80 output.pdf


  $preprocessCommand = ""
  
  if ($inputFileExtension -ne ".pdf") {
    $preprocessCommand += "img2pdf $Path | "
    Write-Output "Converting to pdf..."
  }

  $postprocessCommand = ""

  if ($OCR) {
    $postprocessCommand += " | ocrmypdf --output-type pdf -l $OCR - - "
  }

  $gsCommand = "gswin64c "
  $gsCommand += "-sDEVICE=pdfwrite -dCompatibilityLevel='1.4' "
  $gsCommand += "-o - "
  $gsCommand += $GSArgs + " "

  if ($Paper) {
    $gsCommand += "-dDEVICEWIDTHPOINTS=$($PaperSizes[$Paper][0]) -dDEVICEHEIGHTPOINTS=$($PaperSizes[$Paper][1]) "
    $gsCommand += "-dFIXEDMEDIA " # ignore paper size defined in the input pdf
    # $gsCommand += "-sPAPERSIZE=$Paper " # is not precise
    # $gsCommand += "-dPDFFitPage " # centers image on the paper
  }

  if ($Grayscale) {
    $gsCommand += "-dColorConversionStrategy=/Gray -dProcessColorModel=/DeviceGray "
  }

  if ($DPI) {
    $gsCommand += "-dDownsampleColorImages=true -dDownsampleGrayImages=true -dDownsampleMonoImages=true "
    $gsCommand += "-dColorImageDownsampleType=/Bicubic -dGrayImageDownsampleType=/Bicubic -dMonoImageDownsampleType=/Subsample "
    $gsCommand += "-dColorImageResolution=$DPI -dGrayImageResolution=$DPI -dMonoImageResolution=$DPI "
  } 
  
  if ($Compression) {
    $gsCommand += "-dEncodeColorImages=true -dEncodeGrayImages=true -dEncodeMonoImages=true "
    $gsCommand += "-dColorImageFilter=/$($GSFilters[$Compression]) -dGrayImageFilter=/$($GSFilters[$Compression]) -dMonoImageFilter=/CCITTFaxEncode "
    $gsCommand += "-dAutoFilterColorImages=false -dAutoFilterGrayImages=false " # GS will compress raster images to JPEG by default
    # $gsCommand += "-dPassThroughJPEGImages=false "
  }

  if ($Quality) {
    $gsCommand += "-c '<< /ColorACSImageDict << /VSamples [ 1 1 1 1 ] /HSamples [ 1 1 1 1 ] /QFactor $Quality /Blend 1 /ColorTransform 1 >> >> setdistillerparams ' "
    $gsCommand += "-c '<< /GrayACSImageDict << /VSamples [ 1 1 1 1 ] /HSamples [ 1 1 1 1 ] /QFactor $Quality /Blend 1 /GrayTransform 1 >> >> setdistillerparams '"
  }

  if ($GSPreset) {
    $gsCommand += "-dPDFSETTINGS=/$GSPreset "
  }

  if ($inputFileExtension -eq ".pdf") {
    $gsCommand += "'$Path'" # the input file has to be the last argument to GS
  } else {
    $gsCommand += "-";
  }


  $command = "$preprocessCommand $gsCommand $postprocessCommand > $Output";

  Write-Verbose "Pipeline: $command"

  Invoke-Expression $command *>&1 | ForEach-Object {
    if ($_ -like "*page*") { # remove all GS messages except for information about the processing progress
      Write-Output $_
    } else {
      Write-Verbose $_
    }
  }
}

function GoodPdf {
  param(
    $in, $out
  )
  Optimize-PdfSize -Grayscale -OCR deu -Paper A4 -Compression ZIP -DPI 300 -Path $in  -Output $out 
}

function SmallPdf {
  param(
    $in, $out
  )
  Optimize-PdfSize -Grayscale -OCR deu -Paper A4 -Compression ZIP -DPI 300 -Path $in  -Output $out 
}

function toPdfsHere {
  param($in)
  Get-ChildItem $in -File -Recurse -Exclude _* | ForEach-Object { GoodPdf $_ .\$((Get-Item $_).Name).pdf; Move-Item -Path $_ -Destination $($_.Directory)\_$($_.Name) }
}

Set-Alias to150dpi Optimize-PdfSize

