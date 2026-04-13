import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.activeIcon,
    required this.currentIndex,
    required this.icon,
    required this.index,
    required this.label,
    required this.onTap,
    super.key,
  });
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected
                  ? MarketiColors.lightBlue900Color
                  : MarketiColors.greyColor,
            ),
            TextApp(
              text: label,
              theme: MarketiTextStyles.textStyle12.copyWith(
                color: isSelected
                    ? MarketiColors.lightBlue900Color
                    : MarketiColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _buildNavItem({
//   required IconData icon,
//   required IconData activeIcon,
//   required String label,
//   required int index,
// }) {
//   final isSelected = _currentIndex == index;
//   return GestureDetector(
//     onTap: () {
//       setState(() {
//         _currentIndex = index;
//       });
//     },
//     child: ColoredBox(
//       color: Colors.transparent,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             isSelected ? activeIcon : icon,
//             color: isSelected
//                 ? MarketiColors.lightBlue900Color
//                 : MarketiColors.greyColor,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected
//                   ? MarketiColors.lightBlue900Color
//                   : MarketiColors.greyColor,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
