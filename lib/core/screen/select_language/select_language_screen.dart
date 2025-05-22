import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_today/core/utils/pst_extension.dart';
import 'package:pos_today/core/screen/home/home_content_fragment.dart';
import 'package:pos_today/core/screen/select_language/cubit/select_language_cubit.dart';
import 'package:pos_today/widget/text.dart';

enum SupportLanguage { en, kh }

const languageRoute = "/languagescreen";

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  late SelectLanguageCubit cubit;

  @override
  void initState() {
    cubit = SelectLanguageCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<SelectLanguageCubit, SelectLanguageState>(
          builder: (context, state) {
            if (state is SelectedLanguageState) {
              return selectLanguage(
                state: state,
                onChange: (language) {
                  cubit.onSelectLanguage(language);
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget selectLanguage({
    required SelectedLanguageState state,
    required Function(SupportLanguage) onChange,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox.shrink(),
          SizedBox.shrink(),
          PstText(text: "Please Choose Language", fontSize: 22.dp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card.filled(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.dp),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.dp),
                  width: MediaQuery.of(context).size.width * .8,
                  height: 56.dp,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox.adaptive(
                        value: state.language == SupportLanguage.en,
                        onChanged: (value) {
                          onChange(SupportLanguage.en);
                        },
                      ),
                      PstText(text: "English"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.dp),
              Card.filled(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.dp),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.dp),
                  width: MediaQuery.of(context).size.width * .8,
                  height: 56.dp,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox.adaptive(
                        value: state.language == SupportLanguage.kh,
                        onChanged: (value) {
                          onChange(SupportLanguage.kh);
                        },
                      ),
                      PstText(text: "Khmer"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width * .5, 56.dp)
            ),
            onPressed: () {
              context.go(homeContentRoute);
            },
            child: PstText(text: "Next", color: context.color.surface),
          ),
          SizedBox.shrink(),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
