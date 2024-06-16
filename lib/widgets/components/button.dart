import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.label,
      required this.onPressed,
      this.isOutline = false,
      this.isDisabled = false,
      this.icon
      });

  final String label;
  final Function onPressed;
  final bool isOutline;
  final bool isDisabled;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutline ? Colors.transparent : Colors.black,
        fixedSize: const Size(double.infinity, 54),
        side: isOutline
            ? const BorderSide(color: Colors.black12, width: 1)
            : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledBackgroundColor: Colors.black12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isOutline ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (icon != null) const SizedBox(width: 8),
          if (icon != null)
            Icon(
              icon,
              color: isOutline ? Colors.black : Colors.white,
            ),
        ],
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
