-- Specification: For boosters, show how long after the last series
-- the first three boosters should be given. If tetanus is due every
-- 10 years and the last series shot was at age 6, the age 6 part
-- doesn't matter.  The next three after the series are "10 years
-- later, 20 years later, 30 years later."

-- This will need generate_series(1, 3) to make a table that can be
-- nested in a CROSS JOIN. (!!)
SELECT
    client.id,
    client.name,
    client.dateofbirth + (10 * booster.n) AS booster_due_age,
    CONCAT('Booster ', booster.n) AS booster_type
FROM
    client
CROSS JOIN
    generate_series(1, 3) AS booster(n)
ORDER BY
    client.id,
    booster.n;