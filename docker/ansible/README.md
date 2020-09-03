# Ansible-Playground

## Setup

To begin running workflows from the docker environment we will need to update a few things.

### Hosts file

Update the port and host of the hosts file(seen below) to match your environment.

```
[csrt]
cb8a ansible_port=32208 ansible_host=cb8a.pok.stglabs.ibm.com 

[csrt:vars]
ansible_python_interpreter=/u/spark-common/Anaconda/bin/python
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

## Usage

## Single run

A single run will spin up a container just for an indivudal playbook. To preform this run:

```
docker-compose run ansible bash -c "ansible-playbook -i hosts ping.yml"
```

## Devlopment

Once the environment details have been updated run:

```
docker-compose up -d
```

This will create the image and run the container locally. To access the container run:


```
ssh ubuntu@0.0.0.0
```

The default password is: `Passw0rd!`

Once inside you will be located in the `/ansible` directory. This directory is a mounted volume, so any changes made in this repo will be updated in that directory. This allows for the development of the playbook in an isolated environment.

Once in the container you can run the playbook with:

```
ansible-playbook -i hosts ping.yml
```

