
import 'package:flutter/material.dart';

import '../constant.dart';

class IconContent extends StatelessWidget {
  const IconContent({@required this.icon, @required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          '$label',
          style: kLabelStyle,
        )
      ],
    );
  }
}