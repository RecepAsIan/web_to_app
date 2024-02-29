import 'package:flutter/cupertino.dart';
import 'package:web_to_app/product/constants/%C4%B1cons_constants.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/features_info_box.dart';
import 'package:web_to_app/product/widgets/text/home_text_normal.dart';

class HomeFeatures extends StatelessWidget {
  const HomeFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 70),
          child: HomeTextNormal(
            text: MyString.features,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              MyString.weHaveAmazing,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            Text(
              MyString.service,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: MyColor.paymentButton),
            )
          ],
        ),
        Padding(
          padding: AppPadding.topHighPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FeaturesInfoBox(
                image: MyIcon.pushNotifications,
                textOne: MyString.pushNotifications,
                textTwo: MyString.pushNotificationsDescription,
              ),
              FeaturesInfoBox(
                image: MyIcon.pullToRefresh,
                textOne: MyString.pullToRefresh,
                textTwo: MyString.pullToRefreshDescription,
              ),
              FeaturesInfoBox(
                image: MyIcon.downloadsAndUploads,
                textOne: MyString.downloadsAndUploads,
                textTwo: MyString.downloadsAndUploadsDescription,
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeaturesInfoBox(
              image: MyIcon.mediaPlayback,
              textOne: MyString.mediaPlayback,
              textTwo: MyString.mediaPlaybackDescription,
            ),
            FeaturesInfoBox(
              image: MyIcon.appLinking,
              textOne: MyString.appLinking,
              textTwo: MyString.appLinkingDescription,
            ),
            FeaturesInfoBox(
              image: MyIcon.support,
              textOne: MyString.support,
              textTwo: MyString.supportDescription,
              height: 40,
              width: 40,
            ),
          ],
        )
      ],
    );
  }
}
