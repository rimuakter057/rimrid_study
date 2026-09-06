import '../models/quiz_model.dart';

class MockQuizzes {
  MockQuizzes._();

  static final QuizModel flutterWidgets = QuizModel(
    id: 'quiz_flutter_widgets',
    title: 'Flutter Widgets Quiz',
    courseTitle: 'Complete Flutter Development Bootcamp',
    timeLimitMinutes: 5,
    questions: const [
      QuizQuestionModel(
        id: 'q1',
        question: 'Which widget is used to make a layout scrollable?',
        options: ['Container', 'ListView', 'Row', 'Text'],
        correctIndex: 1,
        explanation:
            'ListView lays out its children and makes them scrollable when '
            'they overflow the available space.',
      ),
      QuizQuestionModel(
        id: 'q2',
        question: 'What does "StatelessWidget" mean?',
        options: [
          'A widget with no build method',
          'A widget whose properties never change once created',
          'A widget that cannot be rendered',
          'A widget only used for animations',
        ],
        correctIndex: 1,
        explanation:
            'A StatelessWidget describes part of the UI that does not depend '
            'on any mutable state — it is immutable once built.',
      ),
      QuizQuestionModel(
        id: 'q3',
        question: 'Which widget arranges children horizontally?',
        options: ['Column', 'Stack', 'Row', 'ListTile'],
        correctIndex: 2,
        explanation:
            'Row lays out its children in a horizontal array, while Column '
            'does the same vertically.',
      ),
      QuizQuestionModel(
        id: 'q4',
        question: 'What is the purpose of a Key in Flutter widgets?',
        options: [
          'To encrypt widget data',
          'To help Flutter identify widgets across rebuilds',
          'To style the widget',
          'To make a widget clickable',
        ],
        correctIndex: 1,
        explanation:
            'Keys help Flutter match widgets between the old and new widget '
            'trees, which matters most for lists that can reorder.',
      ),
      QuizQuestionModel(
        id: 'q5',
        question: 'Which method rebuilds a StatefulWidget with new data?',
        options: ['build()', 'initState()', 'setState()', 'dispose()'],
        correctIndex: 2,
        explanation:
            'Calling setState() notifies the framework that internal state '
            'changed and schedules a rebuild.',
      ),
    ],
  );

  static final QuizModel pandasDataframes = QuizModel(
    id: 'quiz_pandas_dataframes',
    title: 'Pandas DataFrames Quiz',
    courseTitle: 'Python for Data Science & Analytics',
    timeLimitMinutes: 5,
    questions: const [
      QuizQuestionModel(
        id: 'q1',
        question: 'Which method reads a CSV file into a DataFrame?',
        options: ['pd.load_csv()', 'pd.read_csv()', 'pd.open_csv()', 'pd.csv()'],
        correctIndex: 1,
        explanation: 'pandas.read_csv() is the standard way to load CSV data.',
      ),
      QuizQuestionModel(
        id: 'q2',
        question: 'What does df.iloc[] select by?',
        options: ['Column names', 'Integer position', 'Label', 'Data type'],
        correctIndex: 1,
        explanation:
            'iloc is purely integer-position based indexing, unlike loc which '
            'is label-based.',
      ),
      QuizQuestionModel(
        id: 'q3',
        question: 'Which function combines groupby with an aggregation?',
        options: ['df.merge()', 'df.groupby().agg()', 'df.concat()', 'df.pivot()'],
        correctIndex: 1,
        explanation:
            'groupby().agg() groups rows and applies one or more aggregate '
            'functions to each group.',
      ),
      QuizQuestionModel(
        id: 'q4',
        question: 'What does df.dropna() do?',
        options: [
          'Removes duplicate rows',
          'Removes rows/columns with missing values',
          'Removes the last row',
          'Sorts the DataFrame',
        ],
        correctIndex: 1,
        explanation: 'dropna() removes rows or columns containing NaN values.',
      ),
      QuizQuestionModel(
        id: 'q5',
        question: 'Which attribute returns the shape of a DataFrame?',
        options: ['df.size', 'df.shape', 'df.length', 'df.dimensions'],
        correctIndex: 1,
        explanation: 'df.shape returns a tuple of (rows, columns).',
      ),
    ],
  );

  static final QuizModel dartOop = QuizModel(
    id: 'quiz_dart_oop',
    title: 'Dart OOP Quiz',
    courseTitle: 'Dart Programming Fundamentals',
    timeLimitMinutes: 4,
    questions: const [
      QuizQuestionModel(
        id: 'q1',
        question: 'Which keyword is used to create a subclass in Dart?',
        options: ['implements', 'extends', 'inherits', 'super'],
        correctIndex: 1,
        explanation: 'extends is used for class inheritance in Dart.',
      ),
      QuizQuestionModel(
        id: 'q2',
        question: 'What does the "final" keyword mean for a variable?',
        options: [
          'It can be reassigned once',
          'It can never be assigned a value',
          'It can only be set once, at declaration or in a constructor',
          'It behaves like a constant known at compile time',
        ],
        correctIndex: 2,
        explanation:
            'final variables can be set only once — unlike const, they can be '
            'computed at runtime.',
      ),
      QuizQuestionModel(
        id: 'q3',
        question: 'Which construct is used for abstract contracts in Dart?',
        options: ['abstract class / interface', 'mixin only', 'enum', 'typedef'],
        correctIndex: 0,
        explanation:
            'Dart uses abstract classes (any class can act as an interface) '
            'to define contracts other classes implement.',
      ),
      QuizQuestionModel(
        id: 'q4',
        question: 'What is a mixin used for?',
        options: [
          'Reusing a class\'s code in multiple class hierarchies',
          'Creating private variables',
          'Defining enums',
          'Handling asynchronous code',
        ],
        correctIndex: 0,
        explanation:
            'Mixins let you reuse a class\'s functionality in multiple class '
            'hierarchies without traditional inheritance.',
      ),
    ],
  );

  static QuizModel byId(String id) {
    return all.firstWhere((q) => q.id == id, orElse: () => flutterWidgets);
  }

  static final List<QuizModel> all = [flutterWidgets, pandasDataframes, dartOop];
}
