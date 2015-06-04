#!/bin/bash

echo $1
echo $2
echo $3
echo $4
echo $5
etcdctl set $ETCD_DIR/master_host $3
etcdctl set $ETCD_DIR/master_port $4

