import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedButtom = 0;

  void selectedButtonsNavBarChange(int index) {
    selectedButtom = index;
    notifyListeners();
  }

  // use home controller for logic
  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBennetLock = true;
  bool isTrunkLock = true;

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;

    notifyListeners(); // this in provider like setstate in state management
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;

    notifyListeners(); // this in provider like setstate in state management
  }

  void updateBennetDoorLock() {
    isBennetLock = !isBennetLock;

    notifyListeners(); // this in provider like setstate in state management
  }

  void updateTrunkLock() {
    isTrunkLock = !isTrunkLock;

    notifyListeners(); // this in provider like setstate in state management
  }

  /// temp controller

  bool isCoolSelected = false;
  void updateCoolSelected() {
    isCoolSelected = !isCoolSelected;

    notifyListeners();
  }

  /// tyres
  ///

  bool isShowTyres = false;

  void showTyresController(int index) {
    if (selectedButtom != 3 && index == 3) {
      Future.delayed(Duration(milliseconds: 400), () {
        isShowTyres = true;
        notifyListeners();
      });
    } else {
      isShowTyres = false;
      notifyListeners();
    }
  }

  bool isTyresStatus = false;
  void tyresStatusController(int index) {
    if (selectedButtom != 3 && index == 3) {
      isTyresStatus = !isTyresStatus;
      notifyListeners();
    } else {
      Future.delayed(Duration(milliseconds: 500), () {
        isTyresStatus = false;
        notifyListeners();
      });
    }
  }
}
