import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pappa_connect/core/constants/constants.dart';

class CustomCupertinoAutoTextField extends StatelessWidget {
  const CustomCupertinoAutoTextField({
    super.key,
    required this.placeholder,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.words,
    required this.onAddressSelected,
    required this.onChanged,
    required this.dataEntryData,
  });

  final String placeholder;
  final String initialValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) onAddressSelected;
  final Function(String) onChanged;
  final Map<String, dynamic> dataEntryData;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Autocomplete<String>(
        optionsBuilder: (_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          if (dataEntryData['postcode_search_edited'] &&
              dataEntryData["postcode_search"].length > 4) {
            return dataEntryData["addresses"].cast<String>();
          } else {
            return [];
          }
        },
        optionsViewBuilder: (BuildContext context,
            void Function(String) onSelected, Iterable<String> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth,
                maxHeight: 210.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: kDropdownMenuFillColor,
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  boxShadow: kBoxShadowList,
                ),
                child: ListView.builder(
                  itemCount: options.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        String address = options.elementAt(index);
                        onSelected(dataEntryData["postcode_search"]);
                        onAddressSelected(address);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          options.elementAt(index),
                          style: kLabelTextStyle,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController controller,
            FocusNode node,
            void Function() onFieldSubmitted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.text = initialValue;
          });

          return Material(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: SizedBox(
              height: 35.0,
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                textCapitalization: textCapitalization,
                style: kLabelTextStyle,
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: kHintTextStyle,
                  filled: true,
                  fillColor: const CupertinoDynamicColor.withBrightness(
                    color: CupertinoColors.white,
                    darkColor: CupertinoColors.black,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: CupertinoColors.separator),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: CupertinoColors.separator),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: CupertinoColors.separator),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  contentPadding: const EdgeInsets.all(7.0),
                ),
                focusNode: node,
                onChanged: (value) {
                  controller.text = value;
                  onChanged(value);
                },
              ),
            ),
          );
        },
      );
    });
  }
}
