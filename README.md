## Debezium + Kafka CDC
Repository for Medium post 

## Rodando o projeto localmente
To run the project I created a Makefile with the commands.

1. You need docker installed
2. Execute `make clean` to remove temporary files and old builds.
3. Execute `make docker-up` to execute docker-composer process.
4. To end your execution use `make docker-down`.

## Adding more tables
To add more tables into streaming process you need to add it into `table.include.list` in the config file.

## Removing columns (filtering)
To remove some column from streaming chance the parameter `column.exclude.list` from config file. 
## Useful commands
Inside kafka container:
- `kafka-topics --bootstrap-server kafka:9092 --list`: List all Kafka topics 
- `kafka-console-producer --bootstrap-server kafka:9092 --topic topicName`: Consult messages from a topic

## Examples of a Debezium message


## Referências
- [Debezium - MySQL Connector](https://debezium.io/documentation/reference/1.6/connectors/mysql.html)
- [Debezium - MongoDb Connector](https://debezium.io/documentation/reference/1.6/connectors/mongodb.html)