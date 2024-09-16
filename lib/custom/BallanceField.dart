import 'package:flutter/material.dart';

import '../utils/global.dart';

class BallanceField extends StatelessWidget {
  const BallanceField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              IconData(0xf05db, fontFamily: 'MaterialIcons'),
              size: 20,
            ),
            Text(balance.toInt().toString())
          ],
        ));
  }
}
