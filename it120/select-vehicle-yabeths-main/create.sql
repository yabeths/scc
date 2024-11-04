-- IMPORTANT: this file is part of the setup process for the
-- select-vehicle activity. You should not need to make any changes
-- to this file!
--
-- IMPORTANT: this file contains psql client commands and cannot
-- be run using the SQLTools "play" button.
--
-- Run using the setup.sh script instead. From the Terminal:
--   bash ./setup.sh
-- The setup.sh will pass this file to psql.
-- 
-- psql is needed to \COPY the CSV files from the filesystem instead
-- of using INSERT. There are also some PL/pgSQL commands to ensure
-- that data isn't copied multiple times to prevent database (and the
-- Codespace) from growing unnecessarily.


-- Make the registration table schema that matches the data from the 

CREATE TABLE registration (
    TransactionDate DATE,
    Make VARCHAR,
    Model VARCHAR,
    MYear INTEGER,
    Color VARCHAR,
    Type VARCHAR,
    Use VARCHAR,
    FuelTypePrimary VARCHAR,
    FuelTypeSecondary VARCHAR,
    GVWRClass VARCHAR,
    GVWRRange VARCHAR,
    Electrification VARCHAR,
    PlateBackground VARCHAR,
    PlateConfiguration VARCHAR,
    OwnerType VARCHAR,
    County VARCHAR,
    State VARCHAR,
    PostalCode VARCHAR,
    TransactionType VARCHAR,
    TransactionChannel VARCHAR,
    CensusTract VARCHAR,
    TransactionCount VARCHAR
);


-- The dataset has dates in MDY format; make sure that is enabled:
SET datestyle TO 'ISO, MDY';


-- Check that data has not already been imported. This is important in
-- Codespaces where using 5GB is not a big deal, but using 20GB really
-- is. The syntax of psql meta-commands is a little strange:

SELECT count(*) < 100 AS has_capacity FROM registration;
\gset

-- And if the table is mostly empty, copy from local CSV:
\if :has_capacity
    -- \COPY assumes csv files are in this directory:
    \COPY registration FROM 'vrt-10k.csv' CSV HEADER
    \COPY registration FROM 'vrt-ferrari.csv' CSV HEADER
\endif

-- For the full database, suggest these:
-- CREATE INDEX ON registration(make);
-- CREATE INDEX ON registration(model);
-- CREATE INDEX ON registration(transactiondate);
-- CREATE INDEX ON registration(electrification);
