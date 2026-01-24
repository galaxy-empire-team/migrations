-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.building_events (
    id serial PRIMARY KEY,
    planet_id uuid NOT NULL,
    build_type text NOT NULL,
    started_at timestamptz NOT NULL,
    finished_at timestamptz NOT NULL,

    CONSTRAINT unique_planet_build_type UNIQUE(planet_id, build_type)
);

CREATE INDEX IF NOT EXISTS finished_time ON session_beta.building_events(finished_at);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS finished_time;
DROP TABLE IF EXISTS session_beta.building_events;
-- +goose StatementEnd
