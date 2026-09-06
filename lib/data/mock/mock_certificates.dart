import '../models/certificate_model.dart';
import 'mock_courses.dart';

class MockCertificates {
  MockCertificates._();

  static final List<CertificateModel> all = [
    CertificateModel(
      id: 'cert_dart_fundamentals',
      courseId: 'c_dart_fundamentals',
      courseTitle: MockCourses.byId('c_dart_fundamentals').title,
      instructorName: MockCourses.byId('c_dart_fundamentals').instructor.name,
      thumbnailUrl: MockCourses.byId('c_dart_fundamentals').thumbnailUrl,
      completionDate: DateTime(2026, 7, 18),
      durationHours: MockCourses.byId('c_dart_fundamentals').durationHours,
      credentialId: 'RRS-2026-DF-8841',
    ),
  ];

  static CertificateModel? byId(String id) {
    for (final c in all) {
      if (c.id == id) return c;
    }
    return null;
  }
}
