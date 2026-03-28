-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.event_researches (
    id serial PRIMARY KEY,
    user_id uuid NOT NULL,
    research_id int NOT NULL,
    started_at timestamptz NOT NULL,
    finished_at timestamptz NOT NULL,

    CONSTRAINT unique_user_research_id UNIQUE(user_id)
);

CREATE INDEX IF NOT EXISTS research_events_finished_time ON session_beta.event_researches(finished_at);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS research_events_finished_time;
DROP TABLE IF EXISTS session_beta.event_researches;
-- +goose StatementEnd
