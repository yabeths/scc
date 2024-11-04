---
title: Vehicle Registrations Activity
...


# WA State Vehicle Registrations

Goal: to practice SELECTs on a single table, using:

- naming columns to SELECT
- WHERE clause expression to filter
- ORDER BY
- DISTINCT
- summary functions (count, min, max)
- GROUP BY groupings
- LIMIT

on a larger, real-world dataset from the WA State DMV.



## Activity


### Write 5 SELECT queries (and describe one more) using VSCode in a GitHub Codespace

### Requirements

- work and submit in the GitHub repository you are invited to collaborate on
- work with VSCode and the SQLTools plugin
- submit five new queries (see sample questions for ideas)
  - one should answer "are most Ferraris red"
  - at least three should use WHERE to focus on a sub-set of interest
  - at least one should use GROUP BY and a summary function
  - at least one should use DISTINCT, or the DISTINCT can be replaced with a second GROUP BY query
- results should be clear and focused
  - be thoughtful about the columns you select
  - use WHERE to choose only the relevant rows
  - produce not be more than 10-20 lines, unless you have a good reason (I will be looking at the results, and possibly running them on the full 30 million record dataset)
  - if there are more than 20 results, you must use ORDER BY to show the most-important rows first
  - if you use LIMIT, make sure the ORDER leaves the most interesting results
- add one .sql file with an idea for a new query (in comments)
  - you do not have to implement this query
  - it should depend on the data in the database (for example: "most expensive car" can not be answered because the registration does not include price)

### Instructions

You should have received an invitation to collaborate on a repository
/kit-transue/select-vehicle-(short-name). If you do not have this
invitation, please send me an email. You should be able to start a
Codespace on this repository. You can also sync changes to the repo.

For an overview of what GitHub Codespaces are and how to use with
VSCode, see codespaces.pdf.

For details on this assignment, see vehicle-activity.pdf.

- accept invitation to vehicle-activity-USER
- start a Codespace in the repository (this may take several minutes)
- in Terminal, run "bash setup.sh" to create and populate the database tables
- work with .sql files in the VSCode editor window to write your queries
- save, commit, and sync.
- report "done" here in Canvas when you are finished



## The Database

The 10,000 records is big enough to exercise most queries you might
write. There are supercars, alternative fuel vehicles, vehicles
registered out of state, etc. If you write a query and it does not
return results, do a little investigation. For fields like fuel type
and electrification, have you matched the values correctly (make a
query using DISTINCT on these columns to see what is in the
database). If you don't get anything do a little work to prove that's
correct. (Like: there are very few registrations of older
vehicles--this is described below.)

## Setup

The sample repository comes with two shell scripts:

- setup.sh (drops and recreates the database from the supplied .csv)
- query.sh (to automate running the queries you write)

From the shell prompt in the Terminal pane, run "bash ./setup.sh"

It populates data from two comma-separated-values files; it should
print "COPY 10000" and "COPY 102" indicating it brought rows from both
data files.

setup.sh will recreate the database in case the original data gets
changed.


## Sample Questions

- what is the make/model of the oldest year represented in the database?
- what makes are represented in the database?
- how many vehicles per make? what is the interesting order?
- number of Tesla vehicles by model?
- are all Ferraris red?
- are most Ferraris red?
- what proportion of registered vehicles are BEVs? (Write two queries to get BEVs and total; doing this in a single query is also possible with fancy expressions.)
- how are BEVs distributed by county?

Going beyond make/model/year/color (or columns where you can guess the
values like postalcode or county): what are the columns about? Are any
of these interesting:

- use
- plateBackground
- plateConfiguration
- type
- fuelTypeSecondary
- (etc.)
 

## Workflow

Use VSCode in a GitHub Codespace.

Use the SQLTools to send your SQL to the database.

Use queries to see what the dataset looks like.

Commit regularly: when you have a working query (even if you want to
clean it up), or before you start over on something. It is a good idea
to always sync your commits.

Before your final submit, test your queries in the Terminal by running
"bash query.sh"

Sync/push your final commit. If you want to confirm what your final
submission looks like in the GitHub "origin" repo, leave your Codespace
and look at the sources and history using the GitHub project page.




## Introductory notes

- this is a single table; it is not normalized

- **Check your capitalization of values!** Use a SELECT DISTINCT to take samples from the database. PostgreSQL downcases unquoted column and table names, but it does not alter value data. Values must match case.

- there is something strange about older cars--write some queries to explore

### Large dataset

Some hints on using <code>psql</code> when working with a large dataset:

- use LIMIT to make results smaller (especially in joins)
- DISTINCT is helpful in getting an idea of what values are used
- summary functions (max, min, count) are also helpful
- in psql: **use 'q' to quit the pager of long results and return to the psql command prompt**

## About the dataset(s)


From [https://data.wa.gov/Transportation](https://data.wa.gov/Transportation/Vehicle-Registration-Transactions-by-Department-of/brw6-jymh)

32M records; 7.4 GB, covering the years 2020-2024, inclusive.

Each row represents someone registering their vehicle sometime in the
month starting on "transactionDate". Registrations usually last one
year, so it may be that a vehicle is represented three times (or
more?)  in the full dataset. For the smaller datasets, they represent
only one week or month, so the vehicles are probably unique.


### Smaller

You are working with a smaller dataset. It is faster to experiment
with, and because it does not cover multiple years, the vehicles in
the database are probably unique. It comes from:

- vrt-10k.csv: 2.3 MB; 10,000 records randomly selected from September 2023 to August 2024
- vrt-ferrari.csv: 22 kB: 100 records of randomly selected Ferraris


### Schema

The create.sql creates a table that matches the DMV CSV:

```sql
CREATE TABLE registration (
    TransactionDate DATE,
    Make VARCHAR,
    Model VARCHAR,
    MYear INTEGER,
    Color VARCHAR,
    Type VARCHAR,
    Use VARCHAR,
    FuelTypePrimary VARCHAR,
    FuelTypeSecondary VARCHAR,
    GVWRClass VARCHAR,
    GVWRRange VARCHAR,
    Electrification VARCHAR,
    PlateBackground VARCHAR,
    PlateConfiguration VARCHAR,
    OwnerType VARCHAR,
    County VARCHAR,
    State VARCHAR,
    PostalCode VARCHAR,
    TransactionType VARCHAR,
    TransactionChannel VARCHAR,
    CensusTract VARCHAR,
    TransactionCount VARCHAR
);
```

and then populates it:

```sql
SET datestyle TO 'ISO, MDY';
\COPY registration FROM 'vrt-10k.csv' CSV;
```


## Example query

```sql
SELECT DISTINCT make, model
FROM registration
ORDER BY model DESC
LIMIT 10 ;
```

```sql
SELECT myear, count(myear)
FROM registration
WHERE myear < 1990
GROUP BY myear
ORDER BY myear ;
```


## Extras

### Importing other datasets

Larger or full datasets will very quickly use up your GitHub Codespaces free quota.
Do not try to load larger datasets inside a Codespace.

See me about using either Docker or colima to run a DevContainer locally, or
about installing PostgreSQL locally to work without a DevContainer. I can also
run some queries against the full dataset for you.

The full dataset is big, but the database handles it OK with indexes.
(It takes about 5 minutes to load from a fast SSD; similar time to index.)

For full dataset:

```sql
SET datestyle TO 'ISO, MDY';
\COPY registration FROM 'Downloads/Vehicle_Registration_Transactions_by_Department_of_Licensing.csv' CSV HEADER
```

Queries are much faster if you index the interesting columns:

```sql
CREATE INDEX ON registration(make);
CREATE INDEX ON registration(model);
CREATE INDEX ON registration(transactiondate);
CREATE INDEX ON registration(electrification);
```

(The indexes are only needed if you have the full database.)


### Related Data

Some county-level questions are more interesting if you know the
population of the county, which can vary widely.

I have not found a county-level population on data.wa.gov, but there
are some tables here:

[Washington State Office of Financial Management: population estimates](https://ofm.wa.gov/washington-data-research/population-demographics/population-estimates/historical-estimates-april-1-population-and-housing-state-counties-and-cities)

They are in Excel format on a separate worksheet and have the common
1NF violation of having a different column for each year. But they
could be adapted and loaded into this database if anyone is interested
in trying out JOINs.