import 'package:bongtuyettrang/domain/requests/auth/register_request.dart';
import 'package:bongtuyettrang/presentation/home/home/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app/utils/validator.dart';
import '../widgets/commons/button.dart';
import '../widgets/commons/input.dart';
import 'cubit/auth_cubit.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController =
      TextEditingController(text: "Nguyễn Thành");
  TextEditingController phoneNumberController =
      TextEditingController(text: "0346542636");
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  late bool showPassword;

  String? fullNameError;
  String? phoneError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    showPassword = false;
  }

  void handleSignUP() {
    final authCubit = context.read<AuthCubit>();
    authCubit.signUp(RegisterRequest(
      fullName: fullNameController.text,
      phoneNumber: phoneNumberController.text,
      password: passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Sign up successfully"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
        } else if (state.statusCode == 422) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Phone number is already in use"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Material(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24),
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
                            error: fullNameError,
                            onChanged: (value) {
                              setState(() {
                                fullNameError =
                                    Validator.validateFullName(context, value);
                              });
                            },
                            controller: fullNameController,
                          ),
                          Input(
                            label: AppLocalizations.of(context)!.phoneNumber,
                            hint:
                                AppLocalizations.of(context)!.enterPhoneNumber,
                            maxLength: 10,
                            controller: phoneNumberController,
                            error: phoneError,
                            onChanged: (value) {
                              setState(() {
                                phoneError = Validator.validatePhoneNumber(
                                    context, value);
                              });
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          Input(
                            label: AppLocalizations.of(context)!.password,
                            hint: AppLocalizations.of(context)!.enterPassword,
                            controller: passwordController,
                            isPassword: true,
                            showPassword: showPassword,
                            error: passwordError,
                            onChanged: (value) {
                              setState(() {
                                passwordError =
                                    Validator.validatePassword(context, value);
                              });
                            },
                            togglePasswordVisibility: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                          Wrap(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .bySigningUp,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
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
                                          // TODO: Handle "Terms of Service" tap
                                        },
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!.and,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .privacyPolicy,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Colors.blue,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // TODO: Handle "Privacy Policy" tap
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
                              onPressed: () {
                                handleSignUP();
                              },
                              isDisabled: state.isLoading ||
                                  phoneNumberController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  fullNameController.text.isEmpty ||
                                  phoneError != null ||
                                  fullNameError != null ||
                                  passwordError != null),
                          if (state.isLoading)
                            LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(8),
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
                                AppLocalizations.of(context)!
                                    .alreadyHaveAnAccount,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
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
        },
      ),
    );
  }
}
