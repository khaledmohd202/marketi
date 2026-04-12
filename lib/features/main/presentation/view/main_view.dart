import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/features/cart/presentation/view/cart_view.dart';
import 'package:marketi/features/favorites/presentation/view/favorites_view.dart';
import 'package:marketi/features/home/presentation/view/home_view.dart';
import 'package:marketi/features/main/presentation/widgets/bottom_nav_item.dart';
import 'package:marketi/features/profile/presentation/view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _screens = [
    const HomeView(),
    const CartView(),
    const FavoritesView(),
    // const MenuView(),
    const ProfileView(showAppBar: false),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: MarketiColors.greyColor.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Home Item
                BottomNavItem(
                  label: 'Home',
                  activeIcon: Icons.home,
                  icon: Icons.home_outlined,
                  currentIndex: _currentIndex,
                  index: 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),

                // Cart Item
                BottomNavItem(
                  label: 'Cart',
                  activeIcon: Icons.shopping_cart,
                  icon: Icons.shopping_cart_outlined,
                  currentIndex: _currentIndex,
                  index: 1,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),

                // Favorites Item
                BottomNavItem(
                  label: 'Favorites',
                  activeIcon: Icons.favorite,
                  icon: Icons.favorite_outlined,
                  currentIndex: _currentIndex,
                  index: 2,
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),

                // Menu Item
                BottomNavItem(
                  label: 'Menu',
                  activeIcon: Icons.menu,
                  icon: Icons.menu_outlined,
                  currentIndex: _currentIndex,
                  index: 3,
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
