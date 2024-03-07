
-- adding a project_index relation
ALTER TABLE basic_projects
ADD COLUMN project_index INTEGER;

-- copying values from index to project_index
UPDATE basic_projects
SET project_index = index;

-- creating a projects table for all projects
CREATE TABLE projects (
    index SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    difficulty INTEGER CHECK (difficulty >= 1 AND difficulty <= 5),
    start DATE,
    completion DATE
);

-- taking values from basic_projects
INSERT INTO projects (name, description, difficulty)
SELECT name, description, difficulty
FROM basic_projects;

-- taking values from complex_projects
INSERT INTO projects (name, description, difficulty)
SELECT name, description, difficulty
FROM complex_projects;

-- removing columns from basic_projects and establishing association between projects and basic_projects
ALTER TABLE basic_projects
DROP COLUMN name,
DROP COLUMN description,
DROP COLUMN difficulty,
DROP COLUMN project_index,
ADD CONSTRAINT fk_basic_projects_projects
FOREIGN KEY (index)
REFERENCES projects (index);

-- establishing a relationship between projects and complex_projects
ALTER TABLE complex_projects
ADD COLUMN project_id INTEGER,
ADD CONSTRAINT fk_complex_project_project_id
FOREIGN KEY (project_id) REFERENCES projects(index);

-- adding values to project_id to complex_values
UPDATE complex_projects
SET project_id = projects.index
FROM projects
WHERE projects.name = complex_projects.name;

-- removing unncessary columns form complex_projects
ALTER TABLE complex_projects
DROP COLUMN name,
DROP COLUMN description,
DROP COLUMN difficulty
