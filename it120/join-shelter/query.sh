
for querySource in query*.sql; do
    psql -a -f $querySource
done
