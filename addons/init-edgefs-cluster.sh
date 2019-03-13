#!/bin/bash
#
#Initialize FlexHash map (it was auto-discovered and now ready to use)
efscli system init

# create logical site namespace “cltest”
efscli cluster create cltest
# and tenant “test”
efscli tenant create cltest/test

# bucket, aligned on 32K chunk size
efscli bucket create cltest/test/files -s 32768 -r 1 -t 1

# NFS service "nfs01"
efscli service create nfs nfs01
# serving bucket "cltest/test/files"
efscli service serve nfs01 cltest/test/files