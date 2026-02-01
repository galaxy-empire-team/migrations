-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.mission_events (
    id serial PRIMARY KEY,
    mission_type text NOT NULL,
    user_id uuid NOT NULL,
    planet_from  uuid NOT NULL,
    planet_to_x int NOT NULL,
    planet_to_y int NOT NULL,
    planet_to_z int NOT NULL,
    started_at timestamptz NOT NULL,
    finished_at timestamptz NOT NULL
);

CREATE INDEX IF NOT EXISTS mission_events_finished_time ON session_beta.mission_events(finished_at);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS mission_events_finished_time;
DROP TABLE IF EXISTS session_beta.mission_events;
-- +goose StatementEnd
