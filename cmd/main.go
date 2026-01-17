package main

import (
	"fmt"
	"log"

	_ "github.com/lib/pq"
	"github.com/pressly/goose/v3"

	"github.com/galaxy-empire-team/migrations/internal/config"
	"github.com/galaxy-empire-team/migrations/internal/database"
)

func main() {
	if err := runMigrations(); err != nil {
		log.Fatal(err)
	}
}

func runMigrations() error {
	cfg, err := config.New()
	if err != nil {
		return fmt.Errorf("config.New(): %w", err)
	}

	db, err := database.New(cfg)
	if err != nil {
		return fmt.Errorf("database.New(): %w", err)
	}
	defer db.Close() //nolint:errcheck

	if err := goose.Up(db, cfg.MigrationsDir); err != nil {
		return fmt.Errorf("goose.Up(): %w", err)
	}

	return nil
}
