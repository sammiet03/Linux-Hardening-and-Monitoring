## 🛡️ Cross-Platform System Hardening and Monitoring Lab (Linux + Windows)

This lab demonstrates how to secure and monitor both Linux (Ubuntu 20.04) and Windows Server 2019 environments — simulating a hybrid infrastructure common in enterprise IT and security operations.

It reflects real-world responsibilities of system administrators, cloud engineers, and security analysts by showcasing endpoint hardening, user and authentication policy enforcement, and log monitoring on both platforms.

### 🧰 Project Overview

| Component         | Platform        | Description                                                |
| ----------------- | --------------- | ---------------------------------------------------------- |
| 🔐 Linux Server   | Ubuntu 20.04    | Hardened with SSH configs, UFW, Fail2Ban, auditd, logwatch |
| 🔐 Windows Server | Server 2019 EC2 | Hardened with AD DS, GPOs, audit policies, firewall rules  |

### 📄 Documentation
| Phase       | Description                                               |
| ----------- | --------------------------------------------------------- |
| **Phase 1** | [Environment Setup](https://github.com/sammiet03/Linux-Hardening-and-Monitoring/blob/main/documentation/PHASE1_ENVIRONMENT.md)          |
| **Phase 2** | [Linux server hardening](https://github.com/sammiet03/Linux-Hardening-and-Monitoring/blob/main/documentation/PHASE2_LINUX_HARDENING.md) |
| **Phase 3** | [Windows hardening](https://github.com/sammiet03/Linux-Hardening-and-Monitoring/blob/main/documentation/PHASE3_WINDOWS_HARDENING.md)    |
| **Phase 4** | [Validation](https://github.com/sammiet03/Linux-Hardening-and-Monitoring/blob/main/documentation/PHASE4_VALIDATION.MD)    |


### 🧑‍💻 Environment Details

* **Linux Host:** Ubuntu 20.04 LTS (VirtualBox VM)
* **Windows Host:** Windows Server 2019 (t2.micro EC2, AWS Free Tier)
* **Networking:** SSH for Linux, RDP for Windows
* **Scope:** Hardening, logging, and monitoring


### 🔧 Linux Hardening (Local VM)

### 1. SSH & User Security

* Disabled `PermitRootLogin` and `PasswordAuthentication` in `/etc/ssh/sshd_config`
* Enforced SSH key-based login and created a non-root sudo user

### 2. UFW Firewall Configuration

```
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw enable
```

### 3. Unattended Security Updates

```
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

### 4. Intrusion Prevention (Fail2Ban)

* Installed `fail2ban`
* Configured SSH protection in `/etc/fail2ban/jail.local`

### 5. System Activity Monitoring

* Installed and enabled `auditd` for login and file access monitoring
* Installed `logwatch` for daily email reports (cron-scheduled)


### 🪟 Windows Server Hardening (AWS EC2)

### ✅ Active Directory Setup

* Installed AD DS role and promoted the EC2 to a domain controller
* Created OUs, users, and groups for policy testing

### ✅ GPO Security Policies Applied

* Password complexity and expiration
* Account lockout thresholds
* Disable USB device usage
* Screen lock timeout and RDP restrictions

### ✅ Audit Policy Configuration

Enabled auditing for:

* Logon/logoff events
* Account management
* Object access

### ✅ Windows Defender & Firewall

* Enabled real-time protection
* Configured inbound/outbound firewall rules


### 🗂️ Project Architecture Diagram

This lab simulates a hybrid IT environment with a hardened Ubuntu server running locally and a Windows Server 2019 instance deployed in the AWS cloud.

```
+------------------------+            +----------------------------+
|  Local Machine (VM)    |            |      AWS EC2 Instance      |
|  --------------------  |            |  ------------------------  |
|  Ubuntu 20.04 Server   |  <------>  |    Windows Server 2019     |
|  - SSH hardened        |    RDP     |  - AD DS, GPOs applied     |
|  - UFW firewall        |   / SSH    |  - Audit policies enabled  |
|  - Fail2Ban / auditd   |            |  - Firewall configured     |
|  - Logwatch reports    |            |                            |
+------------------------+            +----------------------------+
```


### 📂 Project Structure

```
cross-platform-hardening/
├── linux/
│   ├── scripts/
│   ├── config/
│   └── screenshots/
├── windows/
│   ├── gpo-backups/
│   ├── powershell-scripts/
│   └── screenshots/
└── README.md
```

### 📌 Key Takeaways

* Hardened Linux and Windows servers in a hybrid environment
* Enforced security policies using GPOs and SSH/UFW configurations
* Configured automated log monitoring and reporting tools
* Practiced real-world security operations and IT system management tasks


### 💡 Future Enhancements

* Forward logs to a centralized SIEM (e.g., ELK, Wazuh, or Graylog)
* Automate hardening using Ansible (Linux) and PowerShell DSC (Windows)
* Simulate additional attack scenarios and correlate logs
* Integrate detection rules and alerting (via SIEM or email notifications)

