import 'package:flutter/material.dart';

class GeneralExceptionWidget extends StatelessWidget {
  VoidCallback handlePress;

  GeneralExceptionWidget({super.key, required this.handlePress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.not_interested_outlined,
          color: Colors.red,
          size: 80,
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          'Sorry for Inconvenience, Something went wrong',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        OutlinedButton(
          onPressed: handlePress,
          child: Text('Retry'),
        ),
      ],
    );
  }
}
