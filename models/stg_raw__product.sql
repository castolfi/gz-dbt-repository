-- stg_raw__product.sql

WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'product') }}
),

renamed AS (
    SELECT
        products_id,
        CAST(purchSE_PRICE AS FLOAT64) AS purchase_price  -- Fix column name and cast data type
    FROM source
)

SELECT * FROM renamed
