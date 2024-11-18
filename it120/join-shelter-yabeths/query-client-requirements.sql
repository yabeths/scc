-- Specification: Show clients with special requirements.

SELECT nested.name, specialneed.description
FROM specialneed
INNER JOIN (
    SELECT client.name, clientneed.needid
    FROM client
    INNER JOIN clientneed
    ON client.id = clientneed.clientid
) nested
ON specialneed.id = nested.needid;
