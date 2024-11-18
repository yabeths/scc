-- Match clients to homes.

-- Note: this is complicated: watch for clients with more than one need!
SELECT
    client.id,
    client.name,
    home.name,
    home.phone,
    --specialneed.description, 
    COUNT(*)
FROM
    client
JOIN
    clientneed ON client.id = clientneed.clientid
JOIN
    specialneed ON specialneed.id = clientneed.needid
JOIN
    homecapability ON homecapability.needid = specialneed.id
JOIN
    home ON homecapability.homeid = home.id

GROUP BY
    client.id,
    client.name,
    home.id,
    home.name,
    home.phone
    --specialneed.description
/*HAVING
    COUNT(clientneed.needid) = (
        SELECT COUNT(*)
        FROM clientneed AS cn
        WHERE cn.id = client.id

SELECT clientid, count(*) FROM clientneed GROUP BY clientid
    )*/
ORDER BY
    client.id,
    home.name;

--not fully operational
