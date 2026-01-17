-- +goose Up
-- +goose StatementBegin
CREATE SCHEMA session_beta;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP SCHEMA session_beta;
-- +goose StatementEnd
