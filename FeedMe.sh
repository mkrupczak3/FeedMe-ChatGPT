#!/usr/env/bin/bash
find . -type f -not -path '*/\.*' -exec grep -Il '.' {} \; | xargs awk 'FNR==1{print "--------------------------------------------------------------------------------"; print FILENAME; print "--------------------------------------------------------------------------------"; print ""; }{ print; print "" }' > allcode.txt
