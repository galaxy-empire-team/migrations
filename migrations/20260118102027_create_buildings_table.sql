-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.buildings (
    id serial PRIMARY KEY,
    building_type text NOT NULL,
    level integer NOT NULL,
    metal_cost bigint NOT NULL,
    crystal_cost bigint NOT NULL,
    gas_cost bigint NOT NULL,
    production_s bigint,
    bonuses jsonb,
    upgrade_time_s integer NOT NULL,

    CONSTRAINT building_is_unique UNIQUE(building_type, level)
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.buildings;
-- +goose StatementEnd
