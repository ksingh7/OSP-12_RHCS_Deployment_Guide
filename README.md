# OSP-12_RHCS_Deployment_Guide
Red Hat OpenStack Platform 12 and Red Hat Ceph Storage deploying guide 

```
openstack overcloud deploy \
  --templates /usr/share/openstack-tripleo-heat-templates \
  -e /home/stack/templates/global-config.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
  -e /home/stack/templates/ceph-config.yaml \
  -r /home/stack/templates/roles_data.yaml  > overcloud.logs 2>&1
```
