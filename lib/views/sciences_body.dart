import 'package:flutter/material.dart';

class SciencesBody extends StatelessWidget {
  const SciencesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(
          'SciencesBody',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

