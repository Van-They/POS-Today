part of 'select_language_cubit.dart';

@immutable
sealed class SelectLanguageState {}

final class SelectLanguageInitial extends SelectLanguageState {}

final class SelectedLanguageState extends SelectLanguageState {
  final SupportLanguage language;
  SelectedLanguageState({this.language = SupportLanguage.en});
}
