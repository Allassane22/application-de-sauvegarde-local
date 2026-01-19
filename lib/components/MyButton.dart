import 'package:flutter/material.dart';


class Mybutton extends StatelessWidget {
  final String text;
  final onTap;

  final String? logo;

  final Color color;
  final Color textColor;
  final Color borderColor;

  // Sélection
  final bool isSelected;

  const Mybutton({
    super.key,
    required this.text,
    required this.onTap,
    this.logo,
    this.isSelected = true,
    this.color = Colors.orange,
    this.textColor = Colors.black,
    this.borderColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: borderColor),
        ),
        child: (logo == null && !isSelected)
            ? Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
