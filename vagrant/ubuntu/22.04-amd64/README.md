# Ansible

## Develop on a guest machine

```bash
vagrant ssh
```

Go to the ansible directory:

```bash
cd /vagrant/ansible
```

### Locale

Temporarily specify a locale:

```bash
export LC_ALL=C.UTF-8
```

### Check Ansible

```bash
ansible --version
```

If you see the error below, check if LC_ALL is set correctly.

> ansible --version
> ERROR: Ansible could not initialize the preferred locale: unsupported locale setting

### Validate the Ansible Playbook

```bash
ansible-playbook -c local -i localhost, --check --diff --verbose playbook.yaml
```

### Run the Ansible Playbook

```bash
ansible-playbook -c local -i localhost, playbook.yaml
```

