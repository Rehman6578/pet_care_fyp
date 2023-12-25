
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapperController extends GetxController{
  late  PageController pageController;

  RxInt currentIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  void changePage(int index){
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }



}