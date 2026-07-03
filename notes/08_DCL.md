# DCL (Data Control Language)

## What is DCL?
    -> DCL stands for Data Control Language.
    -> DCL commands are used to control access to database objects.
    -> DCL manages user permissions and privileges.
    -> It helps provide database security.

## DCL Commands
1. GRANT
2. REVOKE

# 1. GRANT Command
    -> GRANT command is used to provide privileges to users or roles.
    -> It specifies what operations a user is allowed to perform.

### Syntax
    GRANT privilege_name
    ON table_name
    TO user_name;
### Example
    GRANT SELECT
    ON emp
    TO arshad;

### Multiple Privileges
    GRANT SELECT, INSERT, UPDATE
    ON emp
    TO arshad;
### Grant All Privileges
    GRANT ALL PRIVILEGES
    ON emp
    TO arshad;
### Common Privileges
    SELECT
        View table data.

    INSERT
        Insert new records.

    UPDATE
        Modify existing records.

    DELETE
        Delete records.

    ALL PRIVILEGES
        Grants all available privileges.

### Important Notes
    -> Only authorized users can grant privileges.
    -> Privileges can be granted to users or roles.
    -> Multiple privileges can be granted together.

### Interview Point
    Q. What is the purpose of GRANT?
    Ans.
        -> To provide permissions on database objects.

# 2. REVOKE Command
    -> REVOKE command is used to remove previously granted privileges.
    -> It prevents users from performing specific operations.

### Syntax
    REVOKE privilege_name
    ON table_name
    FROM user_name;
### Example
    REVOKE UPDATE
    ON emp
    FROM arshad;

### Revoke Multiple Privileges
    REVOKE INSERT, UPDATE
    ON emp
    FROM arshad;

### Revoke All Privileges
    REVOKE ALL PRIVILEGES
    ON emp
    FROM arshad;

### Important Notes
    -> Removes only specified privileges.
    -> User can no longer perform revoked operations.
    -> Does not delete the user account.

### Interview Point
    Q. What is the purpose of REVOKE?
    Ans.
        -> To remove previously granted privileges.

## GRANT vs REVOKE
    GRANT
        -> Gives permissions.
        -> Allows user access.
        -> Used to assign privileges.

    REVOKE
        -> Removes permissions.
        -> Restricts user access.
        -> Used to remove privileges.

## GRANT vs REVOKE

    Feature                 GRANT              REVOKE

    Purpose                 Give Permission    Remove Permission
    User Access             Allowed            Restricted
    Privileges              Added              Removed

## Real-Time Examples

### GRANT
    Allow an employee to view the EMP table.

### REVOKE
    Remove UPDATE permission from an employee.

---

## Summary
    GRANT
        Gives privileges to users.

    REVOKE
        Removes privileges from users.

## Most Asked Interview Questions
    Q. What is DCL?
    Ans.
        -> Data Control Language.
        -> Used to control database access.

    Q. Which DCL command provides permissions?
    Ans.
        -> GRANT

    Q. Which DCL command removes permissions?
    Ans.
        -> REVOKE

    Q. Can multiple privileges be granted together?
    Ans.
        -> Yes

    Q. Does REVOKE delete a user?
    Ans.
        -> No
        -> It only removes privileges.

## Interview Tips
    -> GRANT gives permissions.
    -> REVOKE removes permissions.
    -> DCL is mainly concerned with database security.
    -> Use minimum required privileges for every user.

---
## Performance Tips
### Best Practices
    -> Follow the Principle of Least Privilege.
    -> Grant only required permissions.
    -> Review user privileges regularly.
    -> Revoke unused permissions promptly.

### Common Mistakes
    -> Granting unnecessary privileges.
    -> Forgetting to revoke privileges after work is completed.
    -> Granting ALL PRIVILEGES when only SELECT is required.