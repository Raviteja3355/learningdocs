$users = Get-Content "C:\Users\101393\OneDrive - Sunera Technologies\Documents\testmove.txt"

$dsg = "contract consultant"

$x="failed"
$y="successful"



ForEach ($user in $users)
{



Get-ADUser -Filter 'SamAccountName -like $user' | Set-ADUser -title $dsg



$r=(Get-ADUser -Filter 'SamAccountName -like $user') -and (Get-ADUser -filter 'title -eq $dsg')




if( $r -eq 'true' )
{
Write-Host "EMP ID :" $user " updation " $y
}
else
{
write-host "EMP ID :" $user " updation " $x
}



}