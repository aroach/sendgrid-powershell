To import the module:

`Import-Module -Force ./sendgrid.powershell.psm1`

To send the email: 
`Send-SendGridEmail`

Parameters:
* `SENDGRID_API_KEY`
* `destEmailAddress`
* `fromEmailAddress`
* `subject`
* `content`