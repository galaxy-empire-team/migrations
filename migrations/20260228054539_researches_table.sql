-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS session_beta.s_researches (
    id SERIAL PRIMARY KEY,
    research_type TEXT NOT NULL,
    level INT NOT NULL,
    bonuses JSONB NOT NULL,
    metal_cost INT NOT NULL,
    crystal_cost INT NOT NULL,
    gas_cost INT NOT NULL,
    research_time_s INT NOT NULL,

    UNIQUE(research_type, level)
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS session_beta.researches;
-- +goose StatementEnd
