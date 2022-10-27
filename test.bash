#!/bin/bash

out=$(seq 5 | ./plus)

[ "${out}" = 14 ]
