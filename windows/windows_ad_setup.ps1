# Windows Server: Basic AD User Setup and Audit Policy Enablement
# Run this in PowerShell as Administrator on a Domain Controller

# 1. Create a new OU
New-ADOrganizationalUnit -Name "IT" -Path "DC=yourdomain,DC=local"

# 2. Create test users in the new OU
New-ADUser -Name "John Doe" -SamAccountName jdoe -UserPrincipalName jdoe@yourdomain.local `
  -Path "OU=IT,DC=yourdomain,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
  -Enabled $true -ChangePasswordAtLogon $true

# 3. Enable basic audit policies
AuditPol /set /category:"Logon/Logoff" /success:enable /failure:enable
AuditPol /set /category:"Account Management" /success:enable /failure:enable
AuditPol /set /category:"Privilege Use" /success:enable /failure:enable
AuditPol /set /category:"System" /success:enable /failure:enable

Write-Host "User and audit policy configuration complete."
