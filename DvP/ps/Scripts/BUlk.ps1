$email_ids = Get-Content "D:\BS\test2.csv" #Add file path here

ForEach ($e_id in $email_ids)
{
Add-distributiongroupmember -identity "cmspaudit@suneratech.com" -member $e_id
}