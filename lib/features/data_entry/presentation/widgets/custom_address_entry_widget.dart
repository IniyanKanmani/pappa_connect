import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/core/constants/constants.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_cupertino_auto_text_field.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_cupertino_text_field.dart';

class CustomAddressEntryWidget extends StatelessWidget {
  const CustomAddressEntryWidget({
    super.key,
    required this.onAddressEntryTypeChange,
    required this.onPostcodeSearch,
    required this.onAddressSelected,
    required this.onChanged,
    required this.dataEntryData,
  });

  final Function(String) onAddressEntryTypeChange;
  final Function(String) onPostcodeSearch;
  final Function(String) onAddressSelected;
  final Function(String, String) onChanged;
  final Map<String, dynamic> dataEntryData;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> addressData = dataEntryData["address"];

    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Address',
                style: kLabelTextStyle,
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    onAddressEntryTypeChange("location");
                  },
                  child: const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: dataEntryData["is_website_loaded"]
                      ? () {
                          onAddressEntryTypeChange("postcode");
                        }
                      : null,
                  child: const Text(
                    "Postcode",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (dataEntryData["address_entry_type"] == 'postcode')
                  CustomCupertinoAutoTextField(
                    placeholder: 'Search',
                    initialValue: dataEntryData["postcode_search"],
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.done,
                    dataEntryData: dataEntryData,
                    onAddressSelected: onAddressSelected,
                    onChanged: onPostcodeSearch,
                  ),
                if (dataEntryData["address_entry_type"] == 'postcode')
                  const SizedBox(
                    height: 15.0,
                  ),
                CustomCupertinoTextField(
                  placeholder: 'Address line 1',
                  controller:
                      TextEditingController(text: addressData['street']),
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    onChanged('street', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'Address line 2',
                  controller: TextEditingController(text: addressData['flat']),
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    onChanged('flat', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'City/Town',
                  controller: TextEditingController(text: addressData['city']),
                  onChanged: (value) {
                    onChanged('city', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'County',
                  controller:
                      TextEditingController(text: addressData['county']),
                  onChanged: (value) {
                    onChanged('county', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'Postcode',
                  controller:
                      TextEditingController(text: addressData['postcode']),
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (value) async {
                    onChanged('postcode', value);
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
