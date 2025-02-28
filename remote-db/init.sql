CREATE TABLE sample_data (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sample_data (name) VALUES ('Alice'), ('Bob'), ('Charlie');
