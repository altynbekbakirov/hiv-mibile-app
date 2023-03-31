import 'package:hiv/model/audio.dart';
import 'package:hiv/model/consultation.dart';
import 'package:hiv/model/symptoms_model.dart';
import 'package:hiv/model/text_provider.dart';
import 'package:hiv/model/user.dart';
import 'package:hiv/model/user_registrations.dart';
import 'package:hiv/model/videoUI_provider.dart';
import 'package:hiv/utils/connection/connectivity_service.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'model/questionnaire_provider.dart';
import 'routes/route_generator.dart';
import 'routes/routes.dart';
import 'utils/themebloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// Initializing the AppMetrica SDK.
  /*await AppmetricaSdk()
      .activate(apiKey: 'f1eabf67-0227-41fc-82a2-da9423a6d86b');*/

  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('ky', 'KG'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/languages',
      startLocale: Locale('ru', 'RU'),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: User(),
        ),
        ChangeNotifierProvider.value(
          value: UserRegistration(),
        ),
        ChangeNotifierProvider.value(
          value: Consultation(),
        ),
        ChangeNotifierProvider.value(
          value: PageCategory(),
        ),
        ChangeNotifierProvider.value(
          value: Audio(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Symptoms(),
        ),
        ChangeNotifierProvider.value(
          value: VideoUI(),
        ),
        ChangeNotifierProvider.value(
          value: Questionnaire(),
        )
      ],
      child: BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: _buildWithTheme,
        ),
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return StreamProvider<DataConnectionStatus>(
      create: (context) {
        return DataConnectivityService().connectivityStreamController.stream;
      },
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        title: 'Здоровье +',
        initialRoute: Routes.splash,
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        debugShowCheckedModeBanner: false,
        theme: state.themeData,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
