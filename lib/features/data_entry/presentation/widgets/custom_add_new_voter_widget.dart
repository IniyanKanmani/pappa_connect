import 'package:flutter/material.dart';
import 'package:pappa_connect/core/components/custom_container.dart';
import 'package:pappa_connect/core/constants/constants.dart';

class CustomAddNewVoterWidget extends StatelessWidget {
  const CustomAddNewVoterWidget({
    super.key,
    required this.addVoter,
  });

  final Function() addVoter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addVoter,
      child: CustomContainer(
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
      ),
    );
  }
}
