import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/providers/theme_provider.dart';

enum SingingCharacter { dark, light }

class MyRadioButtn extends StatefulWidget {
  const MyRadioButtn({super.key});

  @override
  State<MyRadioButtn> createState() => _MyRadioButtnState();
}

class _MyRadioButtnState extends State<MyRadioButtn> {
  SingingCharacter? _character = SingingCharacter.dark;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Dark'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.dark,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Light'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.light,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
