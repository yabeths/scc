DROP TABLE if exists ferraricars;

CREATE TABLE ferraricars(
    TransactionMonthandYear DATE,
    Make VARCHAR,
    Model VARCHAR,
    ModelYear VARCHAR,
    VehicleColor VARCHAR,
    VehicleType VARCHAR,
    VehiclePrimaryUse VARCHAR,
    FuelTypePrimary VARCHAR,
    FuelTypeSecondary VARCHAR,
    GrossVehicleWeight VARCHAR,
    -- RatingClass VARCHAR,
    GVWRRange VARCHAR,
    ElectrificationLevel VARCHAR,
    PlateBackground VARCHAR,
    PlateConfiguration VARCHAR,
    OwnerType VARCHAR,
    County VARCHAR,
    State VARCHAR,
    PostalCode VARCHAR,
    TransactionType VARCHAR,
    TransactionChannel VARCHAR,
    GEOID2020 VARCHAR,
    TransactionCount VARCHAR
);

-- The dataset has dates in MDY format; make sure that is enabled:
SET datestyle TO 'ISO, MDY';

-- SELECT count(*) < 100 AS has_capacity FROM registration;
-- \gset

-- \if :has_capacity
    -- \COPY assumes csv files are in this directory:
    -- \COPY ferraricars FROM 'vrt-10k.csv' CSV HEADER
    \COPY ferraricars FROM 'vrt-ferrari.csv' CSV HEADER
-- \endif
