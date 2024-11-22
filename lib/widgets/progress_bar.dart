import 'package:flutter/material.dart';
class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purpleAccent,
              Colors.purpleAccent,
              Colors.purpleAccent,
              Colors.purpleAccent,
              Colors.white,
              Colors.purpleAccent,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent,
              blurRadius: 20,
              spreadRadius: -5,

            )
          ],

          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}
