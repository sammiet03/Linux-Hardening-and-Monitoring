## ✅ Phase 4: Validation, Monitoring, and Finalization

This final phase ensures your hardened environments are functioning as expected, logs are being generated and collected, and all configurations are properly documented. You can also integrate optional monitoring tools to further enhance your hybrid lab.


### 1. 🔍 Validate Security Configurations

### 🧪 Test Windows GPOs and Audit Logs

* **Login Failures:** Attempt incorrect logins to trigger events
* **Screen Lock:** Wait for screen saver lock and resume
* **Removable Media:** Attempt USB usage if allowed, check event logs
* **Audit Logs:** Open Event Viewer and check under `Windows Logs > Security`

Example PowerShell to review logs:

```
Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4625 }  # Failed logon
Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4720 }  # User created
```

#### 🧪 Test Linux Hardening

* SSH as a non-root user
* Attempt root login (should fail if disabled)
* Check logs:

```
tail -n 100 /var/log/auth.log
sudo journalctl -u fail2ban
```

### 2. 📊 Optional: Add Monitoring Integration

### 🚀 Send Windows Logs to Microsoft Sentinel

* Use custom Python script with Azure Monitor HTTP Data Collector API
* Ensure logs contain `TimeGenerated` field

### 🚀 Send Linux Logs to Central Platform

* Optionally use Filebeat or rsyslog to forward logs
* Or manually export key logs for review


### 3. 📸 Capture Evidence for Portfolio

Include the following in screenshots:

* Windows: AD structure, GPO config, Event Viewer
* Linux: SSH config, `ufw status`, Fail2Ban log entries
* Terminal commands showing log outputs

### 4. 💾 Back Up and Export Configurations

### ✅ Export GPO Settings

```
Backup-GPO -Name "Default Domain Policy" -Path C:\GPOBackups
```

### ✅ Backup Sysmon or Fail2Ban Config

```
sudo cp /etc/fail2ban/jail.local ~/backup/
sudo cp /etc/ufw/ufw.conf ~/backup/
```

### 5. 🧼 Cleanup and Cost Optimization

* Stop AWS EC2 instance to avoid costs
* Compress large log files for archival
* Rotate or revoke any exposed credentials
* Delete unused VM snapshots or AMIs


### ✅ Final Notes

| Task                      | Status      |
| ------------------------- | ----------- |
| Hardened Linux VM         | ✅ Complete  |
| Hardened Windows EC2      | ✅ Complete  |
| GPO and AD configuration  | ✅ Applied   |
| Audit Policies Enabled    | ✅ Verified  |
| Logs Reviewed             | ✅ Logged    |
| Optional Monitoring Setup | 🔄 Optional |

> 🎉 You now have a complete hybrid security lab simulating real-world system hardening, logging, and audit practices.

### 🧩 Optional Final Enhancements

| Enhancement            | Description                                               |
| ---------------------- | --------------------------------------------------------- |
| 📊 Centralized Logging | Send logs from both machines to ELK/Graylog/Wazuh         |
| 📁 GitHub Repo         | Organize project into a public repo with docs/screenshots |
| ⚙️ Automation          | Use Ansible (Linux) or PowerShell DSC (Windows)           |
| 🧪 Simulated Attacks   | Show before/after logs from attack simulation             |
| 📄 Resume Bullet       | Extract a concise bullet point for your resume            |
