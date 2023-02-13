CREATE DATABASE gqlms;

-- Read-write role
CREATE ROLE api_read_write_role;

GRANT CONNECT ON DATABASE gqlms TO api_read_write_role;

CREATE SCHEMA IF NOT EXISTS customer AUTHORIZATION api_read_write_role;
CREATE SCHEMA IF NOT EXISTS inventory AUTHORIZATION api_read_write_role;
CREATE SCHEMA IF NOT EXISTS invoice AUTHORIZATION api_read_write_role;
CREATE SCHEMA IF NOT EXISTS shipping AUTHORIZATION api_read_write_role;
CREATE SCHEMA IF NOT EXISTS history AUTHORIZATION api_read_write_role;

GRANT USAGE, CREATE ON SCHEMA customer TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA inventory TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA invoice TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA shipping TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA history TO api_read_write_role;


ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA customer
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO api_read_write_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA inventory
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO api_read_write_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA invoice
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO api_read_write_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA shipping
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO api_read_write_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA history
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO api_read_write_role;


-- Read role
CREATE ROLE api_read_role;

GRANT CONNECT ON DATABASE gqlms TO api_read_role;

GRANT USAGE ON SCHEMA history TO api_read_role;
GRANT USAGE ON SCHEMA customer TO api_read_role;
GRANT USAGE ON SCHEMA inventory TO api_read_role;
GRANT USAGE ON SCHEMA invoice TO api_read_role;
GRANT USAGE ON SCHEMA shipping TO api_read_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_role IN SCHEMA history
GRANT SELECT ON TABLES TO api_read_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_role IN SCHEMA customer
GRANT SELECT ON TABLES TO api_read_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_role IN SCHEMA inventory
GRANT SELECT ON TABLES TO api_read_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_role IN SCHEMA invoice
GRANT SELECT ON TABLES TO api_read_role;

ALTER DEFAULT PRIVILEGES FOR ROLE api_read_role IN SCHEMA shipping
GRANT SELECT ON TABLES TO api_read_role;

-- User
CREATE USER apiwriter WITH PASSWORD 'apiwriter';
GRANT api_read_write_role TO apiwriter;

CREATE USER apireader WITH PASSWORD 'apireader';
GRANT api_read_role TO apireader;


