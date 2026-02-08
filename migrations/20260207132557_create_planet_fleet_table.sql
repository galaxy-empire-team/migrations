-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.planet_fleet (
    id serial PRIMARY KEY,
    planet_id uuid NOT NULL,
    fleet_id integer NOT NULL,
    count integer NOT NULL,
    updated_at timestamptz NOT NULL DEFAULT NOW(),

    FOREIGN KEY (planet_id) REFERENCES session_beta.planets(id) ON DELETE RESTRICT,
    FOREIGN KEY (fleet_id) REFERENCES session_beta.fleet(id) ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_planet_id ON session_beta.planet_buildings(planet_id);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS idx_planet_id;
DROP TABLE IF EXISTS session_beta.planet_building;
-- +goose StatementEnd
