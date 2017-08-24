DROP TABLE tags;
DROP TABLE transactions;

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  ID SERIAL PRIMARY KEY,
  amount INT,
  merchant VARCHAR(255),
  tag INT REFERENCES tags(id)
);
