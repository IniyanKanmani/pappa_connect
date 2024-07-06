import 'package:flutter/material.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/core/constants/constants.dart';

class CustomAddNewVoterWidget extends StatelessWidget {
  const CustomAddNewVoterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            'Add Voter',
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
