-- Recommended vaccines and schedules

-- https://www.akc.org/expert-advice/health/puppy-shots-complete-guide/

INSERT INTO vaccine (id, name, notes)
VALUES
(1, 'Distemper', NULL),
(2, 'Parvovirus', NULL),
(3, 'DHPP', 'distemper, infectious hepatitis/adenovirus, parvovirus, parainfluenza'),
(4, 'Rabies', 'Rabies vaccination required by law.');

INSERT INTO vaccinationschedule(id, vaccineid, species, age)
VALUES
(1, 1, 'dog', '6 weeks'),
(2, 2, 'dog', '6 weeks'),
(3, 3, 'dog', '10 weeks'),
(4, 3, 'dog', '16 weeks'),
(5, 4, 'dog', '16 weeks'),
(6, 3, 'dog', '12 months'),
(7, 4, 'dog', '12 months');

INSERT INTO recurringvaccine(id, vaccineid, species, boost)
VALUES
(1, 3, 'dog', '2 years'),
(2, 4, 'dog', '3 years');


-- Cats

-- American Animal Hospital Association, American Association of Feline Practitioners, and International Society of Feline Medicine
-- https://www.aaha.org/globalassets/02-guidelines/feline-vaccination-guidlines/resource-center/2020-aahaa-afp-feline-vaccination-guidelines.pdf
-- Following guidelines for shelter-raised cats; assuming from birth and not on intake.

INSERT INTO vaccine(id, name, notes)
VALUES
(1001, 'FPV + FHV-1 + FCV', NULL),
(1002, 'FeLV', NULL),
(1003, 'Rabies (inactivated)', 'Rabies vaccination required by law.');

INSERT INTO vaccinationschedule(id, vaccineid, species, age)
VALUES
-- FPV etc. q. 2 weeks
(1001, 1001, 'cat', '4 weeks'),
(1002, 1001, 'cat', '6 weeks'),
(1003, 1001, 'cat', '8 weeks'),
(1004, 1001, 'cat', '10 weeks'),
(1005, 1001, 'cat', '12 weeks'),
(1006, 1001, 'cat', '14 weeks'),
(1007, 1001, 'cat', '16 weeks'),

-- FeLV
(1008, 1002, 'cat', '8 weeks'),
(1009, 1002, 'cat', '11 weeks'),

-- Rabies
(1010, 1003, 'cat', '12 weeks'),
(1011, 1003, 'cat', '1 year');

INSERT INTO recurringvaccine(id, vaccineid, species, boost)
VALUES
(1101, 1001, 'cat', '3 years'),
(1102, 1002, 'cat', '1 year'),
(1103, 1004, 'cat', '3 years');

