import 'package:flutter/material.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_tile_item.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTileItem(
          icon: Icons.person_outline,
          title: 'Account Preferences',
          onTap: () {},
          isToggle: false,
        ),
        ProfileTileItem(
          icon: Icons.credit_card_outlined,
          title: 'Subscription & Payment',
          onTap: () {},
          isToggle: false,
        ),
        const ProfileTileItem(
          icon: Icons.notifications_outlined,
          title: 'App Notifications',
          isToggle: true,
        ),
        const ProfileTileItem(
          icon: Icons.dark_mode_outlined,
          title: 'Dark Mode',
          isToggle: true,
        ),
        ProfileTileItem(
          icon: Icons.star_outline,
          title: 'Rate Us',
          onTap: () {},
          isToggle: false,
        ),
        ProfileTileItem(
          icon: Icons.feedback_outlined,
          title: 'Provide Feedback',
          onTap: () {},
          isToggle: false,
        ),
        ProfileTileItem(
          icon: Icons.logout,
          title: 'Log Out',
          color: Colors.red,
          // onTap: () async {
          //   await AppLogout().logout();
          // },
          onTap: () {},
          isToggle: false,
        ),
      ],
    );
  }
}
