#!/bin/bash
set -e

#mark start
sleep 5
touch tempfile
sleep 5

#run thing
bash /canu-1.3/Linux-amd64/bin/canu -p canu -d canu_out genomeSize=$1 "${@:2}"

#wrap up output and kick out tempfile
find . -mindepth 1 -newer tempfile -exec tar -rf FullOutput.tar {} \;
rm tempfile