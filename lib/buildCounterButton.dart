import 'package:flutter/material.dart';
import 'constants.dart';

class BuildCounterButton extends StatelessWidget {
  const BuildCounterButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      width: size.width > 600 ? 80 : 40,
      height: size.width > 600 ? 62 : 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: onPressed,
        child: Icon(icon, color: lightTextColor),
      ),
    );
  }
}