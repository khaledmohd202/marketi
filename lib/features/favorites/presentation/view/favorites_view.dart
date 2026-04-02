import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_header.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CartAndFavoriteHeader(
                title: 'My Favorites',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
