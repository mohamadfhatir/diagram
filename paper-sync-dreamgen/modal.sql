CREATE TABLE paper_sync_diff_snapshot (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    collection_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paper_sync_schema_collection_log (
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
    FOREIGN KEY (snapshot_id) REFERENCES paper_sync_diff_snapshot(id)
);

CREATE TABLE paper_sync_index_collection_log (
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
    FOREIGN KEY (snapshot_id) REFERENCES paper_sync_diff_snapshot(id)
);

CREATE TABLE paper_sync_schema_diff (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    snapshot_id BIGINT,
    source_snapshot_id BIGINT,
    target_snapshot_id BIGINT,
    diff_json JSON,
    FOREIGN KEY (snapshot_id) REFERENCES paper_sync_diff_snapshot(id)
);

CREATE TABLE paper_sync_index_diff (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    snapshot_id BIGINT,
    source_snapshot_id BIGINT,
    target_snapshot_id BIGINT,
    diff_json JSON,
    FOREIGN KEY (snapshot_id) REFERENCES paper_sync_diff_snapshot(id)
);
