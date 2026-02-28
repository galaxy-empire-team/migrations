-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.user_researches (
    id serial PRIMARY KEY,
    user_id uuid NOT NULL,
    research_id integer NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES session_beta.users(id) ON DELETE RESTRICT,
    FOREIGN KEY (research_id) REFERENCES session_beta.s_researches(id) ON DELETE RESTRICT,

    UNIQUE(user_id, research_id)
);

CREATE INDEX IF NOT EXISTS idx_user_id ON session_beta.user_researches(user_id);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.user_researches;
-- +goose StatementEnd
