# crystal-tds

A crystal native database driver for Microsoft SQL Server

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crystal-tds:
       github: wonderix/crystal-tds
   ```

2. Run `shards install`

## Usage


This driver now uses the `crystal-db` project. Documentation on connecting,
querying, etc, can be found at:

* https://crystal-lang.org/docs/database/
* https://crystal-lang.org/docs/database/connection_pool.html


```crystal
require "crystal-tds"
```

`crystal-db` driver for Microsoft SQL Server based on the work of [FreeTDS](https://www.freetds.org/) and [jTDS](https://github.com/milesibastos/jTDS)


## Supported data types

* TINYINT
* SMALLINT
* INT
* BIGINT
* DECIMAL
* NUMERIC
* FLOAT
* REAL
* VARCHAR
* NVARCHAR
* DATE
* DATETIME
* DATETIME2
* SMALLDATETIME
* TEXT
* NTEXT

## Restriction


Have a look at the [issue tracker](https://github.com/wonderix/crystal-tds/labels/restriction) to get an overview over all restrictions.

## Development

* Install Docker


## Contributing

1. Fork it (<https://github.com/wonderix/crystal-tds/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Ulrich Kramer](https://github.com/wonderix) - creator and maintainer


## Testing

```bash
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=My-Secret-Pass' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server
crystal spec
```