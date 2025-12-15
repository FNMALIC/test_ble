# test_ble

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Correct way - using enum types
$acl = Get-Acl "C:\Partage\Formateurs"

$auditRule = New-Object System.Security.AccessControl.FileSystemAuditRule(
    "Everyone",
    [System.Security.AccessControl.FileSystemRights]::FullControl,
    ([System.Security.AccessControl.InheritanceFlags]::ContainerInherit -bor [System.Security.AccessControl.InheritanceFlags]::ObjectInherit),
    [System.Security.AccessControl.PropagationFlags]::None,
    ([System.Security.AccessControl.AuditFlags]::Success -bor [System.Security.AccessControl.AuditFlags]::Failure)
)

$acl.SetAuditRule($auditRule)
Set-Acl -Path "C:\Partage\Formateurs" -AclObject $acl

# Verify audit settings
(Get-Acl -Path "C:\Partage\Formateurs" -Audit).Audit | Format-Table -AutoSize
