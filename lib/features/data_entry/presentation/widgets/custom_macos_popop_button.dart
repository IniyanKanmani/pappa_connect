import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:pappa_connect/core/constants/constants.dart';

class CustomMacosPopupButton extends StatelessWidget {
  const CustomMacosPopupButton({
    super.key,
    required this.title,
    required this.name,
    required this.items,
    required this.voterData,
    required this.onOptionSelected,
  });

  final String title;
  final String name;
  final List<String> items;
  final Function(String, String?) onOptionSelected;
  final Map<String, dynamic> voterData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: kLabelTextStyle,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 34.0,
            child: MacosPopupButton<String?>(
              value: voterData[name],
              style: kLabelTextStyle,
              items: items.map<MacosPopupMenuItem<String>>((String value) {
                return MacosPopupMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: kLabelTextStyle,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                onOptionSelected(name, value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
