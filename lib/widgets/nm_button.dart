import 'package:flutter/material.dart';
import 'package:parking/widgets/nm_box.dart';

class NMButton extends StatelessWidget {
  final IconData icon;
  const NMButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: nMbox,
      child: Icon(
        icon,
        color: fCL,
      ),
    );
  }
}
