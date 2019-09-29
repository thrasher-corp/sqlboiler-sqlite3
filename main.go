package main

import (
	"github.com/thrasher-corp/sqlboiler-sqlite3/driver"
	"github.com/volatiletech/sqlboiler/drivers"
)

func main() {
	drivers.DriverMain(&driver.SQLiteDriver{})
}
