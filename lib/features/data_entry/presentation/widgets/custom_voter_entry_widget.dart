import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/core/constants/constants.dart';

class CustomVoterEntryWidget extends StatelessWidget {
  const CustomVoterEntryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Voter 1',
            style: kLabelTextStyle,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoTextField(
                  placeholder: 'First Name',
                  placeholderStyle: kHintTextStyle,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  style: kLabelTextStyle,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CupertinoTextField(
                  placeholder: 'Last Name',
                  placeholderStyle: kHintTextStyle,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  style: kLabelTextStyle,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CupertinoTextField(
                  placeholder: 'Email',
                  placeholderStyle: kHintTextStyle,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: kLabelTextStyle,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CupertinoTextField(
                  placeholder: 'Contact No',
                  placeholderStyle: kHintTextStyle,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  style: kLabelTextStyle,
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Registered to Vote',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 34.0,
                        child: MacosPopupButton(
                          value: 'No',
                          style: kLabelTextStyle,
                          items: <String>[
                            'Yes',
                            'No',
                          ]
                              .map<MacosPopupMenuItem<String>>(
                                  (value) => MacosPopupMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: kLabelTextStyle,
                                        ),
                                      ))
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Vote Type',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 34.0,
                        child: MacosPopupButton(
                          style: kLabelTextStyle,
                          items: <String>[
                            'Postal',
                            'In Person',
                          ].map<MacosPopupMenuItem<String>>((String value) {
                            return MacosPopupMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kLabelTextStyle,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Party Member',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 34.0,
                        child: MacosPopupButton(
                          style: kLabelTextStyle,
                          items: <String>[
                            'Labour',
                            'Conservatives',
                            'Liberal Democrats',
                            'Green',
                            'Reform UK',
                            'Other',
                          ].map<MacosPopupMenuItem<String>>((String value) {
                            return MacosPopupMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kLabelTextStyle,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Voter Intent',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 34.0,
                        child: MacosPopupButton(
                          style: kLabelTextStyle,
                          items: <String>[
                            'Labour',
                            'Conservatives',
                            'Liberal Democrats',
                            'Green',
                            'Reform UK',
                            'Other',
                          ].map<MacosPopupMenuItem<String>>((String value) {
                            return MacosPopupMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kLabelTextStyle,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Council Vote',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 34.0,
                        child: MacosPopupButton(
                          style: kLabelTextStyle,
                          items: <String>[
                            'Labour',
                            'Conservatives',
                            'Liberal Democrats',
                            'Green',
                            'Reform UK',
                            'Other',
                          ].map<MacosPopupMenuItem<String>>((String value) {
                            return MacosPopupMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kLabelTextStyle,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'County Vote',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 34.0,
                        child: MacosPopupButton(
                          style: kLabelTextStyle,
                          items: <String>[
                            'Labour',
                            'Conservatives',
                            'Liberal Democrats',
                            'Green',
                            'Reform UK',
                            'Other',
                          ].map<MacosPopupMenuItem<String>>((String value) {
                            return MacosPopupMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kLabelTextStyle,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Country Vote',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 34.0,
                        child: MacosPopupButton(
                          style: kLabelTextStyle,
                          items: <String>[
                            'Labour',
                            'Conservatives',
                            'Liberal Democrats',
                            'Green',
                            'Reform UK',
                            'Other',
                          ].map<MacosPopupMenuItem<String>>((String value) {
                            return MacosPopupMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kLabelTextStyle,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                CupertinoTextField(
                  placeholder: 'Comments',
                  placeholderStyle: kHintTextStyle,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 5,
                  style: kLabelTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
