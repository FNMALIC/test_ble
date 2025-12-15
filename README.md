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


# View all security events for analysis
Write-Host "=== FAILED LOGON ATTEMPTS (Event ID 4625) ===" -ForegroundColor Red
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 10 -ErrorAction SilentlyContinue | Format-Table TimeCreated, Id, Message -Wrap

Write-Host "`n=== SUCCESSFUL LOGON (Event ID 4624) ===" -ForegroundColor Green
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} -MaxEvents 10 -ErrorAction SilentlyContinue | Format-Table TimeCreated, Id, Message -Wrap

Write-Host "`n=== ACCOUNT MANAGEMENT (Event ID 4720-4738) ===" -ForegroundColor Cyan
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4720,4722,4724,4725,4726,4738} -MaxEvents 10 -ErrorAction SilentlyContinue | Format-Table TimeCreated, Id, Message -Wrap

Write-Host "`n=== FILE ACCESS (Event ID 4663) ===" -ForegroundColor Magenta
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4663} -MaxEvents 10 -ErrorAction SilentlyContinue | Format-Table TimeCreated, Id, Message -Wrap

Write-Host "`n=== SHARE ACCESS (Event ID 5140, 5145) ===" -ForegroundColor Yellow
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=5140,5145} -MaxEvents 10 -ErrorAction SilentlyContinue | Format-Table TimeCreated, Id, Message -Wrap

Write-Host "`n=== AD CHANGES (Event ID 5136-5139) ===" -ForegroundColor Red
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=5136,5137,5138,5139} -MaxEvents 10 -ErrorAction SilentlyContinue | Format-Table TimeCreated, Id, Message -Wrap


# Generate comprehensive report
$report = @"
========================================
SECURITY AUDIT ANALYSIS REPORT
Generated: $(Get-Date)
Domain: formation.local
========================================

SCENARIO 1: FAILED LOGON ATTEMPTS
Event ID: 4625
Risk: Brute force attack or unauthorized access
Corrective Measures:
- Implement account lockout policy
- Enable MFA
- Monitor repeated failures
- IP blocking for repeated offenders

SCENARIO 2: UNAUTHORIZED FILE ACCESS
Event ID: 4656, 4663 (Access Denied)
Risk: Privilege escalation attempt
Corrective Measures:
- Review NTFS permissions
- Principle of least privilege
- Regular access audits
- Investigate suspicious activity

SCENARIO 3: ACCOUNT MODIFICATIONS
Event ID: 4720, 4738, 4726
Risk: Unauthorized account creation/backdoor
Corrective Measures:
- Restrict account creation permissions
- Approval workflow for new accounts
- Alert on off-hours account changes
- Regular audit of new accounts

========================================
"@

$report | Out-File "C:\Security-Audit-Report.txt"
Get-Content "C:\Security-Audit-Report.txt"
