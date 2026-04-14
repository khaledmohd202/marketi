import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class ReceiptText extends StatelessWidget {
  const ReceiptText({
    required this.price,
    required this.text,
    super.key,
  });
  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        TextApp(
          text: text,
          theme: MarketiTextStyles.textStyle14,
        ),
        const Spacer(),
        TextApp(
          text: 'EGP ${price.toStringAsFixed(2)}',
          theme: MarketiTextStyles.textStyle14,
        ),
      ],
    );
  }
}
