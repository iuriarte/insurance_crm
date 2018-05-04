import psycopg2
import re

conn = psycopg2.connect("dbname=kappa user=postgres")
cur = conn.cursor()
#take agent from agent on policy details page
agent = 'Juanita'
cur.execute("SELECT id FROM crm.employee WHERE first_name = %s", [agent])
agentid = cur.fetchone()[0]
print(agentid)
#take carrier from carrier on policy details page
carrier = 'Geico'
cur.execute("SELECT id FROM crm.company WHERE name = %s", [carrier])
carrierid = cur.fetchone()[0]
print(carrierid)
dealership = 'Progressive Auto'
cur.execute("SELECT id FROM crm.company WHERE name = %s", [dealership])
dealershipcheck = cur.fetchone()
if dealershipcheck is None:
    cur.execute("INSERT INTO crm.company (type, name) VALUES ('dealership',%s)", dealership)
    conn.commit()
    print('nope')
else:
    dealershipid = dealershipcheck[0]
    print(dealershipid)
rep = 'Shawn Rackley'
counter = 0
rep_first_name = ''
while counter < len(rep.split())-1:
    if counter == len(rep.split())-2:
        rep_first_name += rep.split()[counter]
        counter += 1
    else:
        rep_first_name += rep.split()[counter]
        rep_first_name += ' '
        counter += 1
print(rep_first_name)
rep_last_name = rep.split()[len(rep.split())-1]
print(rep_last_name)
cur.execute("SELECT id FROM crm.rep WHERE first_name = %s and last_name = %s and company_id = %s", (rep_first_name,rep_last_name, dealershipid))
repcheck = cur.fetchone()
if repcheck is None:
     cur.execute("INSERT INTO crm.rep (company_id, first_name, last_name) VALUES (%s,%s,%s)", (dealershipid, rep_first_name,rep_last_name))
     conn.commit()
     print('nope')
else:
     repid = repcheck[0]
     print(repid)
    
cur.close()
conn.close()