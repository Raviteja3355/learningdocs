$Userslist = Import-CSV C:\Users\sandeep.venepally\Downloads\Distribution-Groups-Members.csv
>> ForEach ($User in $Userslist)
>> {
>> Add-DistributionGroupMember -Identity "EAS Onshore" -Member $User.PrimarySmtpAddress
>> }