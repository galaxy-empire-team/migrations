-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.buildings (
    id serial PRIMARY KEY,
    type text NOT NULL,
    level integer NOT NULL,
    metal_cost bigint NOT NULL,
    crystal_cost bigint NOT NULL,
    gas_cost bigint NOT NULL,
    metal_production_s bigint,
    crystal_production_s bigint,
    gas_production_s bigint,
    bonuses jsonb,
    upgrade_time_s integer NOT NULL
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.buildings;
-- +goose StatementEnd
