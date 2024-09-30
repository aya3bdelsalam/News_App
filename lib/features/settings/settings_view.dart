import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../core/color_palette.dart';
import '../../core/config/settings_provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String> _languages = ["English", "عربي"];
  // List<String> _themes = [localization.light, localization.dark];
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
              Text(
                  localization.language,
                style:TextStyle(
                  fontFamily: "Exo",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )
              ),
              const SizedBox(height: 15,),
          CustomDropdown<String>(
            items: _languages,
            //============??????????????????????????????????????
            initialItem: provider.currentLanguage == "en"
                ? _languages[0]
                : _languages[1],
            onChanged: (value) {
              if (value == "English") {
                provider.changeCurrentLanguage("en");
              }
              if (value == "عربي") {
                provider.changeCurrentLanguage("ar");
              }
              log("Changing value to: $value");
            },
            decoration:CustomDropdownDecoration(
              closedFillColor:
               Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color:
                 Colors.black,
              ),
              expandedFillColor:
               Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.black,
              ),
            ),
          ),

        ]
      ),
    );
  }
}
