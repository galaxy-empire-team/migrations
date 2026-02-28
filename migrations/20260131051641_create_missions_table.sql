-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.s_missions (
    id serial PRIMARY KEY,
    mission_type text NOT NULL,

    UNIQUE (mission_type)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.missions;
-- +goose StatementEnd
