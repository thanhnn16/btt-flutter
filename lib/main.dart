import 'package:bongtuyettrang/app/shared/languages/language_cubit.dart';
import 'package:bongtuyettrang/presentation/auth/cubit/auth_cubit.dart';
import 'package:bongtuyettrang/presentation/auth/splash.dart';
import 'package:bongtuyettrang/presentation/service/appointment/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/network/repository/authentication_repository.dart';
import 'data/network/repository/services/service_category_repository.dart';
import 'data/network/repository/services/service_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(
        authenticationRepository: AuthenticationRepository(),
      ),
    ),
    BlocProvider(create: (context) => LanguageCubit(prefs)),
    BlocProvider(
      create: (context) => AppointmentCubit(
        serviceCategoryRepository: ServiceCategoryRepository(),
        serviceRepository: ServiceRepository(),
      ),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          locale: state.locale,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('vi'),
            Locale('en'),
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            primaryColor: Theme.of(context).colorScheme.primary,
            scaffoldBackgroundColor: Colors.white,
            dialogBackgroundColor: Colors.white,
            useMaterial3: true,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              displayMedium: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              displaySmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              headlineLarge: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              bodySmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              labelLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              labelMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              labelSmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            scaffoldBackgroundColor: Colors.black,
            dialogBackgroundColor: Colors.black,
            useMaterial3: true,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              displayMedium: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              displaySmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              headlineLarge: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              bodySmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              labelLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              labelMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              labelSmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
