#!/bin/bash
set -e
date
./revendor.sh
vagrant destroy -f
vagrant up
date
