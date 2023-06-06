import 'package:hiv/pages/basic_information/basic_information.dart';
import 'package:hiv/pages/choose_language/choose_language.dart';
import 'package:hiv/pages/consultation/consultant_contacts.dart';
import 'package:hiv/pages/consultation/consultation_page.dart';
import 'package:hiv/pages/diary/diary_page.dart';
import 'package:hiv/pages/hiv_info_page/hiv_info_page.dart';
import 'package:hiv/pages/hiv_info_page/hiv_info_screens/hiv_AIDS_info.dart';
import 'package:hiv/pages/hiv_info_page/hiv_info_screens/hiv_not_transmission.dart';
import 'package:hiv/pages/hiv_info_page/hiv_info_screens/hiv_self_test.dart';
import 'package:hiv/pages/hiv_info_page/hiv_info_screens/hiv_transmission_routes.dart';
import 'package:hiv/pages/hiv_info_page/hiv_info_screens/screening.dart';
import 'package:hiv/pages/hiv_info_page/hiv_info_screens/tests_results.dart';
import 'package:hiv/pages/hiv_prevention/hiv_prevention_page.dart';
import 'package:hiv/pages/hiv_prevention/hiv_prevention_screens/how_to_protect_yourself.dart';
import 'package:hiv/pages/hiv_prevention/hiv_prevention_screens/methadone_therapy_screen.dart';
import 'package:hiv/pages/hiv_prevention/hiv_prevention_screens/pre_post_exposure_therapy.dart';
import 'package:hiv/pages/home/home.dart';
import 'package:hiv/pages/home/home_new.dart';
import 'package:hiv/pages/information_on%20_arv/schema_page.dart';
import 'package:hiv/pages/language/change_laguage_page.dart';
import 'package:hiv/pages/map/map_page.dart';
import 'package:hiv/pages/my_state/medications/taking_medications.dart';
import 'package:hiv/pages/my_state/mood/mood_page.dart';
import 'package:hiv/pages/my_state/my_state.dart';
import 'package:hiv/pages/my_state/symptom/symptom_page.dart';
import 'package:hiv/pages/presence_of_hiv/hiv_presence.dart';
import 'package:hiv/pages/presence_of_hiv/hiv_presence_screens/actions_when_you_have_hiv_screen.dart';
import 'package:hiv/pages/presence_of_hiv/hiv_presence_screens/treatment_screen.dart';
import 'package:hiv/pages/school/patient_school.dart';
import 'package:hiv/pages/school/school_page.dart';
import 'package:hiv/pages/test/hiv_test_page.dart';
import 'package:hiv/pages/test/hiv_testing_screens/hiv_testing.dart';
import 'package:hiv/pages/test/hiv_testing_screens/testing_places.dart';
import 'package:hiv/pages/test/result_page.dart';
import 'package:hiv/pages/test/warning_page.dart';
import 'package:hiv/pages/visit/visit_add_page.dart';
import 'package:hiv/pages/visit/visit_page.dart';
import 'package:hiv/pages/settings/widgets/reset_password.dart';
import 'package:hiv/pages/signup/pin_code.dart';
import 'package:hiv/pages/signup/questionary.dart';
import 'package:hiv/pages/signup/questionnaire.dart';
import 'package:hiv/pages/signup/successful_registration.dart';
import 'package:hiv/pages/test/test_information_page.dart';
import 'package:hiv/pages/test/test_page.dart';
import 'package:hiv/pages/pin_code_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/forgot/forgot_password_page.dart';
import '../pages/add/add_page.dart';
import '../pages/login/login_page.dart';
import '../pages/signup/signup_page.dart';
import '../pages/splash_page.dart';
import 'routes.dart';

import '../pages/Auth/auth.dart';

import 'package:easy_localization/easy_localization.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (_) => SplashPage());

      case Routes.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());

      case Routes.signup:
        return CupertinoPageRoute(builder: (_) => SignupPage());

      case Routes.forgotPassword:
        return CupertinoPageRoute(builder: (_) => ForgotPasswordPage());

      case Routes.chooseLanguage:
        return CupertinoPageRoute(builder: (_) => ChooseLanguagePage());

      case Routes.chooseRegistration:
        return CupertinoPageRoute(builder: (_) => AuthorizationPage());

      case Routes.questionnaire:
        return CupertinoPageRoute(builder: (_) => QuestionnairePage());

      case Routes.questionary:
        return CupertinoPageRoute(builder: (_) => Questionnaire());

      case Routes.successfull_registration:
        return CupertinoPageRoute(builder: (_) => SuccessfullRegistrationPage());

      case Routes.pin_code:
        return CupertinoPageRoute(builder: (_) => PinCodePage());

      case Routes.patientSchool:
        return CupertinoPageRoute(builder: (_) => PatientSchoolPage());

      case Routes.home:
        return CupertinoPageRoute(builder: (_) => HomeNew());

      /*case Routes.home:
        return CupertinoPageRoute(builder: (_) => Home());*/

      case Routes.basic_information:
        return CupertinoPageRoute(builder: (_) => BasicInformationPage());

      case Routes.test:
        return CupertinoPageRoute(builder: (_) => TestPage());

      case Routes.test_information:
        return CupertinoPageRoute(builder: (_) => TestInformationPage());

      // case Routes.treatment:
      //   return CupertinoPageRoute(builder: (_) => TreatmentPage());

      case Routes.consultation:
        return CupertinoPageRoute(builder: (_) => ConsultationPage());

      case Routes.consultant_contact:
        return CupertinoPageRoute(builder: (_) => ConsultantContactPage());

      case Routes.schema_of_arv:
        return CupertinoPageRoute(builder: (_) => SchemaPage());

      case Routes.changeLanguage:
        return CupertinoPageRoute(builder: (_) => ChangeLanguagePage());

      case Routes.my_state:
        return CupertinoPageRoute(builder: (_) => MyStatePage());

      case Routes.diary:
        return CupertinoPageRoute(builder: (_) => DiaryPage());

      case Routes.add:
        return CupertinoPageRoute(builder: (_) => AddPage());

      case Routes.resetPassword:
        return CupertinoPageRoute(builder: (_) => ResetPasswordPage());

      case Routes.symptom:
        return CupertinoPageRoute(builder: (_) => SymptomPage());

      case Routes.mood:
        return CupertinoPageRoute(builder: (_) => MoodPage());

      case Routes.visit_doctor:
        return CupertinoPageRoute(builder: (_) => VisitPage());

      case Routes.visit_add:
        return CupertinoPageRoute(builder: (_) => VisitAddPage());

      case Routes.pin_code_screen:
        return CupertinoPageRoute(builder: (_) => PinCodeInputPage());

      case Routes.school:
        return CupertinoPageRoute(builder: (_) => SchoolPage());

      case Routes.test_warning:
        return CupertinoPageRoute(builder: (_) => WarningPage());

      case Routes.risk_result:
        return CupertinoPageRoute(builder: (_) => TestResultPage());

      case Routes.hiv_info:
        return CupertinoPageRoute(builder: (_) => HivInformationPage());

      case Routes.hiv_test:
      return CupertinoPageRoute(builder: (_) => HivTestPage());

      case Routes.hiv_prevention:
        return CupertinoPageRoute(builder: (_) => HivPreventionPage());

      case Routes.hiv_presence:
        return CupertinoPageRoute(builder: (_) => PresenceOfHivPage());

      case Routes.consultation_new:
        return CupertinoPageRoute(builder: (_) => ConsultationPage());

      case Routes.auth:
        return CupertinoPageRoute(builder: (_) => AuthorizationPage());

      case Routes.hiv_AIDS_info:
        return CupertinoPageRoute(builder: (_) => HivAIDSInfoScreen());

      case Routes.hiv_transmission_routes_info:
        return CupertinoPageRoute(builder: (_) => HivTransmissionRoutesScreen());

      case Routes.hiv_not_transmitted_screen:
        return CupertinoPageRoute(builder: (_) => NotTransmittedHivScreen());

      case Routes.hiv_testing_screen:
        return CupertinoPageRoute(builder: (_) => HIVTestingScreen());

      case Routes.hiv_testing_place_screen:
        return CupertinoPageRoute(builder: (_) => TestingPlace());

      case Routes.hiv_self_test:
        return CupertinoPageRoute(builder: (_) => HIVSelfTestScreen());

      case Routes.testsResults:
        return CupertinoPageRoute(builder: (_) => TestResultScreen());

      case Routes.screeningResult:
        return CupertinoPageRoute(builder: (_) => ScreeningScreen());

      case Routes.selfProtectScreen:
        return CupertinoPageRoute(builder: (_) => SelfProtectInfoScreen());

      case Routes.methadoneTherapy:
        return CupertinoPageRoute(builder: (_) => MethadoneTherapyScreen());

      case Routes.prePostExposureTherapyScreen:
        return CupertinoPageRoute(builder: (_) => PrePostExposureTherapyScreen());

      case Routes.hiv_actions:
        return CupertinoPageRoute(builder: (_) => HivActionsScreen());

      case Routes.hiv_treatment:
        return CupertinoPageRoute(builder: (_) => HivTreatmentScreen());

      case Routes.map_page:
        return CupertinoPageRoute(builder: (_) => MapPage());

      case Routes.take_medications:
        return CupertinoPageRoute(builder: (_) => TakeMedicationsView());

      case Routes.error:
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('new_page'.tr()),
        ),
        body: Center(
          child: Text('new_page'.tr()),
        ),
      );
    });
  }
}
