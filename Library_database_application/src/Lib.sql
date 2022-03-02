Create Table STAFF
	(Staff_id	INT	NOT NULL,
	Lname		VARCHAR(50)	NOT NULL,
	Fname		VARCHAR(50)	NOT NULL,
	Designation	VARCHAR(50),
	PRIMARY KEY (Staff_id));

Create Table BOOKS
	(ISBN	CHAR(13) Not Null,
    Title	varchar(500)	Not Null,
    Author	varchar(500)	Not Null,
    Descr	varchar(5000),
    Sub_area	Varchar(500),
    Location	Varchar(500),
    Acq_flag	boolean Not null,
    lend_flag	boolean	Not null,
    Staff_id	int	Not null,
    primary key(ISBN),
    Foreign Key (Staff_id) references STAFF(Staff_id));
    
Create Table Members
	(M_id int	Not Null,
    SSN	varchar(9)	Not Null,
    Name	Varchar(50)	Not Null,
    Mail_add	Varchar(100),
    Camp_add	Varchar(100),
    ph_no	varchar(10),
    Prf_flag	boolean	Not null,
    Prsn_flag	boolean Not null,
    Exp_date Date,
    primary key(M_id),
    Unique(SSN));
    
Create Table DAY_PASS
	(Pass_no	int	not null,
    Name varchar(50),
    Date	date,
    primary key(Pass_no));
    
Create	Table VISIT
	(Visit_id	int	not null,
    M_id	Int	Not null,
    Pass_no	int	Not null,
#    relation_flag boolean,
    Date	date	Not null,
    In_time	time not null,
    out_time time not null,
    primary key(Visit_id,M_id,Pass_no),
    Foreign Key (M_id) references MEMBERS(M_id),
    Foreign Key (Pass_no) references DAY_PASS(Pass_no));

Create Table BORROWS
	(Issue_id Int not null,
    ISBN char(13) not null,
    M_id Int	Not null,
    Check_out_date date	not null,
    return_date	date,
    primary key (Issue_id,ISBN,M_id),
	Foreign Key (M_id) references MEMBERS(M_id),
    Foreign Key (ISBN) references BOOKS(ISBN));
    