#!/bin/bash

if [ -z "${ETCD_DIR}" ]; then
    ETCD_DIR="mysql"
fi

if [ -n "${ETCDCTL_PEERS}" ] && [ -n "${ETCD_DIR}" ]; then

    MASTER_HOST=$(etcdctl get $ETCD_DIR/master_host)
    echo "=> MASTER_HOST=${MASTER_HOST}"
    MASTER_PORT=$(etcdctl get $ETCD_DIR/master_port)
    echo "=> MASTER_PORT=${MASTER_PORT}"
    MASTER_USER=$(etcdctl get $ETCD_DIR/master_user)
    MASTER_PASS=$(etcdctl get $ETCD_DIR/master_pass)

    mysqlfailover --master=$MASTER_USER:$MASTER_PASS@$MASTER_HOST:$MASTER_PORT \
        --discover-slaves-login=$MASTER_USER:$MASTER_PASS \
        --exec-after=/after.sh --force \
        --daemon=start --log=/var/log/mysqlfailover.log \
        auto

    tail -f /var/log/mysqlfailover.log
fi
