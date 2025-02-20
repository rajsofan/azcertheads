# Azure Certification Lab Infrastructure

This repository contains Terraform configurations for setting up an Azure lab environment. The infrastructure includes resource groups, virtual networks (VNets), subnets, proximity placement groups (PPGs), availability sets, virtual machines (VMs), and an Azure Bastion host.

## Modules

The repository is organized into several modules, each responsible for a specific part of the infrastructure:

1. **Resource Group Module**
   - Creates a resource group for the lab environment.

2. **Virtual Network (VNet) Module**
   - Creates a virtual network with the specified address space.

3. **Subnets Module**
   - Creates subnets within the virtual network.

4. **Proximity Placement Group (PPG) Module**
   - Creates a proximity placement group for the virtual machines.

5. **Availability Set Module**
   - Creates an availability set for the virtual machines.

6. **Linux Virtual Machine Module**
   - Creates Linux virtual machines with managed disks and attaches the disks to the VMs.

7. **Bastion Service Module**
   - Deploys an Azure Bastion host for secure remote access to the virtual machines.

## Usage

To use this repository, follow these steps:

1. **Clone the Repository**

   ```sh
   git clone https://github.com/rajsofan/azcertheads.git
   cd azcertheads