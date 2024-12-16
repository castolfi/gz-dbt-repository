-- stg_raw__product.sql

WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'product') }}
),

renamed AS (
    SELECT
        product_id,
        product_name,
        CAST(purchse_price AS FLOAT64) AS purchase_price  -- Fix column name and cast data type
    FROM source
)

SELECT * FROM renamed
