// -------- Feature 1: App Setup + Menu Loop --------

import 'dart:io';

// 1. const
const String appTitle = 'Student Grader v1.0';

// 2. final
final Set<String> availableSubjects = {'Math', 'English', 'Science', 'History'};

void main() {
  // 1. var (mutable state)
  var students = <Map<String, dynamic>>[];
  var isRunning = true;

  // 18. do-while loop
  do {
    printMenu();

    stdout.write('Choose an option: ');
    var choice = stdin.readLineSync()?.trim();

    // 14. switch statement
    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        recordScore(students);
        break;
      case '3':
        addBonus(students);
        break;
      case '4':
        addComment(students);
        break;
      case '5':
        viewAllStudents(students);
        break;
      case '6':
        viewReportCard(students);
        break;
      case '7':
        classSummary(students);
        break;
      case '8':
        print('Exiting application...');
        isRunning = false;
        break;
      default:
        print('Invalid option. Try again.');
    }
  } while (isRunning);
}

// 12. multi-line string
void printMenu() {
  print("""
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit
""");
}
