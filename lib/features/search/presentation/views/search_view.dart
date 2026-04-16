import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/widgets/home_search_bar.dart';
import 'package:marketi/features/search/presentation/view_model/search_cubit.dart';
import 'package:marketi/features/search/presentation/widgets/search_app_bar.dart';
import 'package:marketi/features/search/presentation/widgets/search_grid_view.dart';
import 'package:marketi/features/search/presentation/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      context.read<SearchCubit>().search(searchQuery: _controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchAppBar(),
              // SizedBox(height: 16.h),
              HomeSearchBar(controller: _controller, onPressedFilter: () {}),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    // Initial State.
                    if (state is SearchInitial) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SearchPopularSection(),
                            SizedBox(height: 24.h),
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
                      );
                    }

                    // Loading State.
                    if (state is SearchLoading) {
                      return GridView.builder(
                        itemCount: 6,
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.w,
                          crossAxisSpacing: 10.h,
                          mainAxisExtent: 250.h,
                        ),
                        itemBuilder: (context, index) =>
                            LoadingShimmer(height: 250.h, width: 170.w),
                      );
                    }

                    // Empty State.
                    if (state is SearchEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 60.r,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10.h),
                            TextApp(
                              text: 'No results found',
                              theme: MarketiTextStyles.textStyle16.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // Failure State.
                    if (state is SearchFailure) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    // Success state.
                    if (state is SearchSuccess) {
                      final products = state.products.productsList;

                      return SearchGridView(products: products);
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
