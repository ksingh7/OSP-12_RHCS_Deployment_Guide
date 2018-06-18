#!/bin/bash

RUN=$1

########### Write Test ############

TEST=write

mkdir /tmp/run-$RUN-$TEST ;
for i in {2..11} ; do FILE=/tmp/run-$RUN-$TEST/server"$i"_"$TEST"_test_"$RUN".log ; touch $FILE ; > $FILE ; sysbench oltp_"$TEST"_only --table_size=50000000  --mysql-host=server$i --mysql-db=sysbench --mysql-user=sysbench --mysql-password=secret --db-driver=mysql --mysql_storage_engine=innodb --percentile=99 --time=900 --threads=16  run  > $FILE & done ;
ps -ef | grep -i sysbench ;

############ Read Test ############

sleep 1200 ;

TEST=read

mkdir /tmp/run-$RUN-$TEST ;

for i in {2..11} ; do FILE=/tmp/run-$RUN-$TEST/server"$i"_"$TEST"_test_"$RUN".log ; touch $FILE ; > $FILE ; sysbench oltp_"$TEST"_only --table_size=50000000  --mysql-host=server$i --mysql-db=sysbench --mysql-user=sysbench --mysql-password=secret --db-driver=mysql --mysql_storage_engine=innodb --percentile=99 --time=900 --threads=16  run  > $FILE & done ;

ps -ef | grep -i sysbench ;

############ Read-Write Test ############

sleep 1200 ;

TEST=read-write

mkdir /tmp/run-$RUN-$TEST ;

for i in {2..11} ; do FILE=/tmp/run-$RUN-$TEST/server"$i"_"$TEST"_test_"$RUN".log ; touch $FILE ; > $FILE ; sysbench oltp_read_write --table_size=50000000  --mysql-host=server$i --mysql-db=sysbench --mysql-user=sysbench --mysql-password=secret --db-driver=mysql --mysql_storage_engine=innodb --percentile=99 --time=900 --threads=16  run  > $FILE & done ;

ps -ef | grep -i sysbench
