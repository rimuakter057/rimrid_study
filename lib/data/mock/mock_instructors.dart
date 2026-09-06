import '../../core/utils/mock_images.dart';
import '../models/instructor_model.dart';

class MockInstructors {
  MockInstructors._();

  static final InstructorModel sarah = InstructorModel(
    id: 'ins_sarah',
    name: 'Sarah Mitchell',
    avatarUrl: MockImages.avatar(1),
    title: 'Senior Flutter Engineer',
    rating: 4.9,
    studentsCount: 24800,
    coursesCount: 6,
    bio: 'Sarah has spent 8 years building mobile apps at scale and loves '
        'turning complex concepts into simple, practical lessons.',
  );

  static final InstructorModel david = InstructorModel(
    id: 'ins_david',
    name: 'David Chen',
    avatarUrl: MockImages.avatar(12),
    title: 'Full-Stack Web Developer',
    rating: 4.8,
    studentsCount: 18200,
    coursesCount: 4,
    bio: 'David builds production web apps and teaches modern JavaScript, '
        'React, and backend fundamentals.',
  );

  static final InstructorModel maria = InstructorModel(
    id: 'ins_maria',
    name: 'Maria Gonzalez',
    avatarUrl: MockImages.avatar(23),
    title: 'Product Designer',
    rating: 4.9,
    studentsCount: 15300,
    coursesCount: 5,
    bio: 'Maria has designed for startups and Fortune 500 companies, '
        'specializing in mobile-first UI/UX systems.',
  );

  static final InstructorModel james = InstructorModel(
    id: 'ins_james',
    name: 'James Okafor',
    avatarUrl: MockImages.avatar(34),
    title: 'Data Scientist',
    rating: 4.7,
    studentsCount: 12100,
    coursesCount: 3,
    bio: 'James applies machine learning in fintech and teaches data '
        'science from first principles.',
  );

  static final InstructorModel priya = InstructorModel(
    id: 'ins_priya',
    name: 'Priya Nair',
    avatarUrl: MockImages.avatar(45),
    title: 'AI Research Engineer',
    rating: 4.9,
    studentsCount: 21700,
    coursesCount: 4,
    bio: 'Priya works on applied NLP systems and breaks down AI/ML topics '
        'for beginners and practitioners alike.',
  );

  static final InstructorModel liam = InstructorModel(
    id: 'ins_liam',
    name: 'Liam Turner',
    avatarUrl: MockImages.avatar(56),
    title: 'Growth Marketing Lead',
    rating: 4.6,
    studentsCount: 9800,
    coursesCount: 3,
    bio: 'Liam has led growth marketing at two startups from seed to '
        'Series B and teaches practical, no-fluff marketing.',
  );

  static final InstructorModel nadia = InstructorModel(
    id: 'ins_nadia',
    name: 'Nadia Hussain',
    avatarUrl: MockImages.avatar(67),
    title: 'Business Strategy Consultant',
    rating: 4.8,
    studentsCount: 11400,
    coursesCount: 2,
    bio: 'Nadia advises founders on business strategy and teaches the '
        'fundamentals of building a sustainable company.',
  );

  static final InstructorModel omar = InstructorModel(
    id: 'ins_omar',
    name: 'Omar Farouk',
    avatarUrl: MockImages.avatar(8),
    title: 'Android & Kotlin Specialist',
    rating: 4.7,
    studentsCount: 14200,
    coursesCount: 4,
    bio: 'Omar has shipped a dozen Android apps and teaches native mobile '
        'development best practices.',
  );

  static final List<InstructorModel> all = [
    sarah,
    david,
    maria,
    james,
    priya,
    liam,
    nadia,
    omar,
  ];
}
