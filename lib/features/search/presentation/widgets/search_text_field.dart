import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SearchPopularSection extends StatelessWidget {
  const SearchPopularSection({super.key});

  static const List<String> _popularSearches = [
    'Pampers',
    'Toothpaste',
    'iPhone',
    'pants',
    'Laptop',
    'Fried Chicken',
    'Sugar',
    'Smart TV',
    'Xbox',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextApp(
              text: 'Popular Search',
              theme: MarketiTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: _popularSearches
              .map((item) => SearchChip(label: item))
              .toList(),
        ),
      ],
    );
  }
}

class SearchChip extends StatelessWidget {
  const SearchChip({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextApp(
        text: label,
        theme: MarketiTextStyles.textStyle12.copyWith(
          color: MarketiColors.lightBlue900Color,
        ),
      ),
    );
  }
}

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    required this.label,
    required this.onDelete,
    super.key,
  });
  final String label;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: label,
          theme: MarketiTextStyles.textStyle14,
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.close, size: 18),
        ),
      ],
    );
  }
}
