# insurance_crm

## Installation Instructions
This is a CRM aimed at small Personal Auto Insurance agencies. The purpose is to help track customer payments, and notify customers when it's time for their payments or renewals. This CRM can track personal auto polices, the vehicles, coverages, and people associated to each policy.

To install this app you must have pipenv installed and run the following command under the app root directory in shell:

<code>pipenv install</code>

This will install all required python dependencies from the pipfile along with bcrypt. 
You must also run the SQL scripts in order to create the DB and if desired pre-populate with customer/policy data.
Assuming you have postgres installed in your environment, please run the following SQL scripts from the db_scripts folder in shell:

<code>createdb -U postgres Kappa</code>

<code>psql -U postgres -d Kappa -a -f create_scripts_kappa_security.sql</code>

<code>psql -U postgres -d Kappa -a -f create_scripts_kappa_crm.sql</code>

<code>psql -U postgres -d Kappa -a -f insert_scripts_kappa_crm.sql</code>

Once the DB tables have been created a user must be created in order to add additional users.


To run the app, in a shell run:
<code>
pipenv shell python crm.py
</code>

## Database Structure 


![ERD Image](2018-05-05_09-54-12.png "Kappa CRM Database")
