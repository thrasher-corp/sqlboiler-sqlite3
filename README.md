# sqlboiler-sqlite3

This package is a driver for sqlboiler. It requires cgo to build and
therefore is not in the main tree.

## Installation

First install the `database/sql` sqlite3 driver https://github.com/mattn/go-sqlite3
This requires cgo and the sqlite3 .so/.dll installed. Refer to the installation
of the `github.com/mattn/go-sqlite3` to complete this step.

Installation is simple, just use `go get`. Once the binary is in
your path `sqlboiler` will be able to use it if you run it with the
driver name `sqlite3`.

```bash
# Install sqlboiler sqlite3 driver
go get -u github.com/thrasher-corp/sqlboiler-sqlite3
# Generate models
sqlboiler sqlite3
```

It's configuration keys in sqlboiler are simple:

```toml
# Absolute path is recommended since the location
# sqlite3 is being run can change.
# For example generation time and model test time.
[sqlite3]
dbname = "/path/to/file"
```

## Development

This does use go-bindata to embed templates into the binary.
You can run `go-generate` in the driver folder to re-gen the bindata
after modifying templates. Other than that `go build` should be able to
be used to build the binary.
