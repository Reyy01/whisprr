import 'package:flutter/material.dart';
import 'package:whisprr_mobile/core/utils/cutom_colors.dart';
import 'package:whisprr_mobile/core/widgets/LoadingIndicator.atom.dart';

class ButtonAtom extends StatelessWidget {
  const ButtonAtom({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading,
    this.hasIcon,
    this.icon,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final Function() onPressed;
  final bool? isLoading;
  final bool? hasIcon;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ButtonStyle(
      elevation: WidgetStateProperty.all<double>(0),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? CustomColors.darkOrange),
    );
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: hasIcon ?? false
          ? ElevatedButton.icon(
              onPressed: onPressed,
              style: buttonStyle,
              label: Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                ),
              ),
              icon: icon,
            )
          : ElevatedButton(
              onPressed: () {
                onPressed();
              },
              style: buttonStyle,
              child: isLoading ?? false
                  ? LoadingIndicatorAtom(
                      loadingColor: textColor ?? Colors.white)
                  : Text(
                      text,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
                      ),
                    ),
            ),
    );
  }
}
