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

// -------- Feature 6: View All Students --------
void viewAllStudents(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students found.');
    return;
  }

  // 16. for-in loop
  for (var student in students) {
    // 22. collection if
    var tags = [
      student['name'],
      '${(student['scores'] as List<int>).length} scores',
      if (student['bonus'] != null) '⭐ Has Bonus',
    ];

    print(tags.join(' | '));
  }
}

// -------- Feature 7: Report Card --------
void viewReportCard(List<Map<String, dynamic>> students) {
  var student = selectStudent(students);
  if (student == null) return;

  var scores = student['scores'] as List<int>;

  if (scores.isEmpty) {
    print('No scores available.');
    return;
  }

  // 8. arithmetic operators
  var sum = 0;
  for (var s in scores) {
    sum += s;
  }

  var rawAvg = sum / scores.length;

  // 5. ?? (null fallback)
  var bonus = student['bonus'] ?? 0;

  var finalAvg = rawAvg + bonus;
  if (finalAvg > 100) finalAvg = 100;

  // 9 & 13. relational + if/else
  String grade;
  if (finalAvg >= 90) {
    grade = 'A';
  } else if (finalAvg >= 80) {
    grade = 'B';
  } else if (finalAvg >= 70) {
    grade = 'C';
  } else if (finalAvg >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  // 7. ?. and ?? usage
  var comment = student['comment']?.toUpperCase() ?? 'No comment provided';

  // 14. switch expression
  var feedback = switch (grade) {
    'A' => 'Outstanding performance!',
    'B' => 'Good work, keep it up!',
    'C' => 'Satisfactory. Room to improve.',
    'D' => 'Needs improvement.',
    'F' => 'Failing. Please seek help.',
    _ => 'Unknown grade.',
  };

  print("""
╔═══════════════════════════════════════════════╗
║  REPORT CARD                                  ║
╠═══════════════════════════════════════════════╝
║  Name     : ${student['name']}                  
║  Scores   : $scores                             
║  Bonus    : +$bonus                             
║  Average  : ${finalAvg.toStringAsFixed(2)}      
║  Grade    : $grade                              
║  Comment  : $comment                            
║  Feedback : $feedback                                        
╚═══════════════════════════════════════════════╝
""");
}

// -------- Feature 8: Class Summary --------
void classSummary(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students available.');
    return;
  }

  var total = 0.0;
  var highest = -1.0;
  var lowest = 101.0;

  var scoredCount = 0;
  var passCount = 0;

  // 20. Set
  var grades = <String>{};

  for (var student in students) {
    var scores = student['scores'] as List<int>;
    if (scores.isEmpty) continue;

    var avg = calculateAvg(student);
    total += avg;
    scoredCount++;

    if (avg > highest) highest = avg;
    if (avg < lowest) lowest = avg;

    // 10. logical operators
    if (scores.isNotEmpty && avg >= 60) {
      passCount++;
    }

    grades.add(getGrade(avg));
  }

  var classAvg = scoredCount == 0 ? 0.0 : total / scoredCount;

  // 23. collection for
  var summaryLines = [
    for (var student in students)
      '${student['name']}: ${((student['scores'] as List<int>).isEmpty ? 'No scores' : calculateAvg(student).toStringAsFixed(2))}',
  ];

  print("""
===== CLASS SUMMARY =====
Total Students: ${students.length}
Class Average: ${classAvg.toStringAsFixed(2)}
Highest Avg: ${scoredCount == 0 ? 'N/A' : highest.toStringAsFixed(2)}
Lowest Avg: ${scoredCount == 0 ? 'N/A' : lowest.toStringAsFixed(2)}
Passing Students: $passCount
Grades Present: $grades

Details:
${summaryLines.join('\n')}
""");
}
