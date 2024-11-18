-- Specification: For each client, show date and kind of vaccination.
SELECT
    client.name,
    vaccination.date,
    vaccine.name
FROM
    client
JOIN
    vaccination ON client.id = vaccination.clientid
JOIN
    vaccine ON vaccine.name = vaccine.name
ORDER BY
    client.name,
    vaccination.date,
    vaccine.name;
