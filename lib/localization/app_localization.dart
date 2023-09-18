import 'package:get/get.dart';
import 'es_es/es_es_translations.dart';
import 'en_us/en_us_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'es_ES': esEs,
      };
}
