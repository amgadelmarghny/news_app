import 'package:flutter/material.dart';

class BusinessBody extends StatelessWidget {
  const BusinessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text('Business Body'),
      ),
    );
  }
}
