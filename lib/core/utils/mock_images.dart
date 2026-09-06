/// Deterministic placeholder image URLs used while the app runs on mock
/// data. Swap these for real CDN/storage URLs once a backend is wired up.
class MockImages {
  MockImages._();

  /// A stable course/illustration thumbnail for the given [seed].
  static String course(String seed, {int width = 600, int height = 400}) {
    return 'https://picsum.photos/seed/$seed/$width/$height';
  }

  /// A stable avatar image for the given numeric [id] (1-70).
  static String avatar(int id) {
    final safeId = ((id - 1) % 70) + 1;
    return 'https://i.pravatar.cc/150?img=$safeId';
  }
}
