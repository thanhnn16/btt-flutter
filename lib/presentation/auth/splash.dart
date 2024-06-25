import 'package:bongtuyettrang/app/shared/languages/language_cubit.dart';
import 'package:bongtuyettrang/presentation/auth/register.dart';
// import 'package:bongtuyettrang/presentation/home/home/home.dart';
import 'package:bongtuyettrang/presentation/pos/pos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/commons/button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 64.0),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const PosScreen()));
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Onboarding()));
              });
            }
          }
          return const SizedBox();
        });
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Material(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    AppLocalizations.of(context)!.slogan,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        decoration: TextDecoration.none),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 24.0,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              if (state.locale.languageCode == 'en') {
                                context
                                    .read<LanguageCubit>()
                                    .changeLanguage(const Locale('vi'));
                              } else {
                                context
                                    .read<LanguageCubit>()
                                    .changeLanguage(const Locale('en'));
                              }
                            },
                            child: Image(
                              width: 48,
                              height: 48,
                              fit: BoxFit.contain,
                              image: state.locale.languageCode == 'en'
                                  ? const AssetImage(
                                      'assets/icons/common/vn.png')
                                  : const AssetImage(
                                      'assets/icons/common/en.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Button(
                            label: AppLocalizations.of(context)!.getStarted,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                  // builder: (context) => const HomeScreen(),
                                  // builder: (context) => const PosScreen(),
                                ),
                              );
                            },
                            icon: Icons.arrow_forward_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
