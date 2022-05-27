$ADObject        = 'AD:CN=AdminSDHolder,CN=System,DC=DOMAIN,DC=COM'
$ACL             = Get-ACL $ADObject
 
$ADGroup         = Get-ADgroup 'ADGROUPNAMEHERE'
$SID             = New-Object System.Security.Principal.SecurityIdentifier $ADGroup.SID
$ObjectGUID      = New-Object Guid 00fbf30c-91fe-11d1-aebc-0000f80367c1 # schemaIDGuid for Alt-Security-Identities or what ever attribute you need
$Identity        = [System.Security.Principal.IdentityReference] $SID
$ADRights        = [System.DirectoryServices.ActiveDirectoryRights] "ReadProperty","WriteProperty"
$Type            = [System.Security.AccessControl.AccessControlType] "Allow"
$InheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance] "None"
$ACE             = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $Identity,$ADRights,$Type,$ObjectGUID,$InheritanceType
$ACL.AddAccessRule($ACE)
 
Set-ACL -ACLObject $ACL -Path $ADObject

#Thanks to @froxxon for working code
