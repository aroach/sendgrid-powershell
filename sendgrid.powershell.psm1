function Send-SendGridEmail {
param(
  [Parameter(Mandatory=$True)]
    [String] $SENDGRID_API_KEY,
  [Parameter(Mandatory=$True)]
    [String] $destEmailAddress,
  [Parameter(Mandatory=$True)]
    [String] $fromEmailAddress,
  [Parameter(Mandatory=$True)]
    [String] $subject,
  [Parameter(Mandatory=$True)]
    [String] $content
)

  $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
  $headers.Add("Authorization", "Bearer " + $SENDGRID_API_KEY)
  $headers.Add("Content-Type", "application/json")

  $body = @{
    personalizations = @(
      @{
        to = @(
          @{
            email = $destEmailAddress
          }
        )
      }
    )
    from = @{
      email = $fromEmailAddress
    }
    subject = $subject
    content = @(
      @{
        type = "text/plain"
        value = $content
      }
    )
  }

  $bodyJson = $body | ConvertTo-Json -Depth 4

  $bodyJson | Out-Host

  $response = Invoke-RestMethod -Uri https://api.sendgrid.com/v3/mail/send -Method Post -Headers $headers -Body $bodyJson
}
Export-ModuleMember -Function Send-SendGridEmail