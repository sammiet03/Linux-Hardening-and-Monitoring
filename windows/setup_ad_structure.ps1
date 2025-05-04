# Import AD module (should be installed via RSAT)
Import-Module ActiveDirectory

# --- 1. Create Organizational Units ---
New-ADOrganizationalUnit -Name "Users" -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -Name "Groups" -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -Name "Computers" -Path "DC=corp,DC=local"

# --- 2. Create a Group ---
New-ADGroup -Name "IT Admins" -GroupScope Global -GroupCategory Security -Path "OU=Groups,DC=corp,DC=local"

# --- 3. Create a User ---
New-ADUser `
  -Name "John Doe" `
  -GivenName "John" `
  -Surname "Doe" `
  -SamAccountName "jdoe" `
  -UserPrincipalName "jdoe@corp.local" `
  -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
  -Enabled $true `
  -Path "OU=Users,DC=corp,DC=local"

# --- 4. Add User to Group ---
Add-ADGroupMember -Identity "IT Admins" -Members "jdoe"
