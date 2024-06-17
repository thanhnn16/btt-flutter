import 'package:bongtuyettrang/core/utils.dart';
import 'package:bongtuyettrang/src/data/repositories/authentication_repository.dart';
import 'package:bongtuyettrang/src/data/repositories/user_repository.dart';
import 'package:bongtuyettrang/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:bongtuyettrang/src/presentation/pages/auth/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/button.dart';
import '../../widgets/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Material(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.loginToYourAccount,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.itsGreatToSeeYouAgain,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 24),
                      Input(
                        label: AppLocalizations.of(context)!.phoneNumber,
                        hint: AppLocalizations.of(context)!.enterPhoneNumber,
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                      ),
                      Input(
                        label: AppLocalizations.of(context)!.password,
                        hint: AppLocalizations.of(context)!.enterPassword,
                        controller: passwordController,
                        isPassword: true,
                      ),
                      Wrap(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '${AppLocalizations.of(context)!.forgotPassword} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .resetPassword,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.blue,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle "Terms of Service" tap here
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Button(
                        label: AppLocalizations.of(context)!.signUp,
                        onPressed: () {},
                        isDisabled: phoneNumberController.text.isEmpty ||
                            passwordController.text.isEmpty,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: <Widget>[
                          const Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(AppLocalizations.of(context)!.or),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const GoogleButton(),
                      const SizedBox(height: 24),
                      const GuestButton(),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.noAccount} ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
