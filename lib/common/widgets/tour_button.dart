import 'package:flutter/material.dart';

class TourButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String text;
  final IconData? icon;
  final GestureTapCallback? onPress;
  const TourButton({
    Key? key,
    this.color,
    required this.text,
    this.onPress,
    this.icon, this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              if (onPress != null) {
                onPress?.call();
              }
            },
            child: Container(
              height: 56,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color?? Colors.primaries.first,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Row(
                  children: [
                    if (icon is IconData ) Icon(icon),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(text, style: TextStyle(
                      color: textColor ?? Colors.primaries.last
                    ),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
