-- Specification: Suggested vaccination schedule by age, with
-- notes. This is only for the initial vaccination series, not for
-- boosters.
SELECT
    client.id,
    client.name,
    vaccinationschedule.age AS recommended_age,
    vaccinationschedule.dose_description,
    vaccinationschedule.schedule_notes
FROM
    client
CROSS JOIN (
    VALUES
        (2, 'Initial Dose 1 at 2 months', 'Recommended first dose'),
        (4, 'Initial Dose 2 at 4 months', 'Follow-up dose'),
        (6, 'Initial Dose 3 at 6 months', 'Follow-up dose'),
        (12, 'Initial Dose 4 at 12 months', 'Final dose of initial series')
) AS vaccinationschedule(dose_age, dose_description, schedule_notes)
ORDER BY
    client.id,
    vaccinationschedule.age;

    --Not fully operational