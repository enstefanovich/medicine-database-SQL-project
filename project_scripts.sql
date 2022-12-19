-- Create the database, get rid tables if they already exist

CREATE DATABASE IF NOT EXISTS medicine;

USE medicine;

DROP TABLE IF EXISTS med_info;
DROP TABLE IF EXISTS store_inv_status;
DROP TABLE IF EXISTS store_inv;
DROP TABLE IF EXISTS store_info;

-- Create the tables

CREATE TABLE med_info
(
	pharm_id INT NOT NULL,
	pharm_name VARCHAR(200),
	classification VARCHAR(200),
	med_desc VARCHAR(1000),
	PRIMARY KEY (pharm_id)
);

CREATE TABLE store_inv
(
	item_id INT NOT NULL,
	store_id INT NOT NULL,
	pharm_id INT NOT NULL,
	pharm_conc INT,
	sec_ing_id INT,
	sec_ing_conc INT,
	brand VARCHAR(200),
	quant INT,
	form VARCHAR(200),
	full_name VARCHAR(200),
	PRIMARY KEY (item_id)
);

CREATE TABLE store_info
(
	store_id INT NOT NULL,
	store_name VARCHAR(200),
	address VARCHAR(200),
	city VARCHAR(200),
	state_abrv VARCHAR(200),
	zip INT,
	PRIMARY KEY (store_id)
);

CREATE TABLE store_inv_status
(
	item_id INT NOT NULL,
	store_id INT NOT NULL,
	price FLOAT,
	price_per FLOAT,
	avail BOOLEAN,
	timestmp DATE,
	FOREIGN KEY (item_id) REFERENCES store_inv(item_id),
	FOREIGN KEY (store_id) REFERENCES store_info(store_id)
);

-- Populate the tables

-- med_info
INSERT INTO med_info (pharm_id, pharm_name, classification, med_desc)
VALUES
	(1, 'acetaminophen', 'analgesic', 'it can treat minor aches and pains, and reduces fever.'),
	(2, 'ibuprofen', 'nonsteroidal anti-inflammatory drug', 'It can treat fever and mild to severe pain.'),
	(3, 'naproxen', 'nonsteroidal anti-inflammatory drug', 'It can treat fever and pain.'),
	(4, 'aspirin', 'nonsteroidal anti-inflammatory drug and blood thinners', 'It can treat pain, fever, headache, and inflammation. It can also reduce the risk of heart attack.'),
	(5, 'famotidine', 'antihistamine and antacid', 'It can treat ulcers, gastroesophageal reflux disease (GERD), and conditions that cause excess stomach acid. It can also treat heartburn caused by acid indigestion.'),
	(6, 'diphenhydramine', 'antihistamine', 'It can treat pain and itching caused by insect bites, minor cuts, burns, poison ivy, poison oak, and poison sumac when applied topically. In its oral form, it can treat hay fever, allergies, cold symptoms, and insomnia. In its injected form, it can treat severe allergic reactions, motion sickness, and symptoms of Parkinsons disease.'),
	(7, 'loratadine', 'antihistamine', 'It can treat allergy symptoms and hives.'),
	(8, 'bismuth subsalicylate', 'diarrhea medication', 'It can treat diarrhea, heartburn, nausea, and upset stomach.'),
	(9, 'diphenhydramine citrate', 'antihistamine', 'It can treat symptoms of allergy, hay fever, and the common cold.')
;

INSERT INTO store_inv (item_id, store_id, pharm_id, pharm_conc, sec_ing_id, sec_ing_conc, brand, quant, form, full_name)
VALUES
	(1, 1, 1, 250, 1, NULL, 'Advil', 72, 'caplet', 'Advil Dual Action with Acetaminophen combination of 250mg Ibuprofen and 500mg Acetaminophen Coated Caplets'),
	(2, 1, 1, 500, NULL, NULL, 'Up&Up', 100, 'gelcap', 'Acetaminophen Extra Strength Pain Reliever + Fever Reducer Quick Release Gelcaps - up & up - up & up'),
	(3, 1, 1, 325, NULL, NULL, 'Tylenol', 100, 'tablet', 'Tylenol Regular Strength Pain Reliever & Fever Reducer Tablets - Acetaminophen - 100ct'),
	(4, 1, 2, 200, NULL, NULL, 'Up&Up', 200, 'caplet', 'Ibuprofen (NSAID) Pain Reliever & Fever Reducer Caplets - 200ct - up & up'),
	(5, 1, 2, 200, 9, 38, 'Up&Up', 40, 'caplet', 'Ibuprofen (NSAID) PM Extra Strength Pain Reliever/Nighttime Sleep-Aid Caplets - up & up'),
	(6, 1, 2, 200, NULL, NULL, 'Advil', 100, 'tablet', 'Advil Pain Reliever/Fever Reducer Tablets - Ibuprofen (NSAID)'),
	(7, 1, 2, 200, NULL, NULL, 'Advil', 80, 'gelcap', 'Advil Pain Reliever/Fever Reducer Liqui-Gel Minis - Ibuprofen (NSAID)'),
	(8, 1, 2, 200, NULL, NULL, 'Motrin', 120, 'gelcap', 'Motrin IB Pain Reliever & Fever Reducer Liquid Gels - Ibuprofen (NSAID) - 120ct'),
	(9, 1, 2, 200, NULL, NULL, 'Welly', 50, 'softgel', 'Welly Ibuprofen Pain and Fever Reliever Softgels (NSAID) - 50ct')
;

INSERT INTO store_info (store_id, store_name, address, city, state_abrv, zip)
VALUES
	(1, 'Target', '1300 University Ave W', 'St Paul', 'MN', 55104),
	(2, 'Target', '2080 Ford Pkwy', 'St Paul', 'MN', 55116),
	(3, 'Target', '900 Nicollet Mall', 'Minneapolis', 'MN', 55403),
	(4, 'CVS', '30 Fairview Ave S', 'St Paul', 'MN', 55105),
	(5, 'CVS', '1040 Grand Ave', 'St Paul', 'MN', 55105),
	(6, 'Walgreens', '655 Nicollet Mall', 'Minneapolis', 'MN', 55402),
	(7, 'Walgreens', '630 Washington Ave SE', 'Minneapolis', 'MN', 55414),
	(8, 'Cub', '1440 University Ave W', 'St Paul', 'MN', 55104),
	(9, 'Cub', '2850 26th Ave S', 'Minneapolis', 'MN', 55406)
;

INSERT INTO store_inv_status (item_id, store_id, price, price_per, avail, timestmp)
VALUES
	(1, 1, 10.19, 0.141527778, TRUE, DATE('2022-10-28')),
	(2, 1, 4.99, 0.0499, TRUE, DATE('2022-10-28')),
	(3, 1, 7.99, 0.0779, TRUE, DATE('2022-10-28')),
	(4, 1, 3.89, 0.01945, TRUE, DATE('2022-10-28')),
	(5, 1, 6.49, 0.16225, TRUE, DATE('2022-10-28')),
	(6, 1, 11.49, 0.1149, TRUE, DATE('2022-10-28')),
	(7, 1, 10.29, 0.128625, TRUE, DATE('2022-10-28')),
	(8, 1, 15.99, 0.13325, TRUE, DATE('2022-10-28')),
	(9, 1, 11.99, 0.2398, TRUE, DATE('2022-10-28'))
;

SHOW TABLES;

-- Show me all medicines containing ibuprofen at all stores, and order by price per unit.

USE medicine;

SELECT
		m.pharm_name,
		sv.brand,
		sf.store_name,
		sv.pharm_conc,
		sv.quant,
		ss.price,
		ss.price_per
	FROM store_inv sv
	INNER JOIN med_info m
		ON sv.pharm_id = m.pharm_id
	INNER JOIN store_info sf
		ON sv.store_id = sf.store_id
	INNER JOIN store_inv_status ss
		ON sv.store_id = ss.store_id
		AND sv.item_id = ss.item_id
	WHERE m.pharm_name = 'ibuprofen'
	ORDER BY ss.price_per
;
		
-- Show me all medicines with a price per unit of 10 cents or less.

USE medicine;

SELECT
		m.pharm_name,
		sv.pharm_conc,
		ms.pharm_name AS second_ingredient,
		sv.sec_ing_conc,
		m.classification,
		sv.brand,
		sv.form,
		sv.quant,
		ss.price,
		ss.price_per,
		sf.store_name
	FROM store_inv sv
	INNER JOIN med_info m
		ON sv.pharm_id = m.pharm_id
	LEFT OUTER JOIN med_info ms
		ON sv.sec_ing_id = m.pharm_id
	INNER JOIN store_info sf
		ON sv.store_id = sf.store_id
	INNER JOIN store_inv_status ss
		ON sv.store_id = ss.store_id
		AND sv.item_id = ss.item_id
	WHERE ss.price_per <= 0.10
	ORDER BY ss.price_per
;

-- Show me all the stores in my ZIP code and what brands they carry.

USE medicine;

SELECT
		GROUP_CONCAT(DISTINCT sv.brand) AS brands,
		si.store_name,
		si.address,
		si.city,
		si.state_abrv,
		si.zip
		FROM store_info si
		LEFT OUTER JOIN store_inv sv
			ON si.store_id = sv.store_id
		WHERE si.zip = 55104
;