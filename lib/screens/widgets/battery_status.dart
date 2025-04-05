import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "250 min",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "65%",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          "Charging".toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "25 min remaining",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.13),
        Row(
          children: [
            Text(
              "25 min/hr",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Spacer(),
            Text(
              "220 V",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: constraints.maxHeight * 0.03),
      ],
    );
  }
}
