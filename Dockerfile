FROM ubuntu:trusty

RUN apt-get update && \
  apt-get -yq install curl python && \
  rm -rf /var/lib/apt/lists/*

ENV UPDATE 1

RUN curl http://cdn.mysql.com/Downloads/Connector-Python/mysql-connector-python_2.0.4-1ubuntu14.04_all.deb > /tmp/mysql-connector-python_2.0.4-1ubuntu14.04_all.deb
RUN curl http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-utilities_1.5.4-1ubuntu14.04_all.deb > /tmp/mysql-utilities_1.5.4-1ubuntu14.04_all.deb

RUN dpkg -i /tmp/mysql-connector-python_2.0.4-1ubuntu14.04_all.deb
RUN dpkg -i /tmp/mysql-utilities_1.5.4-1ubuntu14.04_all.deb

RUN curl -L https://github.com/coreos/etcd/releases/download/v2.0.11/etcd-v2.0.11-linux-amd64.tar.gz -o /tmp/etcd-v2.0.11-linux-amd64.tar.gz
RUN tar xzvf /tmp/etcd-v2.0.11-linux-amd64.tar.gz
RUN cp /etcd-v2.0.11-linux-amd64/etcdctl /usr/local/bin/etcdctl
RUN rm -rf /tmp/etcd-v2.0.11-linux-amd64.tar.gz /etcd-v2.0.11-linux-amd64

ADD run.sh /run.sh
ADD after.sh /after.sh

CMD ["/run.sh"]
