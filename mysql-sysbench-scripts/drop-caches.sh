#!/bin/sh
pssh -h /root/pssh-hosts 'sync ; echo 3 > /proc/sys/vm/drop_caches; touch /tmp/drop_caches;date >> /tmp/drop_caches'
