# Ansible role for Motion security camera daemon

## Description

Targeting Debian 11.

Install and configure [Motion](https://github.com/Motion-Project/motion) security camera daemon. Motion will be installed from your system repositories.

## Playbook

The example playbook `motion.yml` contains an example USB camera definition.

You can obtain usb-id's for your cameras from `/dev/v4l/by-id/`.

## Running

Ansible playbooks are executed with `ansible-playbook`

```sh
ansible-playbook -i inventory.ini motion.yml
```

## Configuration

This role contains a "hard-coded" `motion.conf` that is very specific to my use. It's rather likely that you want to customize things, such as the kind of cameras (Currently just USB) or the output format and framerate.
