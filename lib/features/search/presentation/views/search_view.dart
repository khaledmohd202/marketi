import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/widgets/home_search_bar.dart';
import 'package:marketi/features/search/presentation/widgets/search_app_bar.dart';
import 'package:marketi/features/search/presentation/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchAppBar(),
                // SizedBox(height: 16.h),
                HomeSearchBar(controller: _controller, onPressedFilter: () {}),
                SizedBox(height: 16.h),
                const SearchPopularSection(),
                SizedBox(height: 40.h),
                TextApp(
                  text: 'Search History',
                  theme: MarketiTextStyles.textStyle18,
                ),
                SearchHistoryItem(
                  label: 'Iphone',
                  onDelete: () {},
                ),
                SearchHistoryItem(
                  label: 'Pampers',
                  onDelete: () {},
                ),
                SearchHistoryItem(
                  label: 'Air pods',
                  onDelete: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
