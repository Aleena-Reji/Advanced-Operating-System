CREATE TABLE sessional_Exam88 (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    subject1 NUMBER,
    subject2 NUMBER,
    subject3 NUMBER,
    total_marks NUMBER
);

INSERT INTO sessional_Exam88 VALUES (101, 'Alice', 80, 75, 90, NULL);
INSERT INTO sessional_Exam88 VALUES (102, 'Bob', 70, 85, 95, NULL);
INSERT INTO sessional_Exam88 VALUES (103, 'Charlie', 60, 65, 70, NULL);

COMMIT;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE calculate_total(
    rno IN NUMBER
)
IS
    m1 NUMBER;
    m2 NUMBER;
    m3 NUMBER;
    tot NUMBER;
BEGIN
    SELECT subject1, subject2, subject3
    INTO m1, m2, m3
    FROM sessional_Exam88
    WHERE student_id = rno;

    tot := m1 + m2 + m3;

    UPDATE sessional_Exam88
    SET total_marks = tot
    WHERE student_id = rno;

    DBMS_OUTPUT.PUT_LINE('TOTAL MARKS FOR Rollno ' || rno || ' : ' || tot);

END;
/
BEGIN
    calculate_total(101); 
END;
/
