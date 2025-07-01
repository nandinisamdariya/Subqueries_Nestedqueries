# 🧠 Task 6: Subqueries and Nested Queries (MySQL)

## 📋 Objective
Demonstrate advanced SQL querying techniques using subqueries and nested logic inside `SELECT`, `WHERE`, `FROM`, and `UPDATE` clauses.

## 🛠️ Tools Used
- **MySQL Workbench**
- **Database Name**: `task6_subqueries`

---

## 🧱 Database Schema

### 🔹 Departments Table
| Column    | Data Type     | Constraint        |
|-----------|---------------|------------------|
| DeptID    | INT           | PRIMARY KEY      |
| DeptName  | VARCHAR(50)   |                  |

### 🔹 Employees Table
| Column    | Data Type     | Constraint        |
|-----------|---------------|------------------|
| EmpID     | INT           | PRIMARY KEY      |
| EmpName   | VARCHAR(100)  |                  |
| Salary    | INT           |                  |
| DeptID    | INT           | FOREIGN KEY → Departments(DeptID) |

---

## 🧪 Sample Data

- **4 Departments**: IT, HR, Finance, Marketing
- **7 Employees** with various salaries and departments

---

## 📌 Key SQL Queries Demonstrated

### ✅ 1. Scalar Subquery in `SELECT`
Show each employee’s salary and their department’s average salary.

### ✅ 2. Subquery in `WHERE` with `IN`
Find employees working in departments where someone earns more than ₹80,000.

### ✅ 3. Correlated Subquery with `EXISTS`
List employees who earn less than someone else in the same department.

### ✅ 4. Scalar Subquery with `=`
Find employee(s) with the highest salary in the entire company.

### ✅ 5. Subquery in `FROM` (Derived Table)
Display department-wise average salaries using a subquery table.

### ✅ 6. UPDATE using Subquery with JOIN
Raise salary by 10% for employees earning below their department’s average.

### ✅ 7. Subquery for Second Highest Salary
Classic query to return the second top salary in the company.

---


