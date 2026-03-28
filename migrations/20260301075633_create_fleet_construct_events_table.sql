-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.event_fleet_constructions (
    id serial PRIMARY KEY,
    planet_id uuid NOT NULL,
    fleet_id int NOT NULL,
    count int NOT NULL,
    started_at timestamptz NOT NULL,
    finished_at timestamptz NOT NULL,

    CONSTRAINT unique_planet_fleet_id UNIQUE(planet_id)
);

CREATE INDEX IF NOT EXISTS fleet_constructions_finished_time ON session_beta.event_fleet_constructions(finished_at);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS fleet_constructions_finished_time;
DROP TABLE IF EXISTS session_beta.event_fleet_constructions;
-- +goose StatementEnd
