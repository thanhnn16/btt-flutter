import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences prefs;

  LanguageCubit(this.prefs)
      : super(LanguageState(Locale(
          prefs.getString('languageCode') ?? 'en',
        )));

  void changeLanguage(Locale locale) {
    prefs.setString('languageCode', locale.languageCode);
    emit(LanguageState(locale));
  }
}
