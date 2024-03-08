$AuthUser = Read-Host "Enter the Auth User Email ID"
>> $NewUsers = Import-Csv "D:\Users.csv"
>> foreach ($NewUser in $NewUsers.Name)
>> {
>>
>> Add-MailboxFolderPermission -Identity $NewUser":\Calendar” -User $AuthUser -AccessRights PublishingAuthor
>>
>> }