import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/presentation/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: const CustomScrollView(
          slivers: [
            // Home Header
            SliverToBoxAdapter(
              child: HomeHeader(),
            ),

            // Search Bar
            // SliverToBoxAdapter(
            //   child: ,
            // ),
          ],
        ),
      ),
    );
  }
}
