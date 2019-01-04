DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  address VARCHAR(255),
  email_address VARCHAR(100),
  animal_preference VARCHAR(50)
);

CREATE TABLE animals(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  type VARCHAR(50),
  breed VARCHAR(100),
  admission_date VARCHAR(20),
  training_complete BOOLEAN,
  health_check_complete BOOLEAN,
  ready_to_adopt BOOLEAN,
  adopted BOOLEAN
);

CREATE TABLE adoptions(
  id SERIAL4 PRIMARY key,
  owner_id INT4 REFERENCES owners(id),
  animal_id INT4 REFERENCES animals(id)
);
