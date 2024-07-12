import 'package:flutter/material.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/core/constants/constants.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_cupertino_text_field.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_macos_popop_button.dart';

class CustomVoterEntryWidget extends StatelessWidget {
  const CustomVoterEntryWidget({
    super.key,
    required this.index,
    required this.canRemoveVoter,
    required this.onChanged,
    required this.onOptionSelected,
    required this.onRemoveVoter,
    required this.dataEntryData,
  });

  final int index;
  final bool canRemoveVoter;
  final Function(String, String) onChanged;
  final Function(String, String?) onOptionSelected;
  final Function() onRemoveVoter;
  final Map<String, dynamic> dataEntryData;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> voterData = dataEntryData["voters"][index];

    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Voter ${index + 1}',
                    style: kLabelTextStyle,
                  ),
                ),
                if (canRemoveVoter)
                  GestureDetector(
                    onTap: onRemoveVoter,
                    child: Icon(
                      Icons.remove_rounded,
                      color: kClearTextColor,
                    ),
                  ),
              ],
            ),
            const Divider(),
            Column(
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
                CustomMacosPopupButton(
                  title: "Registered to Vote",
                  name: "registered_to_vote",
                  items: dataEntryData['bool'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomMacosPopupButton(
                  title: "Vote Type",
                  name: "vote_type",
                  items: dataEntryData['vote_types'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const Divider(),
                CustomMacosPopupButton(
                  title: "Party Member",
                  name: "party_member",
                  items: dataEntryData['parties'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomMacosPopupButton(
                  title: "Voter Intent",
                  name: "voter_intent",
                  items: dataEntryData['parties'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomMacosPopupButton(
                  title: "Council Vote",
                  name: "council_vote",
                  items: dataEntryData['parties'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomMacosPopupButton(
                  title: "County Vote",
                  name: "county_vote",
                  items: dataEntryData['parties'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomMacosPopupButton(
                  title: "Country Vote",
                  name: "country_vote",
                  items: dataEntryData['parties'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const Divider(),
                CustomMacosPopupButton(
                  title: "Will to be Member",
                  name: "member",
                  items: dataEntryData['bool'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomMacosPopupButton(
                  title: "Will to be Volunteer",
                  name: "volunteer",
                  items: dataEntryData['bool'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomMacosPopupButton(
                  title: "Happy to Advertise",
                  name: "advertise",
                  items: dataEntryData['bool'],
                  voterData: voterData,
                  onOptionSelected: onOptionSelected,
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
          ],
        ),
      ),
    );
  }
}
