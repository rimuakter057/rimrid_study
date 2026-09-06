class CertificateModel {
  final String id;
  final String courseId;
  final String courseTitle;
  final String instructorName;
  final String thumbnailUrl;
  final DateTime completionDate;
  final double durationHours;
  final String credentialId;

  const CertificateModel({
    required this.id,
    required this.courseId,
    required this.courseTitle,
    required this.instructorName,
    required this.thumbnailUrl,
    required this.completionDate,
    required this.durationHours,
    required this.credentialId,
  });
}
