# Packer Azure Ansible

This repo uses HCL instead of JSON templates to manage the packer build process. HCL provides greater control on dynamic logic for building different images. For the installation and configuration of the VM, Packer uses Ansible. Instead of the Ansible provisioner, this pattern uses Docker as the Ansible run time environment to invoke the playbook.

![build process](assets/build_process.png)

## Environment Variable

These are the environment variables to set before executing the Packer process. Some variables are required for specific builders and there are columns indicating which ones.

| Variable                                  | Required   | Default Value               | Description                                                                                                                  |
| ----------------------------------------- | ---------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| PKR_VAR_client_id                         | N          |                             | Access key for AWS and client id for Azure.                                                                                  |
| PKR_VAR_client_secret                     | N          |                             | Secret key for AWS and client secret for Azure.                                                                              |
| PKR_VAR_docker_environment_variable       | N          |                             | Environment variable used by docker. Format is '--env COOL_VAR1=VALUE1 --env COOL_VAR2=VALUE2'                               |
| PKR_VAR_docker_image_name                 | Y          |                             | Docker image with the Ansible runtime environment.                                                                           |
| PKR_VAR_docker_mounted_volume             | N          |                             | Mount volumes needed to support the Ansible playbook process.                                                                |
| PKR_VAR_git_code_version                  | Y          | master                      | Code version to use (branch or tag).                                                                                         |
| PKR_VAR_git_url                           | Y          |                             | Git repo URL.                                                                                                                |
| PKR_VAR_image_name                        | Y          | packer                      | Image name.                                                                                                                  |
| PKR_VAR_image_version                     | Y          | 0.0.0                       | Image semantic version built.                                                                                                |
| PKR_VAR_location                          | Y          | westus2                     | The location for Azure.                                                                                                      |
| PKR_VAR_managed_image_resource_group_name | Y          | packer-build-rg             | Resource group to store the image.                                                                                           |
| PKR_VAR_os_disk_size_gb                   | Y          | 50                          | Azure this is a number value representing GB.                                                                                |
| PKR_VAR_os_name                           | Y          | centos7-8                   | The OS name the packer build process create image from. Acceptable values centos7-8, centos8-2, debian9-13, and debian10-05. |
| PKR_VAR_ssh_password                      | Y          | vagrant                     | Password to use.                                                                                                             |
| PKR_VAR_ssh_username                      | Y          | vagrant                     | Username to use.                                                                                                             |
| PKR_VAR_subscription_id                   | Y          |                             | Azure subscription ID.                                                                                                       |
| PKR_VAR_tenant_id                         | N          |                             | Azure tenant ID.                                                                                                             |
| PKR_VAR_vm_size                           | Y          | Standard_D4a_v4             | VM Size for Azure.                                                                                                           |

## Make Targets

Make file is used to manage the commands used for building images using packer. The goal of make targets is to simplify the automation commands used.

### `make azure-machine-image`

This make target builds Azure machine images and below are an example set of commands to execute.

```bash
$ export PKR_VAR_git_code_version=1.0.0
$ export PKR_VAR_git_url=https://github.com/bryannice/ansible-playbook-denodo-solution-manager.git
$ export PKR_VAR_image_description="Packer Build Image"
$ export PKR_VAR_image_name=packer-build-image
$ export PKR_VAR_image_version=1.0.0
$ export PKR_VAR_location="westus2"
$ export PKR_VAR_managed_image_resource_group_name=packer-build-rg
$ export PKR_VAR_os_disk_size_gb=50
$ export PKR_VAR_os_name=centos7-8
$ export PKR_VAR_subscription_id=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
$ export PKR_VAR_vm_size=Standard_D4a_v4
$ make azure-machine-image
```

### `make clean`

Removes the cache folders and output folder generated by the packer build process.

## HCL Code Organization

- Packer leverages Go Lang's natural file block mechanism.
- The main file blocks are
    - Variables: used to expose inputs to the build process when it is invoked.
    - Locals: private variables and logic within the build process.
    - Sources: the builder type.
        - Amazon
        - Azure
        - VirtualBox
        - VMWare
        - Etc.
    - Builds: the builder logic referencing configurations defined in sources and apply provisioner logic.

![HCL Code Organization](assets/hcl_code_organization.png)

## Build Process Sequence

![sequence diagram](assets/sequence_diagram.png)

## License

[GPLv3](LICENSE)

## References

* [Markdownlint](https://dlaa.me/markdownlint/) used to verify markdowns follow good formatting standards.
* [Software installed on GitHub-hosted runners](https://github.com/actions/virtual-environments/blob/master/images/linux/Ubuntu2004-README.md)
* [Debian ISO Download](https://cdimage.debian.org/cdimage/archive/)
* [Centos ISO Download](https://www.centos.org/download/)
