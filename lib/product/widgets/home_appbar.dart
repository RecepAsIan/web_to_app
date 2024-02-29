import 'package:flutter/material.dart';
import 'package:web_to_app/feature/admin/admin_view.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/get_started_button.dart';
import 'package:web_to_app/product/widgets/home_app_text_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.featuresOnPressed,
    required this.pricingOnPressed,
  });
  final void Function() featuresOnPressed;
  final void Function() pricingOnPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          const Icon(
            Icons.web_asset_outlined,
            size: 50,
          ),
          const Expanded(
            child: Padding(
              padding: AppPadding.leftLowPadding,
              child: Text(MyString.webSiteName),
            ),
          ),
          HomeAppTextButton(
            text: 'Admin',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AdminView(),
                ),
              );
            },
          ),
          HomeAppTextButton(
            text: MyString.features,
            onPressed: featuresOnPressed,
          ),
          HomeAppTextButton(
            text: MyString.pricing,
            onPressed: pricingOnPressed,
          ),
          HomeAppTextButton(
            text: MyString.contactUs,
            onPressed: () {},
          ),
          const GetStartedButton()
        ],
      ),
    );
  }
}
