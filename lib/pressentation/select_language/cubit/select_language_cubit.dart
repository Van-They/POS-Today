import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_today/pressentation/select_language/select_language_screen.dart';

part 'select_language_state.dart';

class SelectLanguageCubit extends Cubit<SelectLanguageState> {
  SelectLanguageCubit() : super(SelectedLanguageState());
  
  void onSelectLanguage(SupportLanguage language) {
    emit(SelectedLanguageState(language: language));
  }
}
