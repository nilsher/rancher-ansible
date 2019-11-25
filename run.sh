#!/bin/bash

ansible-playbook  -i rancher-nodes playbook-prep-rancher.yml $@
