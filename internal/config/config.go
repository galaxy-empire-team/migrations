package config

import (
	"fmt"

	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	PgConn        PgConn `envconfig:"PG"`
	MigrationsDir string `envconfig:"MIGRATIONS_DIR" required:"true"`
}

type PgConn struct {
	Host     string `envconfig:"HOST"     required:"true"`
	Port     string `envconfig:"PORT"     required:"true"`
	User     string `envconfig:"USER"     required:"true"`
	Password string `envconfig:"PASSWORD" required:"true"`
	DBName   string `envconfig:"DB_NAME"  required:"true"`
	SSLMode  string `envconfig:"SSL_MODE" default:"disable"`
}

func New() (Config, error) {
	var cfg Config

	if err := envconfig.Process("", &cfg); err != nil {
		return Config{}, fmt.Errorf("envconfig.Process(): %w", err)
	}

	return cfg, nil
}
