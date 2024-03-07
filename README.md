## Projects Database Schema

## Overview

This repository contains the PostgreSQL database schema for managing and tracking a variety of projects, including basic and complex projects. It includes definitions and relationships for projects, categorized by different criteria, and tool usage.

## Schema Overview

The database schema comprises several tables, each serving a unique role in project management:

- **`projects`**: Stores general information about each project, including name, description, difficulty, start, and completion dates. It is the central table that connects with both `basic_projects` and `complex_projects`.

- **`basic_projects`**: Details specific to basic projects. Linked to `projects` through a foreign key to establish a relationship.

- **`complex_projects`**: Holds information for complex projects with additional attributes. It is also linked to the `projects` table.

- **`categories`**: Categorizes projects and tools into various types or classifications.

- **`data`**: Contains data sources and datasets used within or for the projects.

- **`tools`**: Lists tools associated with project categories, aiding in project development or management.

## Key Relationships

- **Projects and Basic/Complex Projects**: `basic_projects` and `complex_projects` are connected to `projects` via foreign keys, ensuring referential integrity and facilitating project categorization.

- **Category Associations**: Both projects and tools are associated with `categories`, enabling a structured classification system.

- **Tools and Projects**: The `tools` table is designed to link with project categories, illustrating the tools used across different project types.

## Repository Structure

- `README.md`: Provides an overview and guide for the database schema.
- `migrations/`: Contains SQL migration scripts for evolving the database schema.
- `projects_schema.sql`: The latest comprehensive schema definition, reflecting the current database. Running migration scripts should allow you to get to the schema structure, if needed.

## Getting Started

### Applying the Schema

1. Ensure PostgreSQL is installed and running on your system.
2. Create a new database, if necessary, using the `createdb` command.
3. Apply the schema file to your database with the following command:
   ```bash
   psql -U your_username -d your_database_name -f projects_schema.sql

## Migration Scripts

- To modify or update the schema, navigate to the `migrations/` directory and apply the relevant migration scripts in chronological order.

## Contributing

We welcome contributions and enhancements to our database schema. Please adhere to the following guidelines:

- Fork the repository and create a new branch for your changes.
- Add or update migration scripts for any schema modifications.
- Submit a pull request with a clear description of your changes.

Thank you for contributing to our project management database schema!

