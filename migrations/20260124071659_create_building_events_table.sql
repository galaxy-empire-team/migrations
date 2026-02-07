-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.building_events (
    id serial PRIMARY KEY,
    planet_id uuid NOT NULL,
    building_id int NOT NULL,
    started_at timestamptz NOT NULL,
    finished_at timestamptz NOT NULL,

    CONSTRAINT unique_planet_building_id UNIQUE(planet_id, building_id)
);

CREATE INDEX IF NOT EXISTS building_events_finished_time ON session_beta.building_events(finished_at);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS building_events_finished_time;
DROP TABLE IF EXISTS session_beta.building_events;
-- +goose StatementEnd
