import 'package:car_animation/core/constants.dart';
import 'package:car_animation/core/home_controller.dart';
import 'package:car_animation/core/model/tyres_model.dart';
import 'package:car_animation/screens/widgets/battery_status.dart';
import 'package:car_animation/screens/widgets/button_nav_bar.dart';
import 'package:car_animation/screens/widgets/door_lock.dart';
import 'package:car_animation/screens/widgets/temp_details.dart';
import 'package:car_animation/screens/widgets/tyres_list.dart';
import 'package:car_animation/screens/widgets/tyres_psi_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // home controller
  HomeController homeController = HomeController();

  /// battery controller
  ///

  late AnimationController batteryAnimatedController;
  late Animation<double> batteryAnimation;
  late Animation<double> batteryStatusAnimation;

  /// end battery controller
  ///
  /// temprature controller
  ///
  late AnimationController tempratureAnimationController;
  late Animation<double> carShiftAnimation;
  late Animation<double> tempratureShowInfoAnimation;
  late Animation<double> temCoolGlowAnimation;

  /// end temprature controller
  ///
  ///tyres animation controller
  late AnimationController tyresAnimationController;
  late Animation<double> tyresAnimation1Psi;
  late Animation<double> tyresAnimation2Psi;
  late Animation<double> tyresAnimation3Psi;
  late Animation<double> tyresAnimation4Psi;

  late List<Animation<double>> tyresAnimation;

  ///
  ///
  void setupTyresAnimation() {
    tyresAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    );
    tyresAnimation1Psi = CurvedAnimation(
      parent: tyresAnimationController,
      curve: Interval(0.34, 0.5),
    );
    tyresAnimation2Psi = CurvedAnimation(
      parent: tyresAnimationController,
      curve: Interval(0.5, 0.66),
    );
    tyresAnimation3Psi = CurvedAnimation(
      parent: tyresAnimationController,
      curve: Interval(0.66, 0.82),
    );
    tyresAnimation4Psi = CurvedAnimation(
      parent: tyresAnimationController,
      curve: Interval(0.82, 1),
    );
  }

  void setupTempratureAnimation() {
    tempratureAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    carShiftAnimation = CurvedAnimation(
      parent: tempratureAnimationController,
      curve: Interval(0, 0.2),
    );
    tempratureShowInfoAnimation = CurvedAnimation(
      parent: tempratureAnimationController,
      curve: Interval(0.25, 0.45),
    );
    temCoolGlowAnimation = CurvedAnimation(
      parent: tempratureAnimationController,
      curve: Interval(0.45, 1),
    );
  }

  ///functions of battery
  void setupBatteryAnimated() {
    batteryAnimatedController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    batteryAnimation = CurvedAnimation(
      parent: batteryAnimatedController,
      curve: Interval(0, 0.5),
    );
    batteryStatusAnimation = CurvedAnimation(
      parent: batteryAnimatedController,
      curve: Interval(0.6, 1),
    );
  }

  @override
  void initState() {
    super.initState();
    setupBatteryAnimated();
    setupTempratureAnimation();
    setupTyresAnimation();
    tyresAnimation = [tyresAnimation1Psi, tyresAnimation2Psi, tyresAnimation3Psi, tyresAnimation4Psi];
  }

  @override
  void dispose() {
    homeController.dispose();
    batteryAnimatedController.dispose();
    tempratureAnimationController.dispose();
    tyresAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // this animation need listnable
      animation: Listenable.merge([
        homeController,
        batteryAnimatedController,
        tempratureAnimationController,
        tyresAnimationController,
      ]),
      builder:
          (context, child) => Scaffold(
            bottomNavigationBar: ButtomNavBar(
              selectedButtom: homeController.selectedButtom,
              onTap: (index) {
                // condition to start animation
                // battery screen animation
                if (index == 1) {
                  batteryAnimatedController.forward();
                } else if (homeController.selectedButtom == 1 && index != 1) {
                  batteryAnimatedController.reverse(from: 0.7);
                }
                // end battery screen contion
                ///
                ///temprature screen condition start
                if (index == 2) {
                  tempratureAnimationController.forward();
                } else if (homeController.selectedButtom == 2 && index != 2) {
                  tempratureAnimationController.reverse(from: 0.2);
                }

                /// temp screen end here
                ///
                /// tyres start here
                ///
                if (index == 3) {
                  tyresAnimationController.forward();
                } else if (homeController.selectedButtom == 3 && index != 3) {
                  tyresAnimationController.reverse();
                }
                homeController.showTyresController(index);
                homeController.tyresStatusController(index);

                ///
                homeController.selectedButtonsNavBarChange(index);
              },
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder:
                    (context, constraints) => Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                        ),

                        Positioned(
                          left:
                              constraints.maxWidth /
                              2 *
                              carShiftAnimation.value,
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.1,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Car.svg",
                              width: double.infinity,
                            ),
                          ),
                        ),

                        AnimatedPositioned(
                          duration: defaultDuration,
                          right:
                              homeController.selectedButtom == 0
                                  ? constraints.maxWidth * 0.045
                                  : constraints.maxWidth / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: homeController.selectedButtom == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: homeController.isRightDoorLock,
                              press: homeController.updateRightDoorLock,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: defaultDuration,
                          left:
                              homeController.selectedButtom == 0
                                  ? constraints.maxWidth * 0.045
                                  : constraints.maxWidth / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: homeController.selectedButtom == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: homeController.isLeftDoorLock,
                              press: homeController.updateLeftDoorLock,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: defaultDuration,
                          top:
                              homeController.selectedButtom == 0
                                  ? constraints.maxHeight * 0.15
                                  : constraints.maxHeight / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: homeController.selectedButtom == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: homeController.isBennetLock,
                              press: homeController.updateBennetDoorLock,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: defaultDuration,
                          bottom:
                              homeController.selectedButtom == 0
                                  ? constraints.maxHeight * 0.18
                                  : constraints.maxHeight / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: homeController.selectedButtom == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: homeController.isTrunkLock,
                              press: homeController.updateTrunkLock,
                            ),
                          ),
                        ),

                        /// Battery screen start here
                        ///
                        Opacity(
                          opacity: batteryAnimation.value,
                          child: SvgPicture.asset(
                            "assets/icons/Battery.svg",
                            width: constraints.maxWidth * 0.46,
                          ),
                        ),
                        Positioned(
                          top: 50 * (1 - batteryStatusAnimation.value),
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Opacity(
                            opacity: batteryStatusAnimation.value,
                            child: BatteryStatus(constraints: constraints),
                          ),
                        ),

                        /// Battery Screen end here
                        ///
                        /// temprature screen start here
                        ///
                        Positioned(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          top: 60 * (1 - tempratureShowInfoAnimation.value),

                          child: Opacity(
                            opacity: tempratureShowInfoAnimation.value,

                            child: TempDetails(homeController: homeController),
                          ),
                        ),

                        Positioned(
                          right: -180 * (1 - temCoolGlowAnimation.value),
                          child: AnimatedSwitcher(
                            duration: defaultDuration,
                            child:
                                homeController.isCoolSelected
                                    ? Image.asset(
                                      "assets/images/Cool_glow_2.png",
                                      width: 200,
                                      key: UniqueKey(),
                                    )
                                    : Image.asset(
                                      "assets/images/Hot_glow_4.png",
                                      width: 200,
                                      key: UniqueKey(),
                                    ),
                          ),
                        ),

                        /// temprature screen end here
                        ///
                        /// tyre screen start here
                        ///
                        if (homeController.isShowTyres) ...tyres(constraints),
                        if (homeController.isTyresStatus)
                          GridView.builder(
                            itemCount: 4,
                            physics: NeverScrollableScrollPhysics(),

                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 22,
                                  crossAxisSpacing: 20,
                                  childAspectRatio:
                                      constraints.maxWidth /
                                      constraints.maxHeight,
                                ),
                            itemBuilder: (context, index) {
                              return ScaleTransition(
                                scale: tyresAnimation[index],
                                child: TyresPsiCard(
                                  isBottomTwoTyres: index > 1,
                                  tyrePsi: demoPsiList[index],
                                ),
                              );
                            },
                          ),

                        /// tyre screen end here
                        ///
                        ///
                      ],
                    ),
              ),
            ),
          ),
    );
  }
}
