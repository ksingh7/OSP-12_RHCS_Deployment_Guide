# OSP-12_RHCS_Deployment_Guide
Red Hat OpenStack Platform 12 and Red Hat Ceph Storage deploying guide 


```
openstack overcloud deploy \
  --templates /usr/share/openstack-tripleo-heat-templates \
  -r /home/stack/templates/roles_data.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
  -e /home/stack/templates/global-config.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /home/stack/templates/ceph-config.yaml > overcloud.logs 2>&1
```
