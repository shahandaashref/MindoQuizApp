import 'package:flutter/material.dart';
import 'package:mindo/generated/l10n.dart';

class NextButton extends StatelessWidget {
  final bool isLast;
  final VoidCallback onPressed;

  const NextButton({super.key, required this.isLast, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        isLast ? S.of(context).finish : S.of(context).next,
        style: const TextStyle(fontSize: 18, color: Colors.white) , 
      ),
    );
  }
}