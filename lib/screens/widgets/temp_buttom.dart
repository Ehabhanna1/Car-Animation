import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TempButtom extends StatelessWidget {
  const TempButtom( {super.key, required this.svgPic, required this.onPress, required this.title, this.isActive = false, required this.activeColor,});

  final String svgPic;
  final String title;
  final bool isActive;
  final VoidCallback onPress;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            height: isActive ? 80 : 55,
            width:  isActive ? 80 : 55,
            child: SvgPicture.asset(svgPic, color: isActive ? activeColor : Colors.white70),
          ),
          SizedBox(height: 10),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(color: isActive ? activeColor : Colors.white70, fontSize: 17,
              fontWeight: isActive ? FontWeight.w800: FontWeight.normal,
              
              ),
            
            child: Text(
              title.toUpperCase(),
              
            ),
          ),
        ],
      ),
    );
  }
}

 