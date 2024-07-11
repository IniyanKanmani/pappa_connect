import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/core/constants/constants.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_cupertino_text_field.dart';

class CustomVoterEntryWidget extends StatelessWidget {
  const CustomVoterEntryWidget({
    super.key,
    required this.index,
    required this.onChanged,
    required this.onOptionSelected,
    required this.voterData,
  });

  final int index;
  final Function(String, String) onChanged;
  final Function(String, String?) onOptionSelected;
  final Map<String, dynamic> voterData;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Voter ${index + 1}',
            style: kLabelTextStyle,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomCupertinoTextField(
                  placeholder: 'First Name',
                  controller:
                      TextEditingController(text: voterData['firstname']),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    onChanged('firstname', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'Last Name',
                  controller:
                      TextEditingController(text: voterData['lastname']),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    onChanged('lastname', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'Email',
                  controller: TextEditingController(text: voterData['email']),
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  onChanged: (value) {
                    onChanged('email', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'Contact No',
                  controller:
                      TextEditingController(text: voterData['contact_no']),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    onChanged('contact_no', value);
                  },
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
                        child: MacosPopupButton<String?>(
                          value: voterData['registered_to_vote'],
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
                          onChanged: (value) {
                            onOptionSelected("registered_to_vote", value);
                          },
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
                        child: MacosPopupButton<String?>(
                          value: voterData['vote_type'],
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
                          onChanged: (value) {
                            onOptionSelected("vote_type", value);
                          },
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
                        child: MacosPopupButton<String?>(
                          value: voterData['party_member'],
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
                          onChanged: (value) {
                            onOptionSelected("party_member", value);
                          },
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
                        child: MacosPopupButton<String?>(
                          value: voterData['voter_intent'],
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
                          onChanged: (value) {
                            onOptionSelected("voter_intent", value);
                          },
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
                        child: MacosPopupButton<String?>(
                          value: voterData['council_vote'],
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
                          onChanged: (value) {
                            onOptionSelected("council_vote", value);
                          },
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
                        child: MacosPopupButton<String?>(
                          value: voterData['county_vote'],
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
                          onChanged: (value) {
                            onOptionSelected("county_vote", value);
                          },
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
                        child: MacosPopupButton<String?>(
                          value: voterData['country_vote'],
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
                          onChanged: (value) {
                            onOptionSelected("country_vote", value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                CustomCupertinoTextField(
                  placeholder: 'Comments',
                  controller:
                      TextEditingController(text: voterData['comments']),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 5,
                  onChanged: (value) {
                    onChanged('comments', value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
