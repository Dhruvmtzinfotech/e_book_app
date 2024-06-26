part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const OTP = _Paths.OTP;
  static const PROFILE = _Paths.PROFILE;
  static const BOOKS = _Paths.BOOKS;
  static const SUBJECT = _Paths.SUBJECT;
  static const PDF = _Paths.PDF;
  static const VIDEO = _Paths.VIDEO;
  static const FAQ = _Paths.FAQ;
  static const PRIVACYPOLICY = _Paths.PRIVACYPOLICY;
  static const CONTACT_US = _Paths.CONTACT_US;
  static const RATE = _Paths.RATE;
  static const INTRO_PAGE1 = _Paths.INTRO_PAGE1;
  static const INTRO_PAGE2 = _Paths.INTRO_PAGE2;
  static const INTRO_PAGE3 = _Paths.INTRO_PAGE3;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const OTP = '/otp';
  static const PROFILE = '/profile';
  static const BOOKS = '/books';
  static const SUBJECT = '/subject';
  static const PDF = '/pdf';
  static const VIDEO = '/video';
  static const FAQ = '/faq';
  static const PRIVACYPOLICY = '/privacypolicy';
  static const CONTACT_US = '/contact-us';
  static const RATE = '/rate';
  static const INTRO_PAGE1 = '/intro-page1';
  static const INTRO_PAGE2 = '/intro-page2';
  static const INTRO_PAGE3 = '/intro-page3';
}
