-- Create schemaless user table.
DEFINE TABLE user SCHEMALESS;

-- Define some fields.
DEFINE FIELD firstName ON TABLE user TYPE string
  ASSERT $value != NONE;
DEFINE FIELD lastName ON TABLE user TYPE string
  ASSERT $value != NONE;
DEFINE FIELD email ON TABLE user TYPE string
  ASSERT $value != NONE AND is::email($value);
DEFINE INDEX userEmailIndex ON TABLE user COLUMNS email UNIQUE;

-- SEE IT IN ACTION - Example 1
-- 1: Add a user with all required fields and an undefined one.
CREATE user SET firstName = 'Tobie', lastName = 'Hitchcock', email = 'Tobie.Hitchcock@surrealdb.com', photoURI = 'photo/yxCFi22Jw2.webp';
-- 2: Statement will succeed because user is a SCHEMALESS table.

-- SEE IT IN ACTION - Example 2
-- 1: Add a user with an invalid email address and include a new field that was never defined.
CREATE user SET firstName = 'Jamie', lastName = 'Hitchcock', email = 'Jamie.Hitchcock', photoURI = 'photo/yxCFi22Jw2.webp';
-- 2: Statement will fail because the value for email was not valid.