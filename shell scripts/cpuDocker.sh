#!/bin/bash

primes='10000 20000 50000'
no_of_test=5

for prime in $primes;
do
	for((i =1; i<=no_of_test; i++))
	do
		docker run --rm zyclonite/sysbench --test=cpu --cpu-max-prime=$prime run
		echo Test $i in Docker done
	done
done
