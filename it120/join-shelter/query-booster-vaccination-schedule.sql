-- Specification: For each client, show the dates when the first three
-- boosters should be administered, assuming the guideline for the
-- initial vaccine series is followed.

-- This is very hard.

SELECT
    client.id, client.name FROM client
UNION
SELECT
    vaccination.date + (interval '10 years' * boost.n) AS boost_date,
    CONCAT('Booster ', boost.n) AS boost_number

CROSS JOIN
    generate_series(1, 3) AS booster(n)
ORDER BY
    client.id,
    boost.n;

-- not fully operational