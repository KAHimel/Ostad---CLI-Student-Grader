# 🎓 CLI Student Grader (Dart)

A beginner-friendly yet **industry-structured** command-line application built with Dart that allows teachers to manage students, record scores, calculate grades, and generate report cards.

---

## 🚀 Project Overview

This project is a **menu-driven CLI application** that demonstrates core Dart fundamentals through a real-world use case.

You can:

* Add students
* Record subject-wise scores
* Assign bonus points
* Add teacher comments
* View report cards
* Generate class summaries

---

## 🧠 Learning Objectives

This project was built to practice and demonstrate:

* Dart fundamentals (Week 1–2 concepts)
* Clean code structure
* Input validation
* CLI interaction
* Data modeling using Map, List, Set

---

## 📋 Features

### 1️⃣ Add Student

* Creates a new student
* Uses spread operator for subjects
* Initializes nullable fields

---

### 2️⃣ Record Score

* Select student
* Select subject
* Input validated (0–100)
* Score added to list

---

### 3️⃣ Add Bonus Points

* Adds bonus (1–10)
* Uses `??=` to prevent overwrite

---

### 4️⃣ Add Comment

* Stores optional teacher feedback
* Uses null-aware operators (`?.`, `??`)

---

### 5️⃣ View All Students

* Displays all students
* Shows score count
* Conditional bonus tag ⭐

---

### 6️⃣ View Report Card

Example output:

```
╔═══════════════════════════════════════════════╗
║  REPORT CARD                                  ║
╠═══════════════════════════════════════════════╝
║  Name     : Himel                            
║  Scores   : 100                              
║  Bonus    : +10                              
║  Average  : 100.00                           
║  Grade    : A                                
║  Comment  : VERY GOOD!                       
║  Feedback : Outstanding performance!         
╚═══════════════════════════════════════════════╝
```

* Calculates average
* Applies bonus
* Caps at 100
* Assigns grade (A–F)
* Generates feedback using `switch`

---

### 7️⃣ Class Summary

Displays:

* Total students
* Class average
* Highest & lowest scores
* Passing students
* Unique grades (Set)

---

## 🧩 Dart Concepts Used (All 24)

| Concept                            | Used |
| ---------------------------------- | ---- |
| var                                | ✅    |
| final                              | ✅    |
| const                              | ✅    |
| Nullable types (`int?`, `String?`) | ✅    |
| `??`                               | ✅    |
| `??=`                              | ✅    |
| `?.`                               | ✅    |
| Arithmetic operators               | ✅    |
| Relational operators               | ✅    |
| Logical operators                  | ✅    |
| String interpolation               | ✅    |
| Multi-line strings                 | ✅    |
| if / else if / else                | ✅    |
| switch (statement + expression)    | ✅    |
| for loop (indexed)                 | ✅    |
| for-in loop                        | ✅    |
| while loop                         | ✅    |
| do-while loop                      | ✅    |
| List                               | ✅    |
| Set                                | ✅    |
| Map                                | ✅    |
| Collection if                      | ✅    |
| Collection for                     | ✅    |
| Spread operator                    | ✅    |

---

## 🛠️ How to Run

### 1. Clone the repository

```bash
git clone https://github.com/your-username/cli-student-grader.git
cd cli-student-grader
```

### 2. Run the app

```bash
dart run
```

---

## ⚠️ Important Note

❌ Do NOT run using VS Code "Run Code" button
✅ Always use terminal (`dart run`)

---

## 🧑‍💻 Author

**Kowshik Ahamed Himel**

---

## ⭐ Final Thoughts

This project demonstrates how **basic Dart concepts** can be combined to build a **real, usable application**.

---

🔥 If you found this helpful, consider giving the repo a star!  
