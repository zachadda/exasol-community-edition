# Exasol Community Edition

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

## Steps for Installing the Exasol Community Edition

## Exasol Video Guides

### Community Edition Walk-through
[![Community Edition Walk-through](https://img.youtube.com/vi/DRziQydJHkw/0.jpg)](https://youtu.be/DRziQydJHkw)

### Windows Installation Guide
[![Virtualbox](https://img.youtube.com/vi/36KTaVo8Q4Q/0.jpg)](https://youtu.be/36KTaVo8Q4Q)

[![VMware Workstation](https://img.youtube.com/vi/byXpFSIpeLE/0.jpg)](https://youtu.be/byXpFSIpeLE)


### Mac Installation Guide
[![Mac VirtualBox](https://img.youtube.com/vi/jDLoh_asQGg/0.jpg)](https://youtu.be/jDLoh_asQGg)

[![Mac VMware Fusion Pro](https://i3.ytimg.com/vi/g8Sz0gFXO1w/hqdefault.jpg)](https://youtu.be/g8Sz0gFXO1w)




### 1. Install VMware Workstation/Fusion

VMware Workstation (for Windows/Linux) and VMware Fusion (for macOS) are hypervisors that allow you to run virtual machines. Follow the instructions below to install VMware for your operating system:

- **Windows**: Download and install [VMware Workstation](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Workstation%20Pro).
- **macOS**: Download and install [VMware Fusion](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Fusion).

For detailed installation instructions, refer to the [VMware documentation](https://docs.vmware.com/).

## 2. Download the Exasol Community Edition OVA File

Go to the [Exasol Community Edition download page](https://www.exasol.com/free-signup-community-edition/).

Download the OVA file to your local system. The file name will look something like: `Exasol_Community_Edition_v8.x.x.ova`

## 3. Import the OVA File into VMware Workstation/Fusion

### Open VMware Workstation/Fusion

Launch VMware Workstation (Windows/Linux) or VMware Fusion (macOS).

### Start the Import Process

1. Click on **File > Open** in the top menu.
2. Navigate to the location where you downloaded the OVA file.
3. Select the OVA file and click **Open**.

### Customize the Import Settings

Review the default settings for the virtual machine:

- **CPU and RAM**: If your host system allows, increase the vCPU and RAM for increased performance - otherwise leave the default settings (**4 vCPUs and 8 GB RAM**).
- **Virtual Disk**: Ensure the virtual disk is set to **Store as a single file** for optimal performance.

### Import the OVA

1. Click **Import** to begin the process.
2. Wait for VMware to import the OVA. This may take a few minutes.

### Verify the Import

Once the process is complete, the new virtual machine will appear in the VMware list.


## 4. Start the Virtual Machine

Once the import is complete, the new virtual machine will appear in the list of available VMs in VMware.

1. Select the VM and click **Power On**.
2. The VM will boot up, and it will automatically log in to the system.

If prompted to log in manually, use the following credentials:
- **Username**: `exasol`
- **Password**: `exasol`

### ⚠️ IMPORTANT: Update the Database IP Address

After the VM has fully booted, you **must** run the **Update IPs** desktop application to refresh the IP address of the Exasol database. This ensures that clients can connect using the latest network settings.

#### To update the IP:
1. Open the **Update IPs** application.
2. Wait until the script finishes.
3. Verify the displayed IP and confirm the update in the **DB Status Monitor**.

🚨 **Failure to complete this step may result in connection issues.** 🚨

## Notes

- If you encounter any issues during installation, refer to the [VMware documentation](https://docs.vmware.com/).
- Ensure your system meets the minimum requirements to run the Exasol Community Edition:
  - **4 vCPUs**
  - **8 GB RAM**

### 2. Install VirtualBox

VirtualBox is a hypervisor that allows you to run virtual machines. Follow the instructions below to install VirtualBox for your operating system:

- **Windows**: Download and install VirtualBox from the official website.
- **macOS**: Download and install the macOS package from the same VirtualBox website.
- **Linux**: Most Linux distributions provide VirtualBox through their package manager.

For detailed installation instructions, refer to the [VirtualBox documentation](https://www.virtualbox.org/manual/).

## 2. Download the Exasol Community Edition OVA File

Go to the [Exasol Community Edition download page](https://url-to-go-here).

Download the OVA file to your local system. The file name will look something like: Exasol_Community_Edition_v8.x.x.ova

## 3. Import the OVA File into VirtualBox

### Open VirtualBox

Launch VirtualBox on your system.

### Start the Import Process

1. Click on **File > Import Appliance** in the top menu.

### Choose the OVA File

1. In the **Appliance to Import** dialog, click **Choose File**.
2. Navigate to the location where you downloaded the OVA file.
3. Select the OVA file and click **Next**.

### Customize the Import Settings

Review the default settings for the virtual machine:

- **CPU and RAM**: If your host system allows, increase the vCPU and RAM for increased performance - otherwise leave the default settings (**4 vCPUs and 8 GB RAM**).


### Import the OVA

1. Click **Finish** to begin the process.
2. Wait for VirtualBox to import the OVA. This may take a few minutes.

### Verify the Import

Once the process is complete, the new virtual machine will appear in the VirtualBox list.

### Edit the VM Settings

Before starting the VM, update the following settings to ensure compatibility:

1. **Graphics Controller**: Set to **VMSVGA**.
2. **EFI Support**: Check **Enable EFI**.
3. **Boot Order**:
   - Uncheck **Floppy** and **Optical**.
   - Move **Hard Disk** to the top.
4. **Chipset**: Change to **ICH9**.

After making these changes, save the settings and proceed with starting the VM.


## 4. Start the Virtual Machine

Once the import is complete, the new virtual machine will appear in the list of available VMs in VirtualBox.

1. Select the VM and click **Start**.
2. The VM will boot up, and it will automatically log in to the system.

If prompted to log in manually, use the following credentials:
- Username: exasol
- Password: exasol

### ⚠️ IMPORTANT: Update the Database IP Address

After the VM has fully booted, you **must** run the **Update IPs** desktop application to refresh the IP address of the Exasol database. This ensures that clients can connect using the latest network settings.

#### To update the IP:
1. Open the **Update IPs** application.
2. Wait until the script finishes.
3. Verify the displayed IP and confirm the update in the **DB Status Monitor**.

🚨 **Failure to complete this step may result in connection issues.** 🚨


## Notes

- If you encounter any issues during installation, refer to the [VirtualBox documentation](https://www.virtualbox.org/manual/).
- Ensure your system meets the minimum requirements to run the Exasol Community Edition:
  - **4 vCPUs**
  - **8 GB RAM**

## Getting Started - Your First Query

### Using the database and running queries

### Open DbVisualizer

1. Double-click the **DbVisualizer** desktop icon to launch the application.

### Connect to the Exasol Database

1. From the **Database** tab, expand the **Exasol** database connection.
2. Ensure the connection is successful.

### Open the Scripts Tab

1. Navigate to the **Scripts** tab in DbVisualizer.

### Run the First Script

1. Open the script **`01 - TPC-H 1 GB Setup.sql`**.
2. Follow the directions outlined in the **SQL Worksheets**.
3. Once the first script is completed, close the **SQL Worksheet**.
4. Open the next script **`02 - TPC-H 1 GB Queries.sql`** and start querying!

### Note:

- The **DbVisualizer Community Edition** only allows for one **SQL Worksheet** to be open at a time.
- Sign up for the **Free 1-month Pro trial** to unlock more features.

## Starting the VM and Database Post Installation

### Start the Virtual Machine

1. Click **Start** in VirtualBox to boot the virtual machine.

### Database Auto-Start

- The **Exasol database** will start **automatically** when the VM finishes booting.
- No additional steps are required to start the database.

## Shutting Down the Database

When you are done working with the Exasol database:

1. Locate and run the **Shutdown DB and VM** desktop application.
2. This will safely shut down both the **Exasol database** and the **virtual machine**.

## Run Headless Database - No GUI

To run the Exasol database without a graphical interface:

### Start the VM in Headless Mode

1. Open **VirtualBox**.
2. Locate the **Exasol** virtual machine in the list.
3. Right-click on the virtual machine and select **Start > Headless Start**.
4. This will run the VM in the background without opening a GUI window.

### Install a Query Editor on Your Host Machine

- Install **DbVisualizer** or a similar **SQL query editor** on your host machine.
- Use it to connect to the Exasol database.

### Connect to the Database

Use the following connection details to access the **Exasol** database:
- Host: localhost
- Port: 8563


Ensure your query editor supports **JDBC** or **ODBC** connections.

### Interact with the VM via SSH

You can access the virtual machine directly using SSH on **port 2222**:

```sh
ssh exasol@localhost -p 2222
```
- Username: exasol
- Password: exasol

