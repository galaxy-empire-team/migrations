-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.s_notifications (
    id serial PRIMARY KEY,
    notification_type text NOT NULL,

    UNIQUE (notification_type)
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.notifications;
-- +goose StatementEnd
