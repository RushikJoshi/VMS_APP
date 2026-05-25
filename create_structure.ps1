$lib = "D:\vms_app\lib"

# 1. Auth Bloc files
$authBloc = Join-Path $lib "features\authentication\presentation\bloc"
if (-not (Test-Path (Join-Path $authBloc "auth_event.dart"))) {
    New-Item -ItemType File -Path (Join-Path $authBloc "auth_event.dart") -Value "// Auth Event placeholder`nabstract class AuthEvent {}" -Force | Out-Null
}
if (-not (Test-Path (Join-Path $authBloc "auth_state.dart"))) {
    New-Item -ItemType File -Path (Join-Path $authBloc "auth_state.dart") -Value "// Auth State placeholder`nabstract class AuthState {}" -Force | Out-Null
}

# 2. Features
$features = @(
    "vendor_management", "rfq_management", "quotation_management", "purchase_orders",
    "sales_orders", "logistics", "grn_management", "invoice_management",
    "payment_management", "analytics", "notifications", "chat_support",
    "profile", "settings"
)

$layers = @("data", "domain", "presentation")

foreach ($feat in $features) {
    $featLayers = [System.Collections.Generic.List[string]]::new($layers)
    if ($feat -eq "quotation_management") {
        $featLayers.Add("data/ac")
    }
    
    foreach ($layer in $featLayers) {
        $layerPath = Join-Path $lib "features\$feat\$layer"
        New-Item -ItemType Directory -Path $layerPath -Force | Out-Null
        
        $files = Get-ChildItem -Path $layerPath -Filter *.dart
        if ($files.Count -eq 0 -or $files -eq $null) {
            $placeholder = Join-Path $layerPath "placeholder.dart"
            $commentLayer = $layer.Replace("/", " ")
            New-Item -ItemType File -Path $placeholder -Value "// Placeholder for $feat $commentLayer layer" -Force | Out-Null
        }
    }
}

# 3. Shared folders
$shared = @("models", "enums", "mixins", "typedefs", "common_widgets")
foreach ($folder in $shared) {
    $folderPath = Join-Path $lib "shared\$folder"
    New-Item -ItemType Directory -Path $folderPath -Force | Out-Null
    
    $files = Get-ChildItem -Path $folderPath -Filter *.dart
    if ($files.Count -eq 0 -or $files -eq $null) {
        $placeholder = Join-Path $folderPath "placeholder.dart"
        New-Item -ItemType File -Path $placeholder -Value "// Placeholder for shared $folder" -Force | Out-Null
    }
}

Write-Output "Flutter Mobile Enterprise Structure Completed successfully!"
