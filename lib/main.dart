import 'package:Trip/config/bindings/binding_controllers.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/config/sizing/size_config.dart';
import 'package:Trip/config/themes/theme_generator.dart';
import 'package:Trip/core/locals.g.dart';
import 'package:Trip/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  Get.changeThemeMode(ThemeMode.light);
  // OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
  // OneSignal.shared.setAppId('b3be826b-916f-4787-815a-4d1cc944b09b');
  // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //   Logger().d("Accepted permission: $accepted");
  // });

  // OneSignal.shared.setLanguage(prefs.getString("languageCode") ?? Get.deviceLocale!.languageCode);
  // OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {});
  // OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
  //   event.complete(event.notification);
  // });

  // var deviceLanguageCode = Get.deviceLocale!.languageCode;
  // var local = Locale(prefs.getString("languageCode") ?? deviceLanguageCode);

  Get.updateLocale(Locale('ar'));
  if (prefs.getBool('positive') != null) {
    OneSignal.shared.disablePush(prefs.getBool('positive')! ? false : true);
  } else {
    OneSignal.shared.disablePush(false);
  }

  runApp(MyApp(page: SplashPage()));
}

class MyApp extends StatefulWidget {
  final Widget page;

  const MyApp({
    super.key,
    required this.page,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        final theme = AppTheme();
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: BindingsController(),
          home: widget.page,
          title: "Structure",
          translationsKeys: AppTranslation.translations,
          // locale: Get.locale!,
          supportedLocales: const [
            Locale("ar", "SA"),
            Locale("en", "US"),
          ],
          fallbackLocale: const Locale("ar", "AR"),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: theme.buildLightTheme(),
          themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: theme.buildDarkTheme(),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      });
    });
  }
}
