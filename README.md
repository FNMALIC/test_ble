# test_ble

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,

1
samples, guidance on mobile development, and a full API reference.
auditpol /get /category:*

2
gpmc.msc

3.
(Get-Acl -Path "C:\Partage\Formateurs" -Audit).Audit | Format-Table -AutoSize

4.
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 5 -ErrorAction SilentlyContinue | Format-List

5.
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4720,4738} -MaxEvents 5 -ErrorAction SilentlyContinue | Format-List

6.
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4663} -MaxEvents 5 -ErrorAction SilentlyContinue | Format-List

7. 
Get-Content "C:\Security-Audit-Report.txt"


8.
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName | Format-Table -AutoSize
Get-ADUser -Filter * -SearchBase "OU=Utilisateurs,OU=Formation,DC=formation,DC=local" | Format-Table Name, Enabled
Get-ADGroup -Filter * -SearchBase "OU=Utilisateurs,OU=Formation,DC=formation,DC=local" | Format-Table Name

9.
Get-SmbShare | Format-Table Name, Path, Description
Get-SmbShareAccess -Name "Formateurs"
Get-SmbShareAccess -Name "Finance"

10.
Get-DhcpServerv4Scope
Get-DhcpServerv4Lease -ScopeId 192.168.10.0

11.

nslookup formation.local
dcdiag
