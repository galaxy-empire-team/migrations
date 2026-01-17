-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.users (
    id uuid PRIMARY KEY,
    login text UNIQUE NOT NULL,
    created_at timestamptz DEFAULT NOW()
);

CREATE INDEX idx_user_login ON session_beta.users(login);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS idx_user_login;
DROP TABLE IF EXISTS session_beta.users;
-- +goose StatementEnd
