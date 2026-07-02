# TCL (Transaction Control Language)

## What is TCL?
    -> TCL stands for Transaction Control Language.
    -> TCL commands are used to manage transactions in a database.
    -> TCL ensures that changes made by DML commands are either permanently
    saved or discarded.

## What is a Transaction?
    -> A transaction is a sequence of one or more SQL statements executed as
    a single unit of work.
    -> A transaction begins with the first DML statement.
    -> A transaction ends when COMMIT or ROLLBACK is executed.
### Example
    UPDATE emp
    SET sal = sal + 1000
    WHERE deptno = 10;

    DELETE FROM emp
    WHERE empno = 7900;

    COMMIT;

### Important Notes
    -> DDL commands perform an automatic COMMIT.
    -> TCL commands mainly work with DML statements.
    -> A transaction ensures data consistency.

## TCL Commands
1. COMMIT
2. ROLLBACK
3. SAVEPOINT

# 1. COMMIT Command
    -> COMMIT permanently saves all changes made during the current
    transaction.

### Syntax
    COMMIT;
### Example
    UPDATE emp
    SET sal = 5000
    WHERE empno = 7369;

    COMMIT;

### Result
    -> Changes are permanently saved.
    -> Changes cannot be rolled back.

### Important Notes
    -> COMMIT ends the current transaction.
    -> Other users can view committed changes.
    -> COMMIT makes changes permanent.

### Interview Point
    Q. What is the purpose of COMMIT?
    Ans.
        -> To permanently save the transaction.

# 2. ROLLBACK Command
    -> ROLLBACK cancels all uncommitted changes made during the current
    transaction.

### Syntax
    ROLLBACK;
### Example
    UPDATE emp
    SET sal = 6000
    WHERE empno = 7369;

    ROLLBACK;

### Result
    -> Original data is restored.
    -> Uncommitted changes are discarded.
    
### Important Notes
    -> Works only before COMMIT.
    -> Restores the previous state of the transaction.
    -> Cannot undo committed changes.

### Interview Point
    Q. Can ROLLBACK undo committed changes?
    Ans.
        -> No

# 3. SAVEPOINT Command
    -> SAVEPOINT creates a checkpoint within a transaction.
    -> It allows partial rollback instead of rolling back the entire
    transaction.

### Syntax
    SAVEPOINT savepoint_name;
### Example
    UPDATE emp
    SET sal = 4000
    WHERE empno = 7369;

    SAVEPOINT sp1;

    UPDATE emp
    SET sal = 5000
    WHERE empno = 7499;

### Important Notes
    -> Multiple SAVEPOINTS can exist in one transaction.
    -> Used in large transactions.
    -> Helps recover part of a transaction.

### Interview Point
Q. What is the purpose of SAVEPOINT?
Ans.
    -> To create a checkpoint inside a transaction.

## ROLLBACK TO SAVEPOINT
    -> ROLLBACK TO SAVEPOINT is used to return to a previously created
    SAVEPOINT.
    -> Changes made after the SAVEPOINT are undone.
    -> Changes made before the SAVEPOINT remain unchanged.

### Syntax
    ROLLBACK TO savepoint_name;
### Example
    UPDATE emp
    SET sal = 3000
    WHERE empno = 7369;

    SAVEPOINT sp1;

    UPDATE emp
    SET sal = 4000
    WHERE empno = 7499;

    ROLLBACK TO sp1;

### Result
    -> Changes before SAVEPOINT remain.
    -> Changes after SAVEPOINT are cancelled.

### Important Notes
    -> SAVEPOINT must already exist.
    -> Only changes after the SAVEPOINT are rolled back.
    -> Transaction continues after rollback.

### Interview Point
    Q. Does ROLLBACK TO SAVEPOINT end the transaction?
    Ans.
        -> No

## COMMIT vs ROLLBACK
    COMMIT

        -> Permanently saves changes.
        -> Ends the transaction.
        -> Changes cannot be undone.

    ROLLBACK

        -> Cancels uncommitted changes.
        -> Restores previous data.
        -> Does not affect committed changes.

## COMMIT vs ROLLBACK
    Feature                 COMMIT             ROLLBACK

    Saves Changes           Yes                No
    Undoes Changes          No                 Yes
    Ends Transaction        Yes                No
    Permanent               Yes                No

## Transaction Flow
    START TRANSACTION
            |
            V

        INSERT
        UPDATE
        DELETE
            |
            V

    SAVEPOINT (Optional)
            |
            V

    COMMIT --------> Changes Saved

        OR

    ROLLBACK ------> Changes Cancelled

## Real-Time Examples

### COMMIT
    Save employee salary updates permanently.

### ROLLBACK
    Cancel incorrect salary updates before saving.

### SAVEPOINT
    Roll back only the last part of a transaction without affecting
    previous updates.

---
## Summary
    COMMIT
        Permanently saves changes.

    ROLLBACK
        Cancels uncommitted changes.

    SAVEPOINT
        Creates a checkpoint within a transaction.

    ROLLBACK TO SAVEPOINT
        Rolls back only the changes made after a SAVEPOINT.

## Most Asked Interview Questions
    Q. What is TCL?
    Ans.
        -> Transaction Control Language.
        -> Used to manage database transactions.

    Q. Which command permanently saves a transaction?
    Ans.
        -> COMMIT

    Q. Which command cancels uncommitted changes?
    Ans.
        -> ROLLBACK

    Q. What is the purpose of SAVEPOINT?
    Ans.
        -> To create a checkpoint within a transaction.

    Q. Can ROLLBACK undo committed changes?
    Ans.
        -> No

    Q. Can multiple SAVEPOINTS exist in one transaction?
    Ans.
        -> Yes

    Q. What is the difference between ROLLBACK and
    ROLLBACK TO SAVEPOINT?
    Ans.
        -> ROLLBACK cancels the entire transaction.
        -> ROLLBACK TO SAVEPOINT cancels only the changes made after the
        specified SAVEPOINT.

## Interview Tips
    -> COMMIT makes changes permanent.
    -> ROLLBACK cancels uncommitted changes.
    -> SAVEPOINT creates a checkpoint.
    -> ROLLBACK TO SAVEPOINT performs a partial rollback.
    -> DDL statements generally perform an automatic COMMIT.

---

## Performance Tips
### Best Practices
    -> Use COMMIT only after verifying all changes.
    -> Use SAVEPOINT in long transactions.
    -> Always test UPDATE and DELETE statements before COMMIT.
    -> Keep transactions as short as possible to avoid locking issues.

### Common Mistakes
    -> Forgetting to execute COMMIT after successful DML operations.
    -> Assuming ROLLBACK can undo committed changes.
    -> Creating a SAVEPOINT after executing COMMIT.
    -> Using SAVEPOINT without understanding transaction boundaries.
