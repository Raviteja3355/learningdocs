$DGName = "Digital Assurance"
>> Get-DistributionGroupMember -Identity $DGName | Select Name, PrimarySMTPAddress |
>> Export-CSV "D:\Distribution-List-Members.csv" -NoTypeInformation -Encoding UTF8