import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/constants/themes.dart';
import 'package:mmo_app_template/controllers/theme_controller.dart';
import 'package:mmo_app_template/helpers/utils.dart';
import 'package:mmo_app_template/localization/app_localization.dart';
import 'package:mmo_app_template/routes/app_pages.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    await initServices();
    runApp(const MMOTemplate());
  } catch (err) {
    AppUtils.printLog(err);
  }
}

Future<void> initServices() async {
  await GetStorage.init();
  Get.put(
    AppThemeController(),
    permanent: true,
  );
}

class MMOTemplate extends StatelessWidget {
  const MMOTemplate({super.key});
  @override
  Widget build(BuildContext context) => GetBuilder<AppThemeController>(
        builder: (AppThemeController logic) => ScreenUtilInit(
          designSize: const Size(392, 744),
          builder: (_, __) => GetMaterialApp(
            supportedLocales: const [
              ...FormBuilderLocalizations.supportedLocales
            ],
            localizationsDelegates: const [
              ...GlobalMaterialLocalizations.delegates,
              FormBuilderLocalizations.delegate,
            ],
            title: StringValues.appName.tr,
            debugShowCheckedModeBanner: false,
            themeMode: _handleAppTheme(mode: logic.themeMode),
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            fallbackLocale: const Locale('es', 'ES'),
            translations: AppLocalization(),
            getPages: AppPages.pages,
            initialRoute: AppRoutes.welcome,
          ),
        ),
      );
}

ThemeMode _handleAppTheme({required String mode}) {
  if (mode == StringValues.dark) {
    return ThemeMode.dark;
  }
  if (mode == StringValues.light) {
    return ThemeMode.light;
  }
  return ThemeMode.system;
}
