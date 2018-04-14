#!/bin/bash
source ~/stackrc
time openstack overcloud deploy \
   --templates /usr/share/openstack-tripleo-heat-templates \
   -r /home/stack/templates/roles_data.yaml \
   -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
   -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
   -e /home/stack/templates/overcloud_images.yaml \
   -e /home/stack/templates/network-environment.yaml \
   -e /home/stack/templates/global-config.yaml \
   -e /home/stack/templates/ceph-config.yaml > /tmp/overcloud.logs 2>&1
