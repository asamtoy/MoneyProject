DROP TABLE tags;
DROP TABLE transactions;

CREATE TABLE tags (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  ID SERIAL8 primary key,
  amount INT,
  merchant VARCHAR(255),
  tag INT8 REFERENCES tags(id)
);
