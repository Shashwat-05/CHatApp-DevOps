#!/bin/bash

ansible -a"echo 'y'| kubeadm reset" slavenodes

ansible -a"rm -rf /etc/kubernetes/*" slavenodes

ansible -a"rm -rf $HOME/.kube" slavenodes

ansible -a"systemctl restart docker" slavenodes

ansible -a"systemctl restart kubelet" slavenodes
