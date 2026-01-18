-- +goose Up
-- +goose StatementBegin
CREATE SCHEMA IF NOT EXISTS session_beta;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP SCHEMA session_beta;
-- +goose StatementEnd
