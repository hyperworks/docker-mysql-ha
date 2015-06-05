# docker-mysql-ha

This container run mysqlfailover tool for high aviability with etcd

## Example

```
docker run -d --name ha \
-e ETCDCTL_PEERS=192.168.99.100:4001 \
-e ETCD_DIR=mysqlconfig \
hyperworks/mysql-ha
```
