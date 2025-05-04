## 🌐 Phase 1: Environment Setup

This section covers the initial setup of a hybrid lab environment consisting of a **local Ubuntu 20.04 VM** and a **Windows Server 2019 EC2 instance** hosted on AWS. This foundation simulates a real-world hybrid infrastructure.

### 💻 Local Machine: Ubuntu 20.04 VM (Linux Server)

### 1. Install VirtualBox and Download Ubuntu ISO

* [📅 Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [📅 Download Ubuntu Server 20.04 LTS ISO](https://releases.ubuntu.com/20.04/)
    - ubuntu-20.04.6-desktop-amd64.iso

### 2. Create the Virtual Machine

Configure the VM with the following minimum specs:

* **2 GB RAM**
* **20 GB storage**
* **Networking**: Use **Bridged Adapter** (preferred) or **NAT** for SSH access

### 3. Install Ubuntu OS

* Proceed with the default server installation steps
* Create a non-root user (e.g., `samantha`) with `sudo` privileges

### 4. Enable and Verify SSH Access

```
sudo apt update
sudo apt install openssh-server -y
sudo systemctl status ssh
```

> ✅ Your Ubuntu server is now ready for hardening and monitoring.


### ☁️ Cloud: Windows Server 2019 on AWS EC2

### 1. Launch a Windows EC2 Instance

* Open the [AWS EC2 Console](https://console.aws.amazon.com/ec2)
* Select:

  * **AMI**: *Windows Server 2019 Base*
  * **Instance Type**: `t2.micro` (Free Tier eligible)
  * **Key Pair**: Use an existing one or create a new `.pem` file
  * **Security Group**: Allow **RDP (port 3389)** only from your IP

### 2. Connect via Remote Desktop (RDP)

* After the instance launches:

  * Wait 4–5 minutes for initialization
  * Retrieve the **Administrator password** using your key pair
* Connect via Remote Desktop:

  * **IP**: Your EC2 public IPv4 address
  * **Username**: `Administrator`
  * **Password**: From AWS Console (decrypted using your key)

> ✅ You now have a Windows Server environment ready for domain controller and Group Policy configuration.

### 🔁 Next Steps

| Machine            | Upcoming Tasks                                            |
| ------------------ | --------------------------------------------------------- |
| **Ubuntu VM**      | SSH hardening, UFW firewall, Fail2Ban, audit logging      |
| **Windows Server** | Install Active Directory, configure GPOs, enable auditing |

> 🗱️ This hybrid setup simulates core responsibilities of system administrators and security engineers in a cross-platform enterprise environment.
