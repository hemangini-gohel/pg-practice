PostgreSQL

Relationship

one to one ->  one student has one profile
one to many -> one user has many addressed
many to many -> many student can enroll in many courses

Joins 
Inner join/ Left outer join/ Right outer join
Available in user model

Triggers
- trigger file - CreateTriggerProductsDelete
- Product model


Constraints
- create_users migration contains below constraint
1. not null constraint
2. default constraint
3. unique constraint
4. check constraint
5. primary key
6. foreign key - check create addresses migration

Views
simple view - users_with_addresses_v01.sql
materialized view - users_with_maddresses_v01.sql

