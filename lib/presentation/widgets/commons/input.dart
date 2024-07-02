import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.label,
    this.hint,
    this.error,
    this.controller,
    this.isPassword,
    this.showPassword,
    this.togglePasswordVisibility,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.maxLength,
  });

  final String? label;
  final String? hint;
  final String? error;
  final TextEditingController? controller;
  final bool? isPassword;
  final bool? showPassword;
  final VoidCallback? togglePasswordVisibility;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Text(
                label!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            if (label != null) const SizedBox(height: 4),
            TextField(
              controller: controller,
              obscureText: isPassword == true && showPassword == false,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              focusNode: focusNode,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              onTap: onTap,
              maxLength: maxLength,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                hintText: hint,
                errorText: error,
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                suffixIcon: isPassword == true
                    ? IconButton(
                        icon: Icon(
                          showPassword == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: togglePasswordVisibility,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
