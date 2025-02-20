import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class ViewImageScreen extends StatelessWidget {
  const ViewImageScreen({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Image.asset(ImagePath.noImage),
        ),
      );
    } else if (imageUrl!.isEmpty) {
      return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Image.asset(ImagePath.noImage),
        ),
      );
    } else {
      return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Image.network(imageUrl ?? ""),
        ),
      );
    }
  }
}
