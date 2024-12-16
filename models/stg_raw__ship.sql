-- stg_raw__ship.sql

WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'ship') }}
),

filtered AS (
    SELECT *
    FROM source
    WHERE shipping_fee <> shipping_fee_1  -- Filter duplicates
),

renamed AS (
    SELECT
        shipping_id,
        shipping_fee,
        CAST(ship_cost AS FLOAT64) AS ship_cost  -- Cast column to FLOAT64
    FROM filtered
)

SELECT * FROM renamed
