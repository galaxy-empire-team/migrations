-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.planet_resources (
    id serial PRIMARY KEY,
    planet_id uuid UNIQUE NOT NULL,
    metal bigint NOT NULL CHECK (metal >= 0),
    crystal bigint NOT NULL CHECK (crystal >= 0),
    gas bigint NOT NULL CHECK (gas >= 0),
    updated_at timestamptz NOT NULL DEFAULT NOW(),

    FOREIGN KEY (planet_id) REFERENCES session_beta.planets(id) ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_planet_id ON session_beta.planet_resources(planet_id);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS idx_planet_id;
DROP TABLE IF EXISTS session_beta.planet_resources;
-- +goose StatementEnd
