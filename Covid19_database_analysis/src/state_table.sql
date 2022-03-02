CREATE TABLE STATE
		(State_id INT NOT NULL,
		State VARCHAR(50) NOT NULL,
		Abbreviation CHAR(2) NOT NULL,
		YearOfStatehood INT,
		Capital VARCHAR(50),
		Capital_Since INT,
		LandArea DECIMAL(10,5),
		IsPopulousCity VARCHAR(3),
		MunicipalPopulation INT,
		MetroPopulation INT,
		PRIMARY KEY (State));

CREATE TABLE COUNTY
		(State VARCHAR(50) NOT NULL,
		County VARCHAR(50) NOT NULL,
		Population INT,
		Latitude DECIMAL(12,8),
		Longitude DECIMAL(12,8),
		PRIMARY KEY (County),
		FOREIGN KEY (State) REFERENCES STATE(State));

CREATE TABLE CONFIRMED_CASES
		(State VARCHAR(50) NOT NULL,
		County VARCHAR(50) NOT NULL,
		Test_Date DATE NOT NULL,
		Positive_Count INT,
		PRIMARY KEY (State,County,Test_Date),
		FOREIGN KEY (State) REFERENCES STATE(State),
		FOREIGN KEY (County) REFERENCES County(County));

CREATE TABLE DEATHS
		(State VARCHAR(50) NOT NULL,
		County VARCHAR(50) NOT NULL,
		Report_Date DATE NOT NULL,
		Death_Count INT,
		PRIMARY KEY (State,County,Report_Date),
		FOREIGN KEY (State) REFERENCES STATE(State),
		FOREIGN KEY (County) REFERENCES County(County));

CREATE TABLE VACCINATIONS
		(State VARCHAR(50) NOT NULL,
		Total_Distributed INT,
		Total_Administered INT,
		Distributed_per_100k INT,
		Administered_per_100k INT,
		People_W1_Doses INT,
		People_W1_Doses_100k INT,
		People_W2_Doses INT,
		People_W2_Doses_100k INT,
		PRIMARY KEY (State),
		FOREIGN KEY (State) REFERENCES STATE(State));
		
		
		