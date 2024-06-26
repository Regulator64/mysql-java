DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project_category;


CREATE TABLE project_category (
	project_id INT NOT NULL /*foreign key, unique key with category_id*/,
	category_id INT NOT NULL /*foreign key, unique key with project_id*/,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL /*primary key*/,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL /*primary key*/,
	project_id INT NOT NULL /*foreign key*/,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL /*primary key*/,
	project_id INT NOT NULL /*foreign key*/,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL /*primary key*/,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);









