import 'package:car_animation/core/constants.dart';
import 'package:car_animation/core/model/tyres_model.dart';
import 'package:flutter/material.dart';

class TyresPsiCard extends StatelessWidget {
  const TyresPsiCard({super.key, required this.isBottomTwoTyres, required this.tyrePsi});

  final bool isBottomTwoTyres;

  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: tyrePsi.isLowPressure ? redColor.withOpacity(0.2): Colors.white10,
        border: Border.all(color: tyrePsi.isLowPressure ? redColor:  primaryColor, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: isBottomTwoTyres ?
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          lowPressureText(),
          Spacer(),
           psiText(psiText: tyrePsi.psi.toString()),
          SizedBox(height: 15),

          Text("${tyrePsi.temp}\u2103", style: TextStyle(fontSize: 20, color: Colors.white)),
         
          

         
        ],

      ): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           psiText(psiText: tyrePsi.psi.toString()),
          SizedBox(height: 15),

          Text("${tyrePsi.temp}\u2103", style: TextStyle(fontSize: 20, color: Colors.white)),
          Spacer(),
          SizedBox(height: 15),
          lowPressureText(),

         
        ],
      ),
    );
  }

  Widget lowPressureText() {
    return Column(
      children: [
        Text(
              "Low".toUpperCase(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

             Text(
            "Pressure".toUpperCase(),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
      ],
    );
  }



  Text psiText({required String psiText}) {
    return Text.rich(
  TextSpan(
    text: psiText,
    style: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    children: [
      TextSpan(
        text: "psi",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    ],
  ),
          );
  }

 
}

