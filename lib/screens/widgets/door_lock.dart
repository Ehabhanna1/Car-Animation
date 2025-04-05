import 'package:car_animation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({super.key, required this.press, required this.isLock});

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      // animation lock and unlock switch
      child: AnimatedSwitcher(
        duration: defaultDuration,
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child:
            isLock
                ? SvgPicture.asset(
                  "assets/icons/door_lock.svg",
                  key: ValueKey("lock"),
                )
                : SvgPicture.asset(
                  "assets/icons/door_unlock.svg",
                  key: ValueKey("unlock"),
                ),
      ),
    );
  }
}
