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


# As Administrator or jean.dupont
Test-Path "\\srv-ad-01\Formateurs"
New-Item -Path "\\srv-ad-01\Formateurs\audit-test.txt" -ItemType File
Get-Content "\\srv-ad-01\Formateurs\audit-test.txt"
Remove-Item "\\srv-ad-01\Formateurs\audit-test.txt"

# Try to access as marie.martin (should fail)
Test-Path "\\srv-ad-01\Formateurs"

# View file access events
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4663} -MaxEvents 20 | Format-Table TimeCreated, Message -Wrap

# View file access attempts (including denied)
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4656,4663,5140,5145} -MaxEvents 20
