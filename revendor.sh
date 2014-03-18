#!/bin/bash
set -e
rm cookbooks -rf
rm Berksfile.lock -f
berks vendor cookbooks
