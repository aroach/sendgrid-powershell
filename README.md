To import the module:

`Import-Module -Force ./sendgrid.powershell.psd1 -Verbose`

To send the email: 
`Send-SendGridEmail`

PowerShell will prompt you to add the following parameters if you don't add them on the command line.

Parameters:
* `SENDGRID_API_KEY`
* `destEmailAddress`
* `fromEmailAddress`
* `subject`
* `content`