-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.em_colonizations (
    id serial PRIMARY KEY,
    status text NOT NULL,
    updated_at timestamptz NOT NULL DEFAULT NOW()
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.o_colonizations;
-- +goose StatementEnd
