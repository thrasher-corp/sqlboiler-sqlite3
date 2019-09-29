module github.com/thrasher-corp/sqlboiler-sqlite3

go 1.13

replace github.com/volatiletech/sqlboiler-sqlite3 => ../sqlboiler-sqlite3

require (
	github.com/mattn/go-sqlite3 v1.11.0
	github.com/pkg/errors v0.8.1
	github.com/volatiletech/sqlboiler v3.5.0+incompatible
	github.com/volatiletech/sqlboiler-sqlite3 v0.0.0-00010101000000-000000000000
)
