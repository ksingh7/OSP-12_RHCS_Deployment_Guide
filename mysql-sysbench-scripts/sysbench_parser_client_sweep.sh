#!/bin/bash
## To Execute run
## sh sysbench_parser_client_sweep.sh <run-id> <test type: write/read/read_write> <filter: transactions/queries/avg/percentile>

RUN=$1
TEST=$2

touch /tmp/results.out
> /tmp/results.out

for COUNT in {2..11}
do
        for test in $TEST
        do
                TEST=$test
                DIR1=run-$RUN-$TEST
                DIR2=`expr $COUNT - 1`-clients
                cd /tmp/$DIR1/$DIR2

                if [ "$3" != "percentile" ]
                then

                for filter in $3
                do
                        echo $TEST "Total $filter" ":" "Server" $(expr $COUNT - 1) >> /tmp/results.out
                        for file in $(ls)
                        do
                                FILE=$file
                                cat $FILE | egrep -i "transactions:|queries:|avg:" | awk '{print $1,$2,$3}' | cut -d '(' -f 1 | grep -i "$filter": | cut -d ' ' -f 2 >> /tmp/results.out
                        done
                done
              #  if  [ "$3" = "percentile" ]
#               then
                else

                for filter in percentile
                do
                        echo $TEST "Total $filter" ":" "Server" $(expr $COUNT - 1) >> /tmp/results.out
                        for file in $(ls)
                        do
                                FILE=$file
                                cat $FILE | egrep -i "percentile:" | awk '{print $1,$2,$3}' | cut -d '(' -f 1 | grep -i "$filter": | cut -d ' ' -f 3 >> /tmp/results.out
                        done
                done
                fi

        done
done
echo "For results execute : less /tmp/results.out"
