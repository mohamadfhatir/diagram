
CREATE TABLE snapshot (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    collection_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mysql_schema_collection_log (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    snapshot_id BIGINT,
    host VARCHAR(255),
    port INT,
    region VARCHAR(100),
    environment VARCHAR(100),
    table_name VARCHAR(255),
    column_name VARCHAR(255),
    column_type VARCHAR(255),
    is_nullable BOOLEAN,
    column_default VARCHAR(255),
    extra_info TEXT,
    FOREIGN KEY (snapshot_id) REFERENCES snapshot(id)
);

CREATE TABLE mysql_index_collection_log (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    snapshot_id BIGINT,
    host VARCHAR(255),
    port INT,
    region VARCHAR(100),
    environment VARCHAR(100),
    table_name VARCHAR(255),
    index_name VARCHAR(255),
    column_name VARCHAR(255),
    index_type VARCHAR(255),
    is_unique BOOLEAN,
    FOREIGN KEY (snapshot_id) REFERENCES snapshot(id)
);
CREATE TABLE arango_index_collection_log (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    snapshot_id BIGINT,
    collection_name VARCHAR(255),
    index_name VARCHAR(255),
    index_type VARCHAR(50),
    fields JSON,
    is_unique BOOLEAN,
    is_sparse BOOLEAN,
    selectivity_estimate FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (snapshot_id) REFERENCES snapshot(id)
);
CREATE TABLE arango_collection_collection_log (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    snapshot_id BIGINT,
    name VARCHAR(255) NOT NULL,
    status INT,
    type INT,
    is_system BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (snapshot_id) REFERENCES snapshot(id)
);
