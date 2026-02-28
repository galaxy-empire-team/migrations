-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.s_fleet (
    id serial PRIMARY KEY,
    ship_type text NOT NULL,
    attack integer NOT NULL,
    defense integer NOT NULL,
    speed integer NOT NULL,
    cargo_capacity integer NOT NULL,
    metal_cost bigint NOT NULL,
    crystal_cost bigint NOT NULL,
    gas_cost bigint NOT NULL,
    build_time_s integer NOT NULL,

    CONSTRAINT fleet_is_unique UNIQUE(ship_type)
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.fleet;
-- +goose StatementEnd
