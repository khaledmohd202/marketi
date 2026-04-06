import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_app_bar.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_header.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_list_tile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            child: Column(
              children: [
                const ProductAppBar(title: 'Profile'),
                // SizedBox(height: 20.h),
                const ProfileHeader(),
                SizedBox(height: 30.h),
                const ProfileListTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
