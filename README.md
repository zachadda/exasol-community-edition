# Exasol Community Edition

# Table of Contents

- [What is the Exasol Community Edition?](#what-is-the-exasol-community-edition)
- [Key Features](#key-features)
- [Limitations](#limitations)
- [Support](#support)
- [Requirements](#requirements)
- [Steps for Installing the Exasol Community Edition](#steps-for-installing-the-exasol-community-edition)
  - [Exasol Video Guides](#exasol-video-guides)
  - [Installing Exasol on VMware Workstation/Fusion](#installing-exasol-on-vmware-workstationfusion)
  - [Installing Exasol on VirtualBox](#installing-exasol-on-virtualbox)
- [Getting Started - Running Queries in Exasol](#getting-started---running-queries-in-exasol)
- [Managing the VM and Database](#managing-the-vm-and-database)
- [Running Exasol in Headless Mode](#running-exasol-in-headless-mode)


## What is the Exasol Community Edition?

The Community Edition is a fully functional Exasol v8 database, packaged for easy installation and use on a desktop or laptop environment. It is designed to give users a hands-on introduction to Exasol's high-performance capabilities in a non-production setting.

Go to the [Exasol Community Edition download page](https://www.exasol.com/free-signup-community-edition/).

## Key Features

- **Fully functioning Exasol v8 database**: Experience the core functionality of the Exasol database without restrictions on features.
- **Easy and secure installation**: Quickly set up Exasol on your desktop with minimal configuration.
- **Packaged as an Ubuntu OVA file**: Distributed in a convenient virtual machine format that runs seamlessly on VirtualBox or similar hypervisors.
- **Linux GUI environment**: Includes a pre-configured Linux GUI that runs the Exasol database and a SQL editor for seamless interaction.
- **Customizable resource allocation**: Allocate CPU and RAM according to the capabilities of your host system.
- **Getting started worksheets**: A set of pre-configured SQL worksheets to guide you through running your first queries.

## Limitations

- **200 GB RAW data limit**: Designed for testing and smaller-scale use cases, the Community Edition has a data storage limit of 200 GB.
- **Not suitable for production**: Intended for testing, learning, and non-production workloads only.
- **Shared system resources**: Exasol is designed to run on dedicated hardware. Since this is a virtual machine, it shares system resources with other applications, which may cause performance fluctuations, especially when running multiple workloads in parallel.


## Support

- **Community Edition**: This version of Exasol is provided as-is, without official support from Exasol. It is not intended for production use.
- **Exasol software**: The Exasol database engine included in the Community Edition is the same enterprise-grade software supported in production deployments. However, the specific packaging as a Community Edition OVA is not supported.
- **Production use**: For production workloads, please contact Exasol Sales to upgrade to a production-ready database with full support for enterprise environments.

## Requirements

To run the Community Edition, your system must meet the following minimum requirements:

- **Platform**: 64-bit x86 (not compatible with Mac M-series/ARM processors)
- **Disk**: 50GB
- **Processor**: 4 vCPUs (default: 8 vCPUs)
- **Memory**: 8 GB RAM (default: 16 GB RAM)
- **Hypervisor**: VMware Workstation Pro (Windows), VMware Fusion Pro (macOS), Oracle VirtualBox, or a similar virtualization platform

For improved performance, allocate more resources if your host system supports it. The default configuration uses 4 vCPUs and 8 GB RAM for a better experience.

# Steps for Installing the Exasol Community Edition

## Exasol Video Guides

### Community Edition Walk-through
[![Community Edition Walk-through](https://img.youtube.com/vi/DRziQydJHkw/0.jpg)](https://youtu.be/DRziQydJHkw)

### Windows Installation Guides
#### VirtualBox
[![Windows VirtualBox](https://img.youtube.com/vi/36KTaVo8Q4Q/0.jpg)](https://youtu.be/36KTaVo8Q4Q)

#### VMware Workstation
[![VMware Workstation](https://img.youtube.com/vi/byXpFSIpeLE/0.jpg)](https://youtu.be/byXpFSIpeLE)

### Mac Installation Guides
#### VirtualBox
[![Mac VirtualBox](https://img.youtube.com/vi/jDLoh_asQGg/0.jpg)](https://youtu.be/jDLoh_asQGg)

#### VMware Fusion Pro
[![Mac VMware Fusion Pro](https://i3.ytimg.com/vi/g8Sz0gFXO1w/hqdefault.jpg)](https://youtu.be/g8Sz0gFXO1w)

---

## Installing Exasol on VMware Workstation/Fusion

### 1. Install VMware Workstation/Fusion

VMware Workstation (for Windows) and VMware Fusion (for macOS) are hypervisors that allow you to run virtual machines.

- **Windows**: Download and install [VMware Workstation](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Workstation%20Pro).
- **macOS**: Download and install [VMware Fusion](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Fusion).

For detailed installation instructions, refer to the [VMware documentation](https://docs.vmware.com/).

### 2. Download the Exasol Community Edition OVA File

Go to the [Exasol Community Edition download page](https://www.exasol.com/free-signup-community-edition/) and download the OVA file.



### 3. Import the OVA File into VMware Workstation/Fusion

#### Open VMware Workstation/Fusion

Launch VMware Workstation (Windows) or VMware Fusion (macOS).

#### Start the Import Process

1. Click **File > Open**.
2. Navigate to the downloaded OVA file.
3. Select it and click **Open**.

#### Customize the Import Settings

- **CPU and RAM**: If your system allows, increase resources. The default is **4 vCPUs and 8 GB RAM**.

#### Import the OVA

1. Click **Import**.
2. Wait a few minutes for VMware to import the OVA.

### 4. Start the Virtual Machine

1. Select the VM in VMware and click **Power On**.
2. The VM will boot and automatically log in.

If prompted to log in manually:
- **Username**: `exasol`
- **Password**: `exasol`

#### ⚠️ IMPORTANT: Update the Database IP Address

Once the VM has booted, **run the Update IPs desktop application** to refresh the database IP.

1. Open **Update IPs**.
2. Wait for the script to finish.
3. Verify the IP in the **DB Status Monitor**.

🚨 **Skipping this step may cause connection issues.** 🚨

---

## Installing Exasol on VirtualBox

### 1. Install VirtualBox

VirtualBox is a hypervisor for running virtual machines.

- **Windows/macOS**: Download VirtualBox from the [official website](https://www.virtualbox.org/).
- **Linux**: Most Linux distributions provide VirtualBox through their package manager.

For detailed installation instructions, refer to the [VirtualBox documentation](https://www.virtualbox.org/manual/).

### 2. Download the Exasol Community Edition OVA File

Download the OVA file from the [Exasol Community Edition download page](https://www.exasol.com/free-signup-community-edition/).

### 3. Import the OVA File into VirtualBox

#### Open VirtualBox

Launch VirtualBox on your system.

#### Start the Import Process

1. Click **File > Import Appliance**.
2. Select the downloaded OVA file.
3. Click **Next**.

#### Customize the Import Settings

- **CPU and RAM**: If possible, increase resources (default: **4 vCPUs, 8 GB RAM**).

#### Import the OVA

1. Click **Finish** to begin the import.
2. Wait for VirtualBox to complete the process.

### 4. Edit the VM Settings

Before starting the VM, update the settings:

1. **Graphics Controller**: Set to **VMSVGA**.
2. **EFI Support**: Check **Enable EFI**.
3. **Boot Order**:
   - Uncheck **Floppy** and **Optical**.
   - Move **Hard Disk** to the top.
4. **Chipset**: Change to **ICH9**.

### 5. Start the Virtual Machine

1. Select the VM and click **Start**.
2. The VM will boot up and automatically log in.

If prompted to log in manually:
- **Username**: `exasol`
- **Password**: `exasol`

#### ⚠️ IMPORTANT: Update the Database IP Address

Once the VM has booted, **run the Update IPs desktop application**.

1. Open **Update IPs**.
2. Wait for the script to finish.
3. Verify the IP in the **DB Status Monitor**.

🚨 **Skipping this step may cause connection issues.** 🚨

---

## Getting Started - Running Queries in Exasol

### 1. Open DbVisualizer

1. Double-click the **DbVisualizer** desktop icon.
2. Expand the **Exasol** database connection.
3. Ensure the connection is successful.

### 2. Run Your First Query

1. Navigate to the **Scripts** tab.
2. Open the script **`01 - TPC-H 1 GB Setup.sql`** and follow the instructions.
3. Open **`02 - TPC-H 1 GB Queries.sql`** to run queries on the 1 GB dataset.
4. Open **`03 - TPC-H 10 GB Queries.sql`** to test queries on a larger dataset.

### Migrate Your Data to Exasol

After exploring the sample queries, navigate to the **Database Migration** folder to find scripts that help migrate data from various RDBMS systems to Exasol.

- Use the available migration scripts to recreate the source database schemas, tables, and import your data.
- Follow the instructions within the scripts for a smooth migration process.

This will help you get hands-on experience with **Exasol’s high-speed and easy migration capabilities**.


📌 **Note**: The **DbVisualizer Community Edition** allows only **one SQL Worksheet** at a time.  
You can register for a **free 1-month Pro trial** to unlock additional features.


---

## Managing the VM and Database

### Starting the VM and Database

1. Open **VirtualBox** or **VMware**.
2. Select the **Exasol VM** and click **Start**.
3. The **Exasol database** starts **automatically** when the VM boots.

### Shutting Down the Database

1. Run the **Shutdown DB and VM** desktop application.
2. This safely shuts down **both** the database and VM.

---

## Running Exasol in Headless Mode

If you don’t need the GUI:

### 1. Start the VM in Headless Mode

1. Open **VirtualBox**.
2. Right-click the Exasol VM and select **Start > Headless Start**.

### 2. Install a Query Editor on Your Host Machine

Install **DbVisualizer** or a **SQL editor** on your host machine.

### 3. Connect to the Database

Use the following details:
- **Host**: `localhost`
- **Port**: `8563`

Ensure your query editor supports **JDBC** or **ODBC**.

### 4. Access the VM via SSH

To connect directly via SSH:

```sh
ssh exasol@localhost -p 2222
```
- Username: exasol
- Password: exasol

