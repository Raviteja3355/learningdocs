$GName = "Sunera Technologies"
>> Get-UnifiedGroupLinks -Identity $GName -LinkType Members -ResultSize Unlimited | Select Name, PrimarySMTPAddress |
>> Export-CSV "D:\Groups\Sunera technologies New.csv" -NoTypeInformation -Encoding UTF8