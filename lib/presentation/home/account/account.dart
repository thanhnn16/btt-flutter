import 'package:bongtuyettrang/app/shared/languages/language_cubit.dart';
import 'package:bongtuyettrang/presentation/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.account),
            ),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.logout),
                  ),
                  ElevatedButton(
                      onPressed: () {
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
                      child: Text(state.locale.languageCode == 'en'
                          ? 'English'
                          : 'Vietnamese')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
