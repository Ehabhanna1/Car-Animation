import 'package:car_animation/core/constants.dart';
import 'package:car_animation/core/home_controller.dart';
import 'package:car_animation/screens/widgets/temp_buttom.dart';
import 'package:flutter/material.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TempButtom(
                activeColor: primaryColor,
                isActive: homeController.isCoolSelected,
                svgPic: 'assets/icons/coolShape.svg',
               title: 'Cool',
                onPress: homeController.updateCoolSelected,
                ),
                 SizedBox(width: 30),
                TempButtom(
                  activeColor: Colors.red,
                isActive: !homeController.isCoolSelected,
                svgPic: 'assets/icons/heatShape.svg',
               title: 'Heat',
                onPress: homeController.updateCoolSelected,
                ),
            ],
          ),
      
        Spacer(),
      
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                 icon: Icon(Icons.arrow_drop_up, size: 50,)),

                   Text("20" "\u2103", style: TextStyle(fontSize: 85),),
      
             IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){},
             icon: Icon(Icons.arrow_drop_down, size: 50,)),

            ],
          ),
      
           
             Spacer(),
      
             Text("CURRENT TEMPERATURE",style: TextStyle(fontSize: 17),),
             SizedBox(height: 20,),
      
             Row(
               children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("INSIDE",),
                    Text("20" "\u2103", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                  ],
                 ),
                 SizedBox(width: 20,),
      
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("INSIDE",style: TextStyle(color: Colors.white54),),
                    Text("35" "\u2103", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white54),),
                  ],
                 ),
               ],
             ),
        ],
      ),
    );
  }
}

