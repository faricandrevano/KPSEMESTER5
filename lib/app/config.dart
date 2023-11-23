import 'package:shamo_mobile/app/flavor.dart';
import 'package:shamo_mobile/core/core.dart';

class AppConfig {
  static const String appName = 'Shamo';
  static const String fontFamily = 'Poppins';
  static const String profileUrl =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  static const FlavorConfig<String> baseUrl = FlavorConfig<String>(
    prod: 'http://192.168.137.1:80/api',
    dev: 'http://192.168.137.1:80/api',
    stag: 'http://192.168.137.1:80/api',
  );
  static const AppTheme defaultTheme = AppTheme.dark;
  static const bool autoStringifyEquatable = true;
  static const bool transparentStatusBar = true;
}

class FlavorConfig<T> {
  const FlavorConfig({
    required this.dev,
    required this.prod,
    required this.stag,
    this.fallback,
  }) : assert(
          dev == null || prod == null || stag == null ? fallback != null : true,
          '[fallback]cannot be null if there is one flavor whose value is null',
        );

  final T? dev;
  final T? prod;
  final T? stag;
  final T? fallback;

  T get value {
    switch (F.flavor) {
      case Flavor.dev:
        return dev ?? fallback!;
      case Flavor.stag:
        return stag ?? fallback!;
      case Flavor.prod:
        return prod ?? fallback!;
    }
  }
}
