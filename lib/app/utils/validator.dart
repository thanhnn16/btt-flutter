import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validator {
  static String? validateFullName(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.validFullName;
    }

    return null;
  }

  static String? validatePhoneNumber(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.emptyPhoneNumber;
    }

    final hasMatch = RegExp(r'^0[0-9]{9}$').hasMatch(value);

    if (!hasMatch) {
      return AppLocalizations.of(context)!.invalidPhoneNumber;
    }

    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.emptyPassword;
    }

    if (value.length < 6 || value.length > 12) {
      return AppLocalizations.of(context)!.invalidPassword;
    }

    return null;
  }

  static String? validateConfirmPassword(
      BuildContext context, String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppLocalizations.of(context)!.emptyConfirmPassword;
    }

    if (password != confirmPassword) {
      return AppLocalizations.of(context)!.passwordNotMatch;
    }

    return null;
  }
}
