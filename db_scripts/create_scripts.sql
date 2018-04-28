-- CREATE DATABASE kappa

CREATE TABLE employee (
	-- populated internally
	id	serial PRIMARY KEY,
	first_name	varchar(50)	NOT NULL,
	last_name	varchar(50)	NOT NULL,
	birthdate	date	NOT NULL,
	gender	char(1)	NOT NULL,
	-- gender 'M = male, F = female, O = other'
	email	varchar(50)	NOT NULL,
	phone	bigint	NOT NULL,
	active_flag	bit(1)	NOT NULL DEFAULT '1'::bit,
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);

CREATE TABLE customer (
-- populated by client facing quote page and back office employee entry
	id	serial PRIMARY KEY,
	primary_agent_id	int	NULL REFERENCES employee(id),
	first_name	varchar(50)	NOT NULL,
	last_name	varchar(50)	NOT NULL,
	birthdate	date	NULL,
	gender	char(1)	NULL,
	-- gender 'M = male, F = female, O = other'
	marital_status	varchar(15)	NULL,
	-- marital_status 'Single, Married' etc
	occupation	varchar(255)	NULL,
	email	varchar(255)	NULL,
	phone	bigint	NULL,
	id_type	varchar(30)	NULL,
	-- id_type 'Texas Drivers License, Texas ID, Out of state, Passport, Matricula, International Drivers License, No ID'
	id_number	varchar(30)	NULL,
	address	varchar(255)	NULL,
	city	varchar(50)	NULL,
	state	char(2)	NULL,
	zip	int	NULL,
	pref_language	char(15)	NULL,
	customer_rating	smallint	NULL CHECK (customer_rating between 1 and 5) DEFAULT 5,
	homeowner_flag	bit(1)	NULL,
	-- homeowner_flag comes from discount page
	curr_insured_flag	bit(1)	NULL,
	-- curr_insured_flag comes from discount page
	curr_insured_duration	varchar(30)	NULL,
	-- curr_insured_duration 'Less than 6 months, 6 to 11 months, 12 months or longer'
	-- curr_insured_duration comes from discount page
	curr_carrier	varchar(255)	NULL,
	-- curr_carrier comes from discount page
	accident_tickets_flag	bit(1)	NULL,
	-- accident_tickets_flag comes from points page
	num_accidents	int	NULL,
	-- num_accidents comes from points page
	num_tickets	int	NULL,
	-- num_tickets comes from points page
	at_fault_flag	bit(1)	NULL,
	-- at_fault_flag comes from points page
	status	char(1)	NOT NULL DEFAULT 'P',
	-- status 'A = active, I = inactive, P = prospect', status change handled by policy_customer
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);

CREATE TABLE company (
-- populated by entries to carriers, lien holders, dealerships
	id	serial	PRIMARY KEY,
	type	varchar(15)	NOT NULL,
	-- type 'carrier, dealership, lienholder'
	base_url	varchar(255)	NULL,
	-- only populated for carrier, for direct link to policy
	name	varchar(255)	NOT NULL,
	phone	bigint	NULL,
	fax	bigint	NULL,
	address	varchar(255) NULL,
	city	varchar(50) NULL,
	state	char(2)	NULL,
	zip	int	NULL
);

CREATE TABLE policy (
	-- populated by quote or policy page
	id	serial	PRIMARY KEY,
	policy_agent_id	int	NOT NULL REFERENCES employee(id),
	-- policy_agent_id is the employee id from user creating policy
	carrier_id	int	NOT NULL REFERENCES company(id),
	type	varchar(30)	NOT NULL,
	quote_number varchar(50) NULL,
	quote_amt real NULL,
	-- type for now is 'auto', to give room for future expansion
	policy_number	varchar(50) NULL,
	created_date	timestamp NOT NULL,
	-- created_date now() at record creation
	effective_date	timestamp NULL,
	first_payment_date	timestamp	NULL,
	renewal_date	timestamp NULL,
	end_date	timestamp NULL,
	status	varchar(15)	NOT NULL DEFAULT 'Quote',
	-- status 'Quote, Autopay, Non-Pay, Renewal, Charge, Cancelled'
	/* if status updated to cancelled
	UPDATE policy SET cancelled_date = now() where id = @policy_id
	UPDATE policy_customer SET active_flag = 0 where policy_id = @policy_id
	UPDATE policy_car SET active_flag = 0 where policy_id = @policy_id
	*/
	/* if status updated to ('Autopay', 'Non-Pay', 'Renewal', 'Charge')
	UPDATE coverage SET active_flag = 1 where policy_id = @policy_id
	UPDATE policy_customer SET active_flag = 1 where policy_id = @policy_id
	UPDATE policy_car SET active_flag = 1 where policy_id = @policy_id
	*/
	premium_amt	real NULL,
	cancelled_date	timestamp	NULL,
	-- cancelled_date only populated if status = 'Cancelled'
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);



CREATE TABLE policy_customer (
	-- populated by drivers page
	id	serial	PRIMARY KEY,
	policy_id	int	NOT NULL REFERENCES policy(id),
	customer_id	int	NOT NULL REFERENCES customer(id),
	primary_flag	bit(1)	NOT NULL,
	-- primary_flag '1=primary, 0=other',
	relation	varchar(50)	NULL,
	active_flag	bit(1)	NOT NULL	DEFAULT '0'::bit,
	-- updated by policy.status update
	/* for any entry/update to active_flag
	if
(SELECT max(active) from policy_customer where customer_id = @customer_id) = 1
then (UPDATE customer SET status = 'A' WHERE id = @customer_id)
else
(SELECT max(active) from policy_customer where customer_id = @customer_id) = 0
then (UPDATE customer SET status = 'I' WHERE id = @customer_id)
	*/
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);

CREATE TABLE car (
-- populated by vehicles page
	id	serial	PRIMARY KEY,
	lienholder_id	int	NULL REFERENCES company(id),
	-- lienholder_id comes from lien holder page, populate with company(id)
	/* if
	(SELECT id from company where name = @company_name) is null then create new company record
	*/
	dealership_id	int	NULL,
	-- dealership_id comes from dealership page, populate with company(id)
	/* if
	(SELECT id from company where name = @company_name) is null then create new company record
	*/
	vin	char(17)	NOT NULL,
	make	varchar(25)	NOT NULL,
	model	varchar(25)	NOT NULL,
	year	int	NOT NULL,
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);

CREATE TABLE coverage (
	-- populated by coverage page
	id	serial	PRIMARY KEY,
	policy_id int	NOT NULL REFERENCES policy(id),
	car_id	int	NOT NULL REFERENCES car(id),
	type	varchar(25)	NOT NULL,
	-- type 'Liability, Full Comprehensive, Full Collision',
	deductible_amount	real	NULL,
	-- deductible only populated if type <> 'Liability'
	active_flag	bit(1)	NOT NULL DEFAULT '0'::bit,
	-- active_flag updated by policy.status update
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);


CREATE TABLE contact_info (
	-- populated by contact page
	id	serial	PRIMARY KEY,
	customer_id	int NOT NULL REFERENCES customer(id),
	type	varchar(20)	NOT NULL,
	-- type 'Mobile Phone, Home Phone, Fax Number, Work Address'
	value	varchar(255)	NOT NULL,
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);

CREATE TABLE note (
	-- populated by notes section on customer page
	id	serial	PRIMARY KEY,
	customer_id	int	NOT NULL REFERENCES customer(id),
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	note	varchar(255)	NOT NULL,
	first_id	bigint	NULL,
	-- if new note, first_id == id
	-- if note is updated, the new note record should hold the id of the first note version
	sequence_number	int NULL	DEFAULT 0
	-- if note is updated, the new note record should hold the previous note sequence_number + 1
	/*
	SELECT max(sequence_number)+1 FROM note WHERE first_id = @note_id
	*/
);

CREATE TABLE rep (
	id	serial	PRIMARY KEY,
	company_id	int	NULL REFERENCES company(id),
	/* if
	(SELECT id from company where name = @company_name) is null then create new company record
	*/
	first_name	varchar(50)	NOT NULL,
	last_name	varchar(50)	NULL,
	title	varchar(50)	NULL,
	phone	bigint	NULL,
	fax	bigint	NULL,
	email	varchar(255)	NULL,
	comments	varchar(255)	NULL
);

CREATE TABLE policy_cars (
	-- populated by vehicles page, coverage page
	id	serial	PRIMARY KEY,
	policy_id	int	NOT NULL REFERENCES policy(id),
	car_id	int	NOT NULL REFERENCES car(id),
	pip_flag	bit(1)	NOT NULL	DEFAULT '0'::bit,
	-- updated by coverage page
	uninsured_motor_flag	bit(1)	NOT NULL	DEFAULT '0'::bit,
	-- updated by coverage page
	rental_flag	bit(1)	NOT NULL DEFAULT '0'::bit,
	-- updated by coverage page
	towing_flag	bit(1)	NOT NULL DEFAULT '0'::bit,
	-- updated by coverage page
	active	bit(1)	NOT NULL	DEFAULT '0'::bit,
	-- updated by policy.status update
	created_date	timestamp	NOT NULL,
	-- created_date now() at record creation
	updated_date	timestamp	NOT NULL
	-- updated_date now() at record creation and ANY update to record
);


CREATE TABLE audit (
	-- future scope
	id	serial	PRIMARY KEY,
	entity	varchar(25)	NOT NULL,
	field	varchar(50)	NOT NULL,
	type	varchar(10)	NOT NULL,
	-- type 'create, update, destroy',
	old_value	varchar(255)	NULL,
	new_value	varchar(255)	NULL,
	updated_by_id	int	NOT NULL,
	created_date	timestamp	NOT NULL
);

