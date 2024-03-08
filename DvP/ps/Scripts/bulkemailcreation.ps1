$user = Import-Csv -Path "D:\eclipse-workspace\test\book1.csv"
$user|foreach{
New-MsolUser -FirstName $_.first -LastName $_.Last -DisplayName $_.DN -UserPrincipalName $_.email -Department $_.dep -MobilePhone $_.ph -Title $_.designation -Password $_.password -LicenseAssignment $_.licence -UsageLocation "US"
}