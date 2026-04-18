import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/common/dialogs/custom_dialog.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';
import 'package:marketi/core/theme/cubit/theme_cubit.dart';
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
        BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDark) {
            return ProfileTileItem(
              icon: Icons.dark_mode_outlined,
              title: 'Dark Mode',
              isToggle: true,
              toggleValue: isDark,
              onToggleChanged: (_) => context.read<ThemeCubit>().toggle(),
            );
          },
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
          onTap: () {
            CustomDialog.twoButtonDialog(
              context: context,
              textBody: 'Are you sure to logout!!, We will miss you.',
              textButton1: 'Yes',
              textButton2: 'No',
              onPressed: () async {
                context.pop();

                final navigator = Navigator.of(context);

                await CacheHelper().removeData(key: ApiKey.token);

                await navigator.pushNamedAndRemoveUntil(
                  AppRoutes.signIn,
                  (route) => false,
                );
              },
              isLoading: false,
            );
          },
          // onTap: () {},
          isToggle: false,
        ),
      ],
    );
  }
}
