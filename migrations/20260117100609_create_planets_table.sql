-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.planets (
    id uuid PRIMARY KEY,
    user_id uuid NOT NULL,
    x smallint NOT NULL,
    y smallint NOT NULL,
    z smallint NOT NULL,
    has_moon boolean NOT NULL DEFAULT FALSE ,
    colonized_at timestamptz NOT NULL DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES session_beta.users(id) ON DELETE RESTRICT,
    UNIQUE(x, y, z)
);

CREATE INDEX idx_user_id ON session_beta.planets(user_id);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS idx_user_id;
DROP TABLE IF EXISTS session_beta.planets;
-- +goose StatementEnd
