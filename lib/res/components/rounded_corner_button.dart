import 'package:flutter/material.dart';

class RoundedCornerButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final double height, width;
  final Color textColor, buttonColor;
  final VoidCallback onPressed;

  const RoundedCornerButton({
    Key? key,
    required this.isLoading,
    required this.title,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.textColor = Colors.purple,
    this.buttonColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        :  Container(
                height: height,
                width: width,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: InkWell(
                    hoverColor: Colors.blue,
                    onTap: onPressed,
                    splashColor: Colors.black,
                    onHover: (_) => Semantics(
                      label: 'press to login',
                    ),
                    child:Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                )),
          );
  }
}
