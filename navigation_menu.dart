import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_stores/feautures/shop/screens/home/widgets/home.dart';
import 'package:r_stores/feautures/shop/screens/home/widgets/shop.dart';
import 'package:r_stores/utils/constants/colors.dart';
import 'package:r_stores/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final controller=Get.put(NavigationController());
    final darkMode=RHelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(

          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=>controller.selectedIndex.value=index,
          backgroundColor: darkMode?RColors.black: RColors.white,
          indicatorColor: darkMode?RColors.white.withOpacity(0.1):RColors.black.withOpacity(0.1),
          
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Shop"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "WishList"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "User"),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex=0.obs;

  final screens=[
    const HomeScreen(),
    const ShopScreen(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.red,
    ),
  ];
}
