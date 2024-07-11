#! /bin/bash
cat /home/vagrant/.ssh/id_rsa.pub >> "/home/vagrant/.ssh/authorized_keys"
cat /home/vagrant/.ssh/id_rsa.pub >> "/root/.ssh/authorized_keys"
chmod 644 /home/vagrant/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
