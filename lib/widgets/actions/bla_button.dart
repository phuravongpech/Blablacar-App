import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final bool isEnabled;

  const BlaButton({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    required this.buttonType,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = buttonType == ButtonType.primary;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: isEnabled
            ? (isPrimary ? BlaColors.primary : BlaColors.white)
            : BlaColors.disabled,
        borderRadius: BorderRadius.circular(25),
        border: isPrimary
            ? null
            : Border.all(color: BlaColors.backgroundAccent, width: 3),
      ),
      child: TextButton.icon(
        onPressed: isEnabled ? onPressed : null,
        icon: Icon(
          icon,
          color: isEnabled
              ? (isPrimary ? Colors.white : BlaColors.primary)
              : BlaColors.greyLight,
        ),
        label: Text(
          text ?? '',
          style: BlaTextStyles.label.copyWith(
            color: isEnabled
                ? (isPrimary ? BlaColors.white : BlaColors.primary)
                : BlaColors.greyLight,
          ),
        ),
      ),
    );
  }
}
