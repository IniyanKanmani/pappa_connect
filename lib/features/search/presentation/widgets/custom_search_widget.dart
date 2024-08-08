import 'package:flutter/material.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/features/search/presentation/widgets/custom_cupertino_auto_text_field.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.searchData,
    required this.onAddressSelected,
    required this.onChanged,
  });

  final Map<String, dynamic> searchData;
  final Function(String) onAddressSelected;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomCupertinoAutoTextField(
                  placeholder: 'Search',
                  initialValue: searchData["search"],
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.done,
                  searchData: searchData,
                  onAddressSelected: onAddressSelected,
                  onChanged: onChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
