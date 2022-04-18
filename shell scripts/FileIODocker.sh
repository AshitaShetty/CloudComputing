#!/bin/bash

file-test-mode='rndrw rndwr seqwr'
no_of_test=5
docker run --rm -it --entrypoint /bin/sh zyclonite/sysbench
for mode in $file-test-mode
do
	for((i = 1; i<=no_of_test; i++))
	do
		sysbench --test=fileio --file-total-size=500M prepare
		sysbench --test=fileio --file-total-size=500M --file-test-mode=$mode --max-time=20 --max-requests=0 run
		sysbench --test=fileio --file-total-size=500M cleanup
		echo Test $i docker
		sync && sudo purge
	done
done

