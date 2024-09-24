import 'package:app_flutter/features/main/presentation/screen/home_screen.dart';
import 'package:app_flutter/features/profile/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> titles = ["Trang chủ", "Cộng đồng", "Ưa thích", "Tài khoản"];
  ValueNotifier<int> indexSelect = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexSelect,
        builder: (BuildContext context, int value, Widget? child) {
          return NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: indexSelect.value,
            onDestinationSelected: (value) =>
                {indexSelect.value = value, setState(() {})},
            destinations: [
              NavigationDestination(
                  icon: const Icon(Iconsax.home), label: titles[0]),
              NavigationDestination(
                  icon: const Icon(Iconsax.shop), label: titles[1]),
              NavigationDestination(
                  icon: const Icon(Iconsax.heart), label: titles[2]),
              NavigationDestination(
                  icon: const Icon(Iconsax.user), label: titles[3]),
            ],
          );
        },
      ),
      body: IndexedStack(
        index: indexSelect.value,
        children: [
          const HomeScreen(),
          Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
          ),
          const ProfileScreen(),
        ],
      ),
    );
  }
}
