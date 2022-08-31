import 'package:flutter/material.dart';

class TourButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String label;
  final IconData? icon;
  final GestureTapCallback? onPressed;
  final bool? loading;
  final bool? disabled;
  const TourButton({
    Key? key,
    this.color,
    required this.label,
    this.onPressed,
    this.icon,
    this.textColor, 
    this.loading, this.disabled,
  }) : super(key: key);
  bool get clickable {
    return loading != true && disabled != true;
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: clickable ? SystemMouseCursors.click: SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: () {
          if (onPressed != null && clickable) {
            onPressed?.call();
          }
        },
        child: Container(
          height: 45,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: clickable ? color ?? Colors.primaries.first: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Row(
              children: [
                if (loading == true)
                  SizedBox(
                    height: 20, width: 20,
                    child: CircularProgressIndicator(
                      color: textColor ?? Colors.primaries.last,
                    ),
                  ) 
                else if (icon is IconData) Icon(icon, color: textColor ?? Colors.primaries.last,),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? Colors.primaries.last,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
