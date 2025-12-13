#!/bin/bash
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-master1.home.agent-est.com'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-master2.home.agent-est.com'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker1.home.agent-est.com'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker2.home.agent-est.com'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker3.home.agent-est.com'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker4.home.agent-est.com'

ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-master1'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-master2'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker1'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker2'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker3'
ssh-keygen -f '/home/apeku/.ssh/known_hosts' -R 'kube-worker4'
