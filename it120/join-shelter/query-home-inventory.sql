-- Specification: List all homes with name and contact phone. List any
-- special needs the home is prepared to meet.
SELECT
    home.name,
    home.phone,
    COALESCE(STRING_AGG(specialneed.description, ', '), 'No specific needs listed') AS prepared_needs
FROM
    home
LEFT JOIN
    homecapability ON home.id = homecapability.homeid
LEFT JOIN
    specialneed ON homecapability.needid = homecapability.needid
GROUP BY
    home.id
ORDER BY
    home.name;

--not fully operational