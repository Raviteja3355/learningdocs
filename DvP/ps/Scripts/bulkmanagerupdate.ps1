$users = Get-Content "D:\EMPLIST.txt"



$manager='CN=Prachi Thakur,OU=EAS,OU=Suneratech,DC=suneratech,DC=com'



$x="failed"
$y="successful"



ForEach ($user in $users)
{



Get-ADUser -Filter 'SamAccountName -like $user' | Set-ADUser -Manager $manager



$r=(Get-ADUser -Filter 'SamAccountName -like $user') -and (Get-ADUser -filter 'manager -eq $manager')




if( $r -eq 'true' )
{
Write-Host "EMP ID :" $user " updation " $y
}
else
{
write-host "EMP ID :" $user " updation " $x
}



}