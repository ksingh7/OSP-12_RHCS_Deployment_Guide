# OSP-12_RHCS_Deployment_Guide
Red Hat OpenStack Platform 12 and Red Hat Ceph Storage deploying guide 

```
sh deploy.sh
```

```
time openstack overcloud deploy \
   --templates /usr/share/openstack-tripleo-heat-templates \
   -r /home/stack/templates/roles_data.yaml \
   -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
   -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
   -e /home/stack/templates/overcloud_images.yaml \
   -e /home/stack/templates/network-environment.yaml \
   -e /home/stack/templates/global-config.yaml \
   -e /home/stack/templates/ceph-config.yaml > /tmp/overcloud.logs 2>&1
```
- Apply fix to BZ1566684
https://bugzilla.redhat.com/show_bug.cgi?id=1566684#c8

- If ``openstack hypervisor list`` does not show the list, try re-run ``sh deploy.sh``
  this will fix the race condition for nova containers and let the host discovery complete.

- Once you have a running stack, apply the first_stack which will create network and launch a instance
```
## Add Image
wget http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img
qemu-img convert -f qcow2 -O raw cirros-0.4.0-x86_64-disk.img cirros-0.4.0-x86_64-disk.raw
source ~/overcloudrc
openstack image create --disk-format raw --container-format bare --public cirros-0.4.0-x86_64 --file cirros-0.4.0-x86_64-disk.raw

## Create keypair
openstack keypair create admin-ssh-keypair > admin-ssh-keypair.pem ; chmod 600 admin-ssh-keypair.pem

openstack stack create -t overcloud-stacks/first_stack.yaml --wait --insecure first_stack
```
