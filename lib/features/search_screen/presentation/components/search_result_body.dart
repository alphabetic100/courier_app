import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/features/search_screen/presentation/components/search_result_card.dart';
import 'package:flutter/material.dart';

class SearchResultBody extends StatelessWidget {
  const SearchResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SearchResultCard(),
              );
            }),
      ),
    );
  }
}
