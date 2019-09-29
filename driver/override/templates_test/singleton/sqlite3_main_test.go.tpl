var rgxSQLitekey = regexp.MustCompile(`(?mi)((,\n)?\s+foreign key.*?\n)+`)

type sqliteTester struct {
	dbConn *sql.DB

	dbName	string
	testDBName string
}

func init() {
	dbMain = &sqliteTester{}
}

func (s *sqliteTester) setup() error {
	s.testDBName = filepath.Join(os.TempDir(), fmt.Sprintf("boil-sqlite3-%d.sql", rand.Int()))

	return nil
}

func (s *sqliteTester) teardown() error {
	if s.dbConn != nil {
		s.dbConn.Close()
	}

	return os.Remove(s.testDBName)
}

func (s *sqliteTester) conn() (*sql.DB, error) {
	if s.dbConn != nil {
        return s.dbConn, nil
	}

	var err error
	s.dbConn, err = sql.Open("sqlite3", fmt.Sprintf("file:%s?_loc=UTC", s.testDBName))
        if err != nil {
        return nil, err
	}

	path := filepath.Join("..", "..", "migrations")
	err = goose.Run("up", s.dbConn, "sqlite3", path, "")
	if err != nil {
		return nil, err
	}

	return s.dbConn, nil
}
