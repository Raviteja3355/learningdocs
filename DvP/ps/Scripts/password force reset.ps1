$Emails = Get-Content "d:\new.txt"
>> $Emails
>>
>> ForEach ($Email in $Emails)
>> {
>>
>> Set-MsolUserPassword -UserPrincipalName "$Email" -ForceChangePasswordOnly $true -ForceChangePassword $true
>> }