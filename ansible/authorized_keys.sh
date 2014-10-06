# Vagrant provisioning script to use host id_rsa.pub
# and ssh directly to guest with vagrant ssh (needed to test ansible playbooks)
# e.g : ssh myapp.dev

echo 'Creation /root/.ssh/authorized_keys'
rm -rf /root/.ssh/authorized_keys
mv /home/vagrant/root_pubkey /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
rm -rf /home/vagrant/root_pubkey
echo 'Done creating keys'
