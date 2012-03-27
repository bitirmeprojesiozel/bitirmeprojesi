#!/bin/sh
rm -rf db/data && 
rake db:data:dump_dir dir='data'

