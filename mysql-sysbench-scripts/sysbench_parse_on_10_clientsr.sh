#!/bin/bash

RUN=$1
TEST=$2

echo $2 "Total Transactions"

for i in {2..11} ; do FILE=/tmp/run-$RUN-$TEST/server"$i"_"$TEST"_test_"$RUN".log ; cat $FILE | egrep -i "transactions:|queries:|percentile:" | awk '{print $1,$2,$3}' | cut -d '(' -f 1 ; done | grep -i "transactions:" | cut -d ' ' -f 2

echo $2 "Total Queries"

for i in {2..11} ; do FILE=/tmp/run-$RUN-$TEST/server"$i"_"$TEST"_test_"$RUN".log ; cat $FILE | egrep -i "transactions:|queries:|percentile:" | awk '{print $1,$2,$3}' | cut -d '(' -f 1 ; done | grep -i "queries:" | cut -d ' ' -f 2

echo $2 "Avg Latency"
for i in {2..11} ; do FILE=/tmp/run-$RUN-$TEST/server"$i"_"$TEST"_test_"$RUN".log ; cat $FILE | egrep -i "transactions:|queries:|percentile:|avg:" | awk '{print $1,$2,$3}' | cut -d '(' -f 1 ; done | grep -i "avg:" | cut -d ' ' -f 2

echo $2 "P99 Latency"

for i in {2..11} ; do FILE=/tmp/run-$RUN-$TEST/server"$i"_"$TEST"_test_"$RUN".log ; cat $FILE | egrep -i "transactions:|queries:|percentile:" | awk '{print $1,$2,$3}' | cut -d '(' -f 1 ; done | grep -i "percentile:" | cut -d ' ' -f 3

