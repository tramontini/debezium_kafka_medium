## Debezium + Kafka CDC
Repository for Medium post https://medium.com/nagoya-foundation/simple-cdc-with-debezium-kafka-a27b28d8c3b8

## Running locally
To run the project I created a Makefile with the commands.

1. You need docker installed
2. Execute `make clean` to remove temporary files and old builds.
3. Execute `make docker-up` to execute docker-composer process.
4. To end your execution use `make docker-down`.

## Adding more tables
To add more tables into streaming process you need to add it into `table.include.list` in the config file.

## Removing columns (filtering)
To remove a column from streaming change the parameter `column.exclude.list` in config file. 
## Useful commands
Inside kafka container:
- `kafka-topics --bootstrap-server kafka:9092 --list`: List all Kafka topics 
- `kafka-console-producer --bootstrap-server kafka:9092 --topic topicName`: Consult messages from a topic

## Examples of a Debezium message
You can find the full JSON of the examples inside the folder `files`, in this topic I will only shows the before and after part that Debezium creates for us.

The payload contains three crucial information: _before_, _after_ and _source_
- _before_ is how was the information state before the data change, if it is an insert, the before will come as null.
- _after_ is the data state after the operantion, if it is a delete operation the value will be null.
- _source_ is a compilation of the database's information like connector, name, db, table...
- 
### Insert Payload:
```
"payload":
    {
        "before": null,
        "after":
        {
            "id": 9999,
            "first_name": "matheus",
            "last_name": "tramontini"
        },
        "source":
        {
            "version": "1.8.1.Final",
            "connector": "mysql",
            "name": "dbserver1",
            "ts_ms": 1647491136000,
            "snapshot": "false",
            "db": "inventory",
            "sequence": null,
            "table": "customers",
            "server_id": 223344,
            "gtid": null,
            "file": "mysql-bin.000003",
            "pos": 791,
            "row": 0,
            "thread": null,
            "query": null
        },
        "op": "c",
        "ts_ms": 1647491136579,
        "transaction": null
    }
```

### Update Payload:
```
"payload":
    {
        "before":
        {
            "id": 9999,
            "first_name": "matheus",
            "last_name": "tramontini"
        },
        "after":
        {
            "id": 9999,
            "first_name": "Matheus",
            "last_name": "Tramontini"
        },
        "source":
        {
            "version": "1.8.1.Final",
            "connector": "mysql",
            "name": "dbserver1",
            "ts_ms": 1647491205000,
            "snapshot": "false",
            "db": "inventory",
            "sequence": null,
            "table": "customers",
            "server_id": 223344,
            "gtid": null,
            "file": "mysql-bin.000003",
            "pos": 1152,
            "row": 0,
            "thread": null,
            "query": null
        },
        "op": "u",
        "ts_ms": 1647491205582,
        "transaction": null
    }
```

### Delete Payload:
```
"payload":
    {
        "before":
        {
            "id": 9999,
            "first_name": "Matheus",
            "last_name": "Tramontini"
        },
        "after": null,
        "source":
        {
            "version": "1.8.1.Final",
            "connector": "mysql",
            "name": "dbserver1",
            "ts_ms": 1647491261000,
            "snapshot": "false",
            "db": "inventory",
            "sequence": null,
            "table": "customers",
            "server_id": 223344,
            "gtid": null,
            "file": "mysql-bin.000003",
            "pos": 1556,
            "row": 0,
            "thread": null,
            "query": null
        },
        "op": "d",
        "ts_ms": 1647491261810,
        "transaction": null
    }
```


## References
- [Debezium - MySQL Connector](https://debezium.io/documentation/reference/1.6/connectors/mysql.html)
- [Debezium - MongoDb Connector](https://debezium.io/documentation/reference/1.6/connectors/mongodb.html)
