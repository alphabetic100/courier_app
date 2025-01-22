import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentPage = 0.obs;
  RxInt notifications = 1.obs;

  changePage(int page) {
    pageController.jumpToPage(page);
  }

  final List<String> labels = const [
    'Buscar',
    'Publicar',
    'Mis viajes',
    'Mensajes',
    "Perfil"
  ];

  final List<Image> activeIcons = [
    Image.asset(IconPath.searchIcon,
        height: getHeight(35), width: getWidth(35), fit: BoxFit.cover),
    Image.asset(IconPath.addIcon,
        height: getHeight(35), width: getWidth(35), fit: BoxFit.cover),
    Image.asset(IconPath.sendIcon,
        height: getHeight(35), width: getWidth(35), fit: BoxFit.cover),
    Image.asset(IconPath.messageIcon,
        height: getHeight(35), width: getWidth(35), fit: BoxFit.cover),
    Image.asset(IconPath.profileIcon,
        height: getHeight(35), width: getWidth(35), fit: BoxFit.cover),
  ];

  final List<Image> inActiveIcons = [
    Image.asset(IconPath.searchIcon,
        height: getHeight(30), width: getWidth(30), fit: BoxFit.cover),
    Image.asset(IconPath.addIcon,
        height: getHeight(30), width: getWidth(30), fit: BoxFit.cover),
    Image.asset(IconPath.sendIcon,
        height: getHeight(30), width: getWidth(30), fit: BoxFit.cover),
    Image.asset(IconPath.messageIcon,
        height: getHeight(30), width: getWidth(30), fit: BoxFit.cover),
    Image.asset(IconPath.profileIcon,
        height: getHeight(30), width: getWidth(30), fit: BoxFit.cover),
  ];

  @override
  void onInit() {
    super.onInit();
    currentPage.value = 0;
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
