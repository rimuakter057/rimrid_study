import '../../core/utils/mock_images.dart';
import '../models/review_model.dart';

/// A shared pool of realistic reviews, sliced deterministically per course
/// so every Course Details page shows believable feedback.
class MockReviews {
  MockReviews._();

  static final List<ReviewModel> _pool = [
    ReviewModel(
      id: 'r1',
      userName: 'Aisha Rahman',
      avatarUrl: MockImages.avatar(21),
      rating: 5,
      comment:
          'Extremely well structured. The instructor explains complex ideas '
          'in a very simple, practical way. Highly recommended!',
      date: DateTime(2026, 7, 2),
    ),
    ReviewModel(
      id: 'r2',
      userName: 'Tanvir Islam',
      avatarUrl: MockImages.avatar(33),
      rating: 4,
      comment:
          'Great course overall. Pacing was a little fast in the middle '
          'modules but the projects made everything click.',
      date: DateTime(2026, 6, 18),
    ),
    ReviewModel(
      id: 'r3',
      userName: 'Emily Carter',
      avatarUrl: MockImages.avatar(44),
      rating: 5,
      comment:
          'Best course I\'ve taken on this topic. The hands-on exercises '
          'really helped me retain what I learned.',
      date: DateTime(2026, 5, 27),
    ),
    ReviewModel(
      id: 'r4',
      userName: 'Marcus Lee',
      avatarUrl: MockImages.avatar(52),
      rating: 4,
      comment:
          'Solid content and good production quality. Would love more '
          'real-world case studies in future updates.',
      date: DateTime(2026, 5, 9),
    ),
    ReviewModel(
      id: 'r5',
      userName: 'Fatima Noor',
      avatarUrl: MockImages.avatar(63),
      rating: 5,
      comment:
          'The instructor is clearly an expert and explains the "why" '
          'behind every concept, not just the "how".',
      date: DateTime(2026, 4, 22),
    ),
    ReviewModel(
      id: 'r6',
      userName: 'Daniel Kim',
      avatarUrl: MockImages.avatar(15),
      rating: 3,
      comment:
          'Good introduction but I expected a bit more depth in the '
          'advanced sections.',
      date: DateTime(2026, 4, 3),
    ),
    ReviewModel(
      id: 'r7',
      userName: 'Sophia Nguyen',
      avatarUrl: MockImages.avatar(28),
      rating: 5,
      comment:
          'Loved the pacing and the downloadable resources. Finished it in '
          'a weekend and already applying it at work.',
      date: DateTime(2026, 3, 14),
    ),
    ReviewModel(
      id: 'r8',
      userName: 'Omar Sheikh',
      avatarUrl: MockImages.avatar(39),
      rating: 4,
      comment:
          'Clear explanations and well-organized modules. A great starting '
          'point for beginners.',
      date: DateTime(2026, 2, 26),
    ),
  ];

  static List<ReviewModel> forCourse(String courseId) {
    final seed = courseId.hashCode.abs();
    final count = 4 + (seed % 3);
    final start = seed % _pool.length;
    return List.generate(count, (i) => _pool[(start + i) % _pool.length]);
  }
}
