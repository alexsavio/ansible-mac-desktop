# ansible-mac-desktop

Provisioner for my profesional/personal Mac OS Desktop.

## Preparation

Activate your Python environment, and then:

```bash
make deps/install-dev
```

## Customize

Edit:
- `default.config.yml` file for packages and data sources you want.
- `host.yml` with the IP address of your Mac (or set localhost if you plan to run it locally.)

## Launch

In order to Ansible find the python3-apt installation,
the Makefile downloads the .deb file and unpacks it into your Python environment.

A `playbook` script entry is set in the Pipfile:

```bash
ansible-playbook -K --extra-vars '@group_vars/laptops/ma/vars.yml' playbook.yml
```
