-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.planet_buildings (
    id serial PRIMARY KEY,
    planet_id uuid NOT NULL,
    building_id integer NOT NULL,
    updated_at timestamptz NOT NULL DEFAULT NOW(),
    finished_at timestamptz DEFAULT NOW(),
    created_at timestamptz NOT NULL DEFAULT NOW(),

    FOREIGN KEY (planet_id) REFERENCES session_beta.planets(id) ON DELETE RESTRICT,
    FOREIGN KEY (building_id) REFERENCES session_beta.buildings(id) ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_planet_id ON session_beta.planet_buildings(planet_id);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS idx_planet_id;
DROP TABLE IF EXISTS session_beta.planet_building;
-- +goose StatementEnd
