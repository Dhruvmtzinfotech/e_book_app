import 'package:get/get.dart';
import '../modules/ContactUs/bindings/contact_us_binding.dart';
import '../modules/ContactUs/views/contact_us_view.dart';
import '../modules/books/bindings/books_binding.dart';
import '../modules/books/views/books_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intropage/introPage1/bindings/intro_page1_binding.dart';
import '../modules/intropage/introPage1/views/intro_page1_view.dart';
import '../modules/intropage/introPage2/bindings/intro_page2_binding.dart';
import '../modules/intropage/introPage2/views/intro_page2_view.dart';
import '../modules/intropage/introPage3/bindings/intro_page3_binding.dart';
import '../modules/intropage/introPage3/views/intro_page3_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/pdf/bindings/pdf_binding.dart';
import '../modules/pdf/views/pdf_view.dart';
import '../modules/privacypolicy/bindings/privacypolicy_binding.dart';
import '../modules/privacypolicy/views/privacypolicy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/rate/bindings/rate_binding.dart';
import '../modules/rate/views/rate_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/subject/bindings/subject_binding.dart';
import '../modules/subject/views/subject_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOOKS,
      page: () => BooksView(),
      binding: BooksBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECT,
      page: () => SubjectView(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: _Paths.PDF,
      page: () => PdfView(),
      binding: PdfBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => PrivacyPolicyView(),
      binding: PrivacypolicyBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.RATE,
      page: () => RateView(),
      binding: RateBinding(),
    ),
    GetPage(
      name: _Paths.INTRO_PAGE1,
      page: () => IntroPage1View(),
      binding: IntroPage1Binding(),
    ),
    GetPage(
      name: _Paths.INTRO_PAGE2,
      page: () => IntroPage2View(),
      binding: IntroPage2Binding(),
    ),
    GetPage(
      name: _Paths.INTRO_PAGE3,
      page: () => IntroPage3View(),
      binding: IntroPage3Binding(),
    ),
  ];
}
