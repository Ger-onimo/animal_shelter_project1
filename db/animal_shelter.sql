DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  postcode VARCHAR(10),
  tel_number VARCHAR(20),
  email_address VARCHAR(255), -- perhaps add 'meets suitability criteria'
  animal_adopted VARCHAR(50)
);

CREATE TABLE animals(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  animal_type VARCHAR(255),
  admission_date VARCHAR(20), -- can this be done any other way than VARCHAR?? DATE maybe.
  completed_training BOOLEAN, -- full training complete? T/F
  completed_health_check BOOLEAN, -- full health check complete? T/F
  ready_to_adopt BOOLEAN, -- when training and health_check = true.
  adopted_by VARCHAR(100),
  owner_id INT4 REFERENCES owners(id)
);
