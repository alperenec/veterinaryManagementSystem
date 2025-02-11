SELECT * FROM
dersler d INNER JOIN bolum b
ON d.bolumid=b.bolumid;

SELECT * FROM
dersler d LEFT JOIN bolum b
ON d.bolumid=b.bolumid;

SELECT * FROM
dersler d RIGHT JOIN bolum b
ON d.bolumid=b.bolumid;

CREATE TABLE products (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price NUMERIC(5,2)
);

INSERT INTO

products (name, price)

VALUES

('Phodsne',999.524),
('Tablsdet',5.21244);