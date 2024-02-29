import 'package:flutter/material.dart';
import 'package:web_to_app/feature/auth/auth_view.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/text/home_price_text.dart';

class HomePriceInfoContainer extends StatelessWidget {
  const HomePriceInfoContainer({
    super.key,
    this.containerColor,
    required this.model,
    this.modelColor,
    required this.modelFileDescription,
    this.modelFileDescriptionColor,
    required this.price,
    this.priceColor,
    required this.store,
    this.storeColor,
    this.color1,
    required this.buyNowButtonColor,
    required this.buyNowButtonTextColor,
  });
  final Color? containerColor;
  final String price;
  final Color? priceColor;
  final String model;
  final Color? modelColor;
  final String modelFileDescription;
  final Color? modelFileDescriptionColor;
  final String store;
  final Color? storeColor;
  final Color? color1;
  final Color buyNowButtonColor;
  final Color buyNowButtonTextColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppPadding.leftNormalPadding,
        child: Container(
          height: 800,
          decoration: BoxDecoration(
            color: containerColor ?? Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: MyColor.featuresBorderColor,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: AppPadding.topNormalPadding,
                child: HomePriceText(
                  text: model,
                  color: modelColor ?? Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HomePriceText(
                text: price,
                color: priceColor ?? Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              HomePriceText(
                text: MyString.oneTimePayment,
                fontSize: 24,
                color: color1 ?? MyColor.pricesText2,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: AppPadding.topLowPadding + AppPadding.botLowPadding,
                child: const Divider(color: MyColor.featuresBorderColor),
              ),
              Padding(
                padding: AppPadding.priceTopLowPadding,
                child: HomePriceText(
                  text: modelFileDescription,
                  color: modelFileDescriptionColor ?? Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HomePriceText(
                text: store,
                color: storeColor ?? Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: AppPadding.priceTopLowPadding,
                child: HomePriceText(
                  text: MyString.androidAndIos2,
                  color: color1 ?? MyColor.pricesText2,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: AppPadding.priceTopLowPadding,
                child: HomePriceText(
                  text: MyString.androidAndIos3,
                  color: color1 ?? MyColor.pricesText2,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: AppPadding.priceTopLowPadding,
                child: HomePriceText(
                  text: MyString.androidAndIos4,
                  color: color1 ?? MyColor.pricesText2,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: AppPadding.priceTopLowPadding,
                child: HomePriceText(
                  text: MyString.androidAndIos5,
                  color: color1 ?? MyColor.pricesText2,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: AppPadding.priceTopLowPadding,
                child: HomePriceText(
                  text: MyString.androidAndIos6,
                  color: color1 ?? MyColor.pricesText2,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: AppPadding.priceTopLowPadding,
                child: HomePriceText(
                  text: MyString.androidAndIos7,
                  color: color1 ?? MyColor.pricesText2,
                  fontSize: 18,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Divider(
                  color: MyColor.featuresBorderColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(buyNowButtonColor)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Text(MyString.buyNow,
                        style: TextStyle(
                          color: buyNowButtonTextColor,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
