-- Read-write role
CREATE ROLE api_read_write_role;

GRANT CONNECT ON DATABASE gqlms TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA customer TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA inventory TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA invoice TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA shipping TO api_read_write_role;
GRANT USAGE, CREATE ON SCHEMA history TO api_read_write_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA customer TO api_read_write_role;
ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA customer;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA inventory TO api_read_write_role;
ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA inventory;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA invoice TO api_read_write_role;
ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA invoice;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA shipping TO api_read_write_role;
ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA shipping;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA history TO api_read_write_role;
ALTER DEFAULT PRIVILEGES FOR ROLE api_read_write_role IN SCHEMA history;



-- Read role
CREATE ROLE api_read_role;

GRANT CONNECT ON DATABASE gqlms TO api_read_role;
GRANT USAGE ON SCHEMA history TO api_read_role;
GRANT USAGE ON SCHEMA customer TO api_read_role;
GRANT USAGE ON SCHEMA inventory TO api_read_role;
GRANT USAGE ON SCHEMA invoice TO api_read_role;
GRANT USAGE ON SCHEMA shipping TO api_read_role;

GRANT SELECT ON ALL TABLES IN SCHEMA history TO api_read_role;
GRANT SELECT ON ALL TABLES IN SCHEMA customer TO api_read_role;
GRANT SELECT ON ALL TABLES IN SCHEMA inventory TO api_read_role;
GRANT SELECT ON ALL TABLES IN SCHEMA invoice TO api_read_role;
GRANT SELECT ON ALL TABLES IN SCHEMA shipping TO api_read_role;

-- Users
CREATE USER apiwriter WITH PASSWORD apiwriter;
GRANT api_read_write_role TO gqlms;

CREATE USER apireader WITH PASSWORD apireader;
GRANT api_read_role TO gqlms;




