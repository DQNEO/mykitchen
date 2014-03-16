#!/bin/bash
set -e
rm cookbooks -rf
rm Berksfile.lock
berks vendor cookbooks
