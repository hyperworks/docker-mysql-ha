#!/bin/bash

ETCD_SLAVE_PATH="${3}_${4}"
etcdctl rm $ETCD_DIR/slaves/$ETCD_SLAVE_PATH --recursive
etcdctl set $ETCD_DIR/master/host $3
etcdctl set $ETCD_DIR/master/port $4

