import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        elevation: 5, // Raise the button
        padding: EdgeInsets.symmetric(
            horizontal: 30, vertical: 15), // Padding inside the button
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
