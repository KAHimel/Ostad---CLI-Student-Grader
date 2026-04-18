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

// -------- Feature 2: Add Student --------
void addStudent(List<Map<String, dynamic>> students) {
  stdout.write('Enter student name: ');
  var name = stdin.readLineSync();

  if (name == null || name.trim().isEmpty) {
    print('Invalid name.');
    return;
  }

  // 21. Map, 24. Spread operator, 4. nullable fields
  var student = {
    'name': name.trim(),
    'scores': <int>[],
    'subjects': {...availableSubjects},
    'bonus': null,
    'comment': null,
  };

  students.add(student);

  // 11. string interpolation
  print('Student "${student['name']}" added successfully.');
}

// -------- Feature 3: Record Score --------
void recordScore(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students available.');
    return;
  }

  // 15. indexed for loop
  for (var i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]['name']}');
  }

  stdout.write('Select student: ');
  var index = int.tryParse(stdin.readLineSync() ?? '');

  if (index == null || index < 1 || index > students.length) {
    print('Invalid selection.');
    return;
  }

  var student = students[index - 1];
  var subjectList = [...student['subjects'] as Set<String>];

  print('Available subjects:');
  for (var i = 0; i < subjectList.length; i++) {
    print('${i + 1}. ${subjectList[i]}');
  }

  stdout.write('Choose subject: ');
  var subjectIndex = int.tryParse(stdin.readLineSync() ?? '');
  if (subjectIndex == null ||
      subjectIndex < 1 ||
      subjectIndex > subjectList.length) {
    print('Invalid subject selection.');
    return;
  }

  var selectedSubject = subjectList[subjectIndex - 1];
  int score;

  // 17. while loop validation
  while (true) {
    stdout.write('Enter score for $selectedSubject (0-100): ');
    var input = int.tryParse(stdin.readLineSync() ?? '');

    if (input != null && input >= 0 && input <= 100) {
      score = input;
      break;
    }
    print('Invalid score. Try again.');
  }

  // 19. List add
  (student['scores'] as List<int>).add(score);

  print('Score for $selectedSubject added successfully.');
}

// -------- Feature 4: Add Bonus --------
void addBonus(List<Map<String, dynamic>> students) {
  var student = selectStudent(students);
  if (student == null) return;

  stdout.write('Enter bonus (1-10): ');
  var bonus = int.tryParse(stdin.readLineSync() ?? '');

  if (bonus == null || bonus < 1 || bonus > 10) {
    print('Invalid bonus.');
    return;
  }

  // 6. ??=
  if (student['bonus'] == null) {
    student['bonus'] ??= bonus;
    print('Bonus added.');
  } else {
    print('Bonus already exists.');
  }
}

// -------- Feature 5: Add Comment --------
void addComment(List<Map<String, dynamic>> students) {
  var student = selectStudent(students);
  if (student == null) return;

  stdout.write('Enter comment: ');
  var comment = stdin.readLineSync();

  student['comment'] = comment;

  print('Comment added.');
}
