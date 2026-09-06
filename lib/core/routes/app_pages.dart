import 'package:get/get.dart';
import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/views/forgot_password_view.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/register_view.dart';
import '../../features/certificates/bindings/certificates_binding.dart';
import '../../features/certificates/views/certificate_detail_view.dart';
import '../../features/certificates/views/certificates_view.dart';
import '../../features/course_details/bindings/course_details_binding.dart';
import '../../features/course_details/views/course_details_view.dart';
import '../../features/lesson/bindings/lesson_binding.dart';
import '../../features/lesson/views/lesson_view.dart';
import '../../features/navigation/bindings/main_binding.dart';
import '../../features/navigation/views/main_nav_view.dart';
import '../../features/notes/bindings/notes_binding.dart';
import '../../features/notes/views/note_editor_view.dart';
import '../../features/notes/views/notes_view.dart';
import '../../features/notifications/bindings/notifications_binding.dart';
import '../../features/notifications/views/notifications_view.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/progress/bindings/progress_binding.dart';
import '../../features/progress/views/progress_view.dart';
import '../../features/quiz/bindings/quiz_binding.dart';
import '../../features/quiz/views/quiz_view.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_view.dart';
import '../../features/study_planner/bindings/study_planner_binding.dart';
import '../../features/study_planner/views/study_planner_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainNavView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.courseDetails,
      page: () => const CourseDetailsView(),
      binding: CourseDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.lesson,
      page: () => const LessonView(),
      binding: LessonBinding(),
    ),
    GetPage(
      name: AppRoutes.notes,
      page: () => const NotesView(),
      binding: NotesBinding(),
    ),
    GetPage(
      name: AppRoutes.noteEditor,
      page: () => const NoteEditorView(),
      binding: NotesBinding(),
    ),
    GetPage(
      name: AppRoutes.quiz,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: AppRoutes.studyPlanner,
      page: () => const StudyPlannerView(),
      binding: StudyPlannerBinding(),
    ),
    GetPage(
      name: AppRoutes.progress,
      page: () => const ProgressView(),
      binding: ProgressBinding(),
    ),
    GetPage(
      name: AppRoutes.certificates,
      page: () => const CertificatesView(),
      binding: CertificatesBinding(),
    ),
    GetPage(
      name: AppRoutes.certificateDetail,
      page: () => const CertificateDetailView(),
      binding: CertificatesBinding(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
  ];
}
