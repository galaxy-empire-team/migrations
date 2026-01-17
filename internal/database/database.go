package database

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"

	"github.com/galaxy-empire-team/migrations/internal/config"
)

func New(cfg config.Config) (*sql.DB, error) {
	dsn := fmt.Sprintf(
		"host=%s port=%s user=%s password=%s dbname=%s sslmode=%s",
		cfg.PgConn.Host,
		cfg.PgConn.Port,
		cfg.PgConn.User,
		cfg.PgConn.Password,
		cfg.PgConn.DBName,
		cfg.PgConn.SSLMode,
	)

	db, err := sql.Open("postgres", dsn)
	if err != nil {
		return nil, fmt.Errorf("sql.Open(): %w", err)
	}

	if err := db.Ping(); err != nil {
		return nil, fmt.Errorf("db.Ping(): %w", err)
	}

	return db, nil
}
