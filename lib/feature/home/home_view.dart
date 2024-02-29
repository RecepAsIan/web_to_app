import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_to_app/feature/payment/payment.dart';
import 'package:web_to_app/feature/payment/payment_riverpod.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/home_appbar.dart';
import 'package:web_to_app/product/widgets/home_features.dart';
import 'package:web_to_app/product/widgets/home_price_info_container.dart';
import 'package:web_to_app/product/widgets/text/home_text_high.dart';
import 'package:web_to_app/product/widgets/text/home_text_normal.dart';
import 'package:web_to_app/product/widgets/textfield/home_textfield_container.dart';

final _paymentProvider =
    StateNotifierProvider<PaymentNotifier, PaymentView>((ref) {
  return PaymentNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController urlText = TextEditingController();
  final GlobalKey featuresKey = GlobalKey();
  final GlobalKey priceKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  double _getOffsetFromKey(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    return offset.dy;
  }

  void featuresOnPressed() {
    double featuresOffset = _getOffsetFromKey(featuresKey);
    _scrollController.animateTo(featuresOffset,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void priceOnPressed() {
    double priceOffset = _getOffsetFromKey(priceKey);
    _scrollController.animateTo(priceOffset,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: AppPadding.pageNormalPadding,
          child: Column(
            children: [
              HomeAppBar(
                featuresOnPressed: () {
                  featuresOnPressed();
                },
                pricingOnPressed: () {
                  priceOnPressed();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                MyString.convertYourWebsite,
                                style: TextStyle(fontSize: 60),
                              ),
                              const Text(
                                MyString.homeYouCanConvert,
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: AppPadding.topLowPadding,
                                child: ContainerTextField(url: urlText),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Center(
                            child: SizedBox(
                              width: 300,
                              height: 300,
                              child: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/web-to-app-f77bb.appspot.com/o/AppIcon%2Fpngegg.png?alt=media&token=bc0278d0-b8dc-4dc9-b66e-a3a2b77b08a9r',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.topHighPadding,
                child: Container(
                  key: featuresKey,
                  width: double.infinity,
                  height: 800,
                  child: const Center(
                    child: HomeFeatures(),
                  ),
                ),
              ),
              Container(
                key: priceKey,
                width: double.infinity,
                height: 1200,
                child: Center(
                  child: Column(
                    children: [
                      const HomeTextNormal(text: MyString.pricing),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeTextHigh(text: MyString.reasonableFlexible),
                          HomeTextHigh(
                            text: MyString.plans,
                            color: MyColor.paymentButton,
                          ),
                        ],
                      ),
                      Padding(
                        padding: AppPadding.topHighPadding,
                        child: Row(
                          children: [
                            HomePriceInfoContainer(
                              buyNowButtonColor: MyColor.androidButton,
                              buyNowButtonTextColor:
                                  MyColor.androidOrIphoneButtonText,
                              model: MyString.android,
                              modelFileDescription: MyString.android1,
                              price: MyString.androidPrice,
                              store: MyString.store,
                            ),
                            HomePriceInfoContainer(
                              containerColor: MyColor.androidAndIphone,
                              model: MyString.androidAndIos,
                              price: MyString.androidAndIosPrice,
                              modelFileDescription: MyString.androidAndIos1,
                              store: MyString.androidAndIos8,
                              modelFileDescriptionColor: Colors.white,
                              priceColor: Colors.white,
                              modelColor: Colors.white,
                              storeColor: Colors.white,
                              color1: MyColor.pricesText,
                              buyNowButtonColor: MyColor.androidAndIphoneButton,
                              buyNowButtonTextColor:
                                  MyColor.androidAndIphoneButtonText,
                            ),
                            HomePriceInfoContainer(
                              buyNowButtonColor: MyColor.iphoneButton,
                              buyNowButtonTextColor:
                                  MyColor.androidOrIphoneButtonText,
                              model: MyString.iphone,
                              modelFileDescription: MyString.iphone1,
                              price: MyString.iphonePrice,
                              store: MyString.store,
                            ),
                          ],
                        ),
                      )
                    ],
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
