#!/bin/bash

etcdctl set $ETCD_DIR/master_host $3
etcdctl set $ETCD_DIR/master_port $4

