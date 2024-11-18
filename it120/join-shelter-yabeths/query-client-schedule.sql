-- Specification: Show the suggested vaccination schedule for client.

-- FIXME: wording? "Show when the recommended schedule indicates a client should get each vaccine"?
SELECT
    vaccination.clientid AS "Initial Dose",
    client.name,
    DATE_ADD(vaccination.date, INTERVAL '6 weeks') AS "Booster 1",
    DATE_ADD(vaccination.date, INTERVAL '10 weeks') AS "Booster 2",
    DATE_ADD(vaccination.date, INTERVAL '16 weeks') AS "Booster 3"
FROM
    client
JOIN
    vaccination ON client.id = vaccination.clientid
ORDER BY
    client.id,
    vaccination.date;
