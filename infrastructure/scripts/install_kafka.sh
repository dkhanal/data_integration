sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer -y
sudo java -version
sudo apt-get install zookeeperd -y
netstat -ant | grep :2181
wget http://apache.mirror.colo-serv.net/kafka/1.0.0/kafka_2.11-1.0.0.tgz
rm kafka_*
sudo rm -r /opt/Kafka
sudo mkdir /opt/Kafka
cd /opt/Kafka
sudo tar -xvf kafka_2.11-1.0.0.tgz -C /opt/Kafka/
sudo nohup /opt/Kafka/kafka_2.11-1.0.0/bin/kafka-server-start.sh /opt/Kafka/kafka_2.11-1.0.0/config/server.properties /tmp/kafka.log 2>&1 &
sudo /opt/Kafka/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1  --partitions 1 --topic testing
