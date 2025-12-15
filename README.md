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



# Add Administrator to GRP-Formateurs group
Add-ADGroupMember -Identity "GRP-Formateurs" -Members "Administrator"

# Test access
Test-Path "\\srv-ad-01\Formateurs"
New-Item -Path "\\srv-ad-01\Formateurs\audit-test.txt" -ItemType File -Force
"Test content" | Set-Content "\\srv-ad-01\Formateurs\audit-test.txt"
Get-Content "\\srv-ad-01\Formateurs\audit-test.txt"
Remove-Item "\\srv-ad-01\Formateurs\audit-test.txt" -Force
