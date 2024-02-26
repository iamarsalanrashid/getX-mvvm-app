import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  VoidCallback handlePress;

  InternetExceptionWidget({super.key, required this.handlePress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.cloud_off_outlined,
          color: Colors.red,
          size: 80,
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          'Sorry for Inconvenience, The internet is unavailable',
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
