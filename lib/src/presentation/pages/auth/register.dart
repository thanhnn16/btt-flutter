import 'package:bongtuyettrang/core/utils.dart';
import 'package:bongtuyettrang/src/presentation/widgets/button.dart';
import 'package:bongtuyettrang/src/presentation/widgets/input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Material(
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
                      AppLocalizations.of(context)!.createAccount,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.letsCreateAccount,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),
                    Input(
                      label: AppLocalizations.of(context)!.fullName,
                      hint: AppLocalizations.of(context)!.enterFullName,
                      controller: fullNameController,
                    ),
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
                                text: AppLocalizations.of(context)!.bySigningUp,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .termsOfService,
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
                              TextSpan(
                                text: AppLocalizations.of(context)!.and,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text:
                                    AppLocalizations.of(context)!.privacyPolicy,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.blue,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle "Privacy Policy" tap here
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
                          passwordController.text.isEmpty ||
                          fullNameController.text.isEmpty,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: <Widget>[
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                          AppLocalizations.of(context)!.alreadyHaveAnAccount,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
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
    );
  }
}
