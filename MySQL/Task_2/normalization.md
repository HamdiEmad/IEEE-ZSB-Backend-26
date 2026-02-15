# Normalization

### 1. What is normalization ?
It is the process of refactoring (decomposing) unsatisfactory relatioships by breaking up their attributes into smaller relations(tables).

### 2. Examples of relations that need to be normalized:- 

1. Multivalued Attributes
    - Attributes with repeated value like phone number which can have many values (not atomic).

2. Partial dependency 
    - when a part of composite key determines another attribute.

3. Transitive Dependency
    - When an non-key attribute depends on another non-key attribute.

4. Derived attributes
    - Attributes that can be calculated from another attributes like birthdate and age.

5. Storing multiple data in one attribute
    - It can be called a composite attribute which have multiple attibutes in it like address.

### 3. Normal forms based on primary keys:- 

1. First Normal Form (1NF)
    - The relation has a primary key.
    - All attributes are atomic (remove all multivalued / composite attributes).
    - No repeating groups (No nested relations).

2. Second Normal Form (2NF)
    - The relation must be on 1NF.
    - No partial dependencies.
    - Any non-prime key attribute must depend on the primary key.

3. Third Normal Form (3NF)
    - Must be on 2NF.
    - No transitive dependencies (When a non-prime key depends on another non-prime key).

&nbsp;&nbsp;&nbsp;

# Our example

>The university administration has sent you a messy Excel sheet named Legacy_Data containing the following columns in a single table: Student_Grade_Report (Student_Name, Student_Phone, Student_Address, Course_Title, Instructor_Name, Instructor_Dept, Dept_Building, Grade).

## Issues in our example

1. Multi-valued: The Student_Phone cell often contains
multiple numbers.
2. Partial Dependency: Student_Address is mixed (City,
Street, Zip) and repeats unnecessarily.
3. Transitive Dependency: Dept_Building depends on
Instructor_Dept, not on the Student or the Course.

&nbsp;&nbsp;&nbsp;

## 1NF
We have to remove the maultivalued attribute called 'Student_name' and separate it in a single table so the tables will be like this:- 

- Student

    | Student_id | Student_Name | City | Street | Zip |

- Student Phone

    | Student_id | phone |

- Grade report

    | Student_id | Course_Title | Instructor_Name | Instructor_Dept | Dept_Building | Grade |

## 2NF
In Grade report in 1NF, Instructor_Dept depends only on instructor and Dept_Building depends only on Instructor_Dept which are partial dependencies and to normalize it:-

- Student

    | Student_id | Student_Name | City | Street | Zip |

- Student Phone

    | Student_id | phone |

- Course

    | Course_ID | Course_Title | Instructor_ID |

- Instructor

    | Instructor_ID | Instructor_Name | Instructor_Dept | Dept_Building |

- Enrollments

    | Student_ID | Course_ID | Grade |

## 3NF
Also after 2NF, the Dept_Building depends on Instructor_Dept and Instructor_Dept depends on Instructor_id which is transtive dependency.

- Student

    | Student_id | Student_Name | City | Street | Zip |

- Student Phone

    | Student_id | phone |

- Course

    | Course_ID | Course_Title | Instructor_ID |

- Instructor

    | Instructor_ID | Instructor_Name | Dept_ID |

- Department

    | Dept_ID | Dept_Name | Dept_Building |

- Enrollments

    | Student_ID | Course_ID | Grade |

&nbsp;&nbsp;&nbsp;

### Finally, we made our single table on 3FN with 6 tables.