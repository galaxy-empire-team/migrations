-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.user_notifications (
    id serial PRIMARY KEY,
    user_id uuid NOT NULL,
    notification_id integer NOT NULL,
    data jsonb,
    is_read boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES session_beta.users(id) ON DELETE RESTRICT,
    FOREIGN KEY (notification_id) REFERENCES session_beta.s_notifications(id) ON DELETE RESTRICT
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.user_notifications;
-- +goose StatementEnd
