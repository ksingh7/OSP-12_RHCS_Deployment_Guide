#!/bin/bash
## To Execute run
## sh run_sysbench_client_sweep.sh <run-id>
RUN=$1

for COUNT in {2..11}
do

  for test in write read
  do
    TEST=$test
    DIR1=run-$RUN-$TEST
    mkdir /tmp/$DIR1
    DIR2=`expr $COUNT - 1`-clients
    mkdir /tmp/$DIR1/$DIR2

    for ((i=2,j=$COUNT;i<=j;i++))
    do
       FILE=/tmp/$DIR1/$DIR2/server"$i"_"$TEST".log
       touch $FILE
       > $FILE
       sysbench oltp_"$TEST"_only --table_size=50000000  --mysql-host=server$i --mysql-db=sysbench --mysql-user=sysbench --mysql-password=secret --db-driver=mysql --mysql_storage_engine=innodb --percentile=99 --time=900 --threads=16  run  > $FILE &
    done

    sleep 1200
  done

done

## Read_Write Mix Test

for COUNT in {2..11}
do

  for test in read_write
  do
    TEST=$test
    DIR1=run-$RUN-$TEST
    mkdir /tmp/$DIR1
    DIR2=`expr $COUNT - 1`-clients
    mkdir /tmp/$DIR1/$DIR2

    for ((i=2,j=$COUNT;i<=j;i++))
    do
       FILE=/tmp/$DIR1/$DIR2/server"$i"_"$TEST".log
       touch $FILE
       > $FILE
       sysbench oltp_"$TEST" --table_size=50000000  --mysql-host=server$i --mysql-db=sysbench --mysql-user=sysbench --mysql-password=secret --db-driver=mysql --mysql_storage_engine=innodb --percentile=99 --time=900 --threads=16  run  > $FILE &
    done

    sleep 1200
  done

done
