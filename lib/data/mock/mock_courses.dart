import '../../core/utils/mock_images.dart';
import '../models/course_model.dart';
import 'mock_instructors.dart';

class MockCourses {
  MockCourses._();

  static final List<CourseModel> all = [
    CourseModel(
      id: 'c_flutter_dev',
      title: 'Complete Flutter Development Bootcamp',
      thumbnailUrl: MockImages.course('flutter-dev'),
      instructor: MockInstructors.sarah,
      categoryId: 'mobile_dev',
      rating: 4.9,
      reviewsCount: 3120,
      studentsCount: 24800,
      lessonsCount: 86,
      durationHours: 32,
      level: CourseLevel.beginner,
      price: 49.99,
      isPopular: true,
      description:
          'Build beautiful, production-ready mobile apps with Flutter and '
          'Dart from scratch. Covers state management, animations, and '
          'publishing to the App Store and Play Store.',
      whatYoullLearn: const [
        'Build responsive UIs with Flutter widgets',
        'Manage app state with GetX',
        'Work with REST APIs and local storage',
        'Publish apps to iOS and Android stores',
      ],
      progress: 0.62,
      currentLessonTitle: 'Flutter Widgets Deep Dive',
    ),
    CourseModel(
      id: 'c_js_web',
      title: 'Modern JavaScript & Web Development',
      thumbnailUrl: MockImages.course('js-web'),
      instructor: MockInstructors.david,
      categoryId: 'web_dev',
      rating: 4.8,
      reviewsCount: 2660,
      studentsCount: 18200,
      lessonsCount: 74,
      durationHours: 28,
      level: CourseLevel.beginner,
      price: 39.99,
      isPopular: true,
      description:
          'Master modern JavaScript, ES6+, and the fundamentals of building '
          'fast, responsive websites and web apps.',
      whatYoullLearn: const [
        'Write modern, idiomatic JavaScript',
        'Understand the DOM and browser APIs',
        'Build interactive web components',
        'Fetch and work with real-world APIs',
      ],
      progress: 0.28,
      currentLessonTitle: 'Working with Async/Await',
    ),
    CourseModel(
      id: 'c_uiux_mobile',
      title: 'UI/UX Design for Mobile Apps',
      thumbnailUrl: MockImages.course('uiux-mobile'),
      instructor: MockInstructors.maria,
      categoryId: 'ui_ux',
      rating: 4.9,
      reviewsCount: 1890,
      studentsCount: 15300,
      lessonsCount: 52,
      durationHours: 18,
      level: CourseLevel.intermediate,
      price: 44.99,
      isNew: true,
      description:
          'Learn a complete, practical UI/UX process for designing mobile '
          'apps that look great and convert.',
      whatYoullLearn: const [
        'Design systems and component libraries',
        'User research and wireframing',
        'Prototyping in Figma',
        'Usability testing fundamentals',
      ],
    ),
    CourseModel(
      id: 'c_python_ds',
      title: 'Python for Data Science & Analytics',
      thumbnailUrl: MockImages.course('python-ds'),
      instructor: MockInstructors.james,
      categoryId: 'data_science',
      rating: 4.7,
      reviewsCount: 1420,
      studentsCount: 12100,
      lessonsCount: 68,
      durationHours: 26,
      level: CourseLevel.intermediate,
      price: 54.99,
      description:
          'Use Python, Pandas, and visualization libraries to analyze real '
          'datasets and build data-driven insights.',
      whatYoullLearn: const [
        'Data wrangling with Pandas and NumPy',
        'Data visualization with Matplotlib/Seaborn',
        'Statistical analysis fundamentals',
        'Building your first data pipeline',
      ],
      progress: 0.08,
      currentLessonTitle: 'Introduction to Pandas DataFrames',
    ),
    CourseModel(
      id: 'c_ml_intro',
      title: 'Machine Learning A-Z: Foundations',
      thumbnailUrl: MockImages.course('ml-intro'),
      instructor: MockInstructors.priya,
      categoryId: 'ai_ml',
      rating: 4.9,
      reviewsCount: 2210,
      studentsCount: 21700,
      lessonsCount: 91,
      durationHours: 34,
      level: CourseLevel.advanced,
      price: 59.99,
      isPopular: true,
      description:
          'A hands-on introduction to machine learning: regression, '
          'classification, neural networks, and real-world projects.',
      whatYoullLearn: const [
        'Core ML algorithms and when to use them',
        'Building and training neural networks',
        'Model evaluation and tuning',
        'Deploying ML models to production',
      ],
    ),
    CourseModel(
      id: 'c_growth_marketing',
      title: 'Growth Marketing Fundamentals',
      thumbnailUrl: MockImages.course('growth-marketing'),
      instructor: MockInstructors.liam,
      categoryId: 'marketing',
      rating: 4.6,
      reviewsCount: 980,
      studentsCount: 9800,
      lessonsCount: 40,
      durationHours: 14,
      level: CourseLevel.beginner,
      price: 0,
      isFree: true,
      isNew: true,
      description:
          'Learn practical growth marketing tactics used by real startups '
          'to acquire and retain customers.',
      whatYoullLearn: const [
        'Building a growth funnel',
        'Running effective A/B tests',
        'Content and channel strategy',
        'Retention and lifecycle marketing',
      ],
    ),
    CourseModel(
      id: 'c_business_strategy',
      title: 'Business Strategy for Founders',
      thumbnailUrl: MockImages.course('business-strategy'),
      instructor: MockInstructors.nadia,
      categoryId: 'business',
      rating: 4.8,
      reviewsCount: 760,
      studentsCount: 11400,
      lessonsCount: 36,
      durationHours: 12,
      level: CourseLevel.intermediate,
      price: 34.99,
      description:
          'A practical framework for building and scaling a sustainable '
          'business, from idea to operations.',
      whatYoullLearn: const [
        'Validating a business idea',
        'Building a competitive strategy',
        'Financial planning basics',
        'Scaling operations sustainably',
      ],
      isSaved: true,
    ),
    CourseModel(
      id: 'c_kotlin_android',
      title: 'Android Development with Kotlin',
      thumbnailUrl: MockImages.course('kotlin-android'),
      instructor: MockInstructors.omar,
      categoryId: 'mobile_dev',
      rating: 4.7,
      reviewsCount: 1340,
      studentsCount: 14200,
      lessonsCount: 64,
      durationHours: 24,
      level: CourseLevel.intermediate,
      price: 44.99,
      description:
          'Build native Android apps with Kotlin, Jetpack Compose, and '
          'modern Android architecture patterns.',
      whatYoullLearn: const [
        'Kotlin language fundamentals',
        'Jetpack Compose UI toolkit',
        'MVVM architecture on Android',
        'Working with Room and Retrofit',
      ],
      isSaved: true,
    ),
    CourseModel(
      id: 'c_dart_fundamentals',
      title: 'Dart Programming Fundamentals',
      thumbnailUrl: MockImages.course('dart-fundamentals'),
      instructor: MockInstructors.sarah,
      categoryId: 'programming',
      rating: 4.8,
      reviewsCount: 1980,
      studentsCount: 20100,
      lessonsCount: 48,
      durationHours: 16,
      level: CourseLevel.beginner,
      price: 0,
      isFree: true,
      description:
          'Master the Dart language fundamentals that power Flutter — '
          'from OOP concepts to async programming.',
      whatYoullLearn: const [
        'Variables, functions, and control flow',
        'Object-oriented programming in Dart',
        'Futures, Streams, and async/await',
        'Null safety and generics',
      ],
      progress: 1.0,
      currentLessonTitle: 'Course Completed',
    ),
    CourseModel(
      id: 'c_react_web',
      title: 'React & Next.js Masterclass',
      thumbnailUrl: MockImages.course('react-web'),
      instructor: MockInstructors.david,
      categoryId: 'web_dev',
      rating: 4.8,
      reviewsCount: 2050,
      studentsCount: 19800,
      lessonsCount: 70,
      durationHours: 27,
      level: CourseLevel.advanced,
      price: 49.99,
      isPopular: true,
      description:
          'Build fast, SEO-friendly web apps with React and Next.js, '
          'including server components and deployment.',
      whatYoullLearn: const [
        'Component architecture in React',
        'Routing and data fetching in Next.js',
        'Server-side rendering fundamentals',
        'Deploying production web apps',
      ],
    ),
    CourseModel(
      id: 'c_figma_uiux',
      title: 'Figma for UI/UX Designers',
      thumbnailUrl: MockImages.course('figma-uiux'),
      instructor: MockInstructors.maria,
      categoryId: 'ui_ux',
      rating: 4.9,
      reviewsCount: 1610,
      studentsCount: 16700,
      lessonsCount: 44,
      durationHours: 15,
      level: CourseLevel.beginner,
      price: 29.99,
      isNew: true,
      description:
          'Get hands-on with Figma to design, prototype, and hand off '
          'polished app interfaces.',
      whatYoullLearn: const [
        'Figma fundamentals and shortcuts',
        'Auto layout and components',
        'Interactive prototyping',
        'Developer handoff best practices',
      ],
    ),
    CourseModel(
      id: 'c_deep_learning',
      title: 'Deep Learning with TensorFlow',
      thumbnailUrl: MockImages.course('deep-learning'),
      instructor: MockInstructors.priya,
      categoryId: 'ai_ml',
      rating: 4.8,
      reviewsCount: 1330,
      studentsCount: 13900,
      lessonsCount: 58,
      durationHours: 30,
      level: CourseLevel.advanced,
      price: 64.99,
      description:
          'Dive deep into neural networks, CNNs, and RNNs using '
          'TensorFlow and Keras with real projects.',
      whatYoullLearn: const [
        'Building CNNs for image classification',
        'Sequence models with RNNs/LSTMs',
        'Transfer learning techniques',
        'Model deployment with TensorFlow Serving',
      ],
    ),
  ];

  static List<CourseModel> get enrolled =>
      all.where((c) => c.isEnrolled).toList();

  static List<CourseModel> get inProgress =>
      all.where((c) => c.isEnrolled && !c.isCompleted).toList();

  static List<CourseModel> get completed =>
      all.where((c) => c.isCompleted).toList();

  static List<CourseModel> get saved =>
      all.where((c) => c.isSaved).toList();

  static List<CourseModel> get popular =>
      all.where((c) => c.isPopular).toList();

  static List<CourseModel> get newCourses =>
      all.where((c) => c.isNew).toList();

  static List<CourseModel> get recommended =>
      all.where((c) => !c.isEnrolled).take(6).toList();

  static List<CourseModel> byCategory(String categoryId) =>
      all.where((c) => c.categoryId == categoryId).toList();

  static CourseModel byId(String id) => all.firstWhere((c) => c.id == id);
}
