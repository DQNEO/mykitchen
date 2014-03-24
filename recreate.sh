#!/bin/bash
set -e
date
./revendor.sh
vagrant destroy -f
sleep 20
vagrant up
date
