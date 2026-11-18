CREATE TABLE Paths (
    depot_number      INT          NOT NULL,
    path_number       INT          NOT NULL,
    purpose           VARCHAR(100) NOT NULL,
    path_length       NUMERIC(8,2) NOT NULL,
    is_free           BOOLEAN      NOT NULL DEFAULT TRUE,
    is_electrified    BOOLEAN      NOT NULL DEFAULT TRUE,
    PRIMARY KEY (depot_number, path_number)
);

CREATE TABLE Path_Occupancy (
    occupancy_id      SERIAL       PRIMARY KEY,
    depot_number      INT          NOT NULL,
    path_number       INT          NOT NULL,
    entry_datetime    TIMESTAMP    NOT NULL,
    exit_datetime     TIMESTAMP,
    tram_number       VARCHAR(20)  NOT NULL,
    additional_info   TEXT,
    FOREIGN KEY (depot_number, path_number) 
        REFERENCES Paths (depot_number, path_number)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);