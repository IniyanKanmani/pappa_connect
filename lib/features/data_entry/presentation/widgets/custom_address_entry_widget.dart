import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/core/constants/constants.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_cupertino_text_field.dart';

class CustomAddressEntryWidget extends StatelessWidget {
  const CustomAddressEntryWidget({
    super.key,
    required this.onFieldChanged,
    required this.addressData,
  });

  final Function(String, String) onFieldChanged;
  final Map<String, dynamic> addressData;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Address',
            style: kLabelTextStyle,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                onPressed: () {},
                child: const Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {},
                child: const Text(
                  "Postcode",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomCupertinoTextField(
                  placeholder: 'Address line 1',
                  controller:
                      TextEditingController(text: addressData['line-1']),
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (value) {
                    onFieldChanged('line-1', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'Address line 2',
                  controller:
                      TextEditingController(text: addressData['line-2']),
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (value) {
                    onFieldChanged('line-2', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'City/Town',
                  controller: TextEditingController(text: addressData['city']),
                  onSubmitted: (value) {
                    onFieldChanged('city', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'County',
                  controller:
                      TextEditingController(text: addressData['county']),
                  onSubmitted: (value) {
                    onFieldChanged('county', value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomCupertinoTextField(
                  placeholder: 'Postcode',
                  controller:
                      TextEditingController(text: addressData['postcode']),
                  onSubmitted: (value) {
                    onFieldChanged('postcode', value);
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
