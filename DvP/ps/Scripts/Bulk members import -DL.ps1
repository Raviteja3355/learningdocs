Import-CSV "D:\BS\test.csv" | ForEach-Object {

Add-UnifiedGroupLinks –Identity "Contracts" –LinkType Members  –Links $_.member

}