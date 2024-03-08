$DomainName = "suneratech.com"
$ComputerName = hostname
$UserName = 101402
$AdminGroup = [ADSI]"WinNT://$ComputerName/Administrators,group"
$User = [ADSI]"WinNT://$DomainName/$UserName,user"
$AdminGroup.Add($User.Path)