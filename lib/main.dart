import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
import 'core/theme/app_theme.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // تهيئة GetIt
    await di.init();

    // تهيئة Firebase فقط إذا لم يكن هناك تطبيق مهيأ
    if (!Firebase.apps.any((element) => element.name == '[DEFAULT]')) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }

    runApp(const MyApp());
  } catch (e) {
    debugPrint('خطأ في تهيئة التطبيق: $e');
    // تشغيل التطبيق حتى في حالة فشل تهيئة Firebase
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DarQuran',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''),
      ],
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
