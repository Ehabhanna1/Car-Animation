import 'package:car_animation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({
    super.key,
    required this.selectedButtom,
    required this.onTap,
  });

  final int selectedButtom;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedButtom,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,

      items: List.generate(
        4,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            buttomNavBarIcons[index],
            color: index == selectedButtom ? primaryColor : Colors.white54,
          ),
          label: '',
        ),
      ),
    );
  }
}

List<String> buttomNavBarIcons = [
  "assets/icons/Lock.svg",
  "assets/icons/Charge.svg",
  "assets/icons/Temp.svg",
  "assets/icons/Tyre.svg",
];
