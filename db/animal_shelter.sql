DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  postcode VARCHAR(255),
  tel_number VARCHAR(255),
  email_address VARCHAR(255)
);

CREATE TABLE animals(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  animal_type VARCHAR(255),
  admission_date VARCHAR(20),
  completed_training BOOLEAN,
  health_check_complete BOOLEAN,
  ready_to_adopt BOOLEAN,
  owner_id INT8 REFERENCES owners(id)
);
