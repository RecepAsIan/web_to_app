import 'dart:html';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_to_app/feature/payment/payment_riverpod.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/payment_button.dart';
import 'package:web_to_app/product/widgets/paymnet_price_tablo.dart';
import 'package:web_to_app/product/widgets/text/home_text_high.dart';
import 'package:web_to_app/product/widgets/textfield/my_payment_textfield.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _paymentProvider =
    StateNotifierProvider<PaymentNotifier, PaymentView>((ref) {
  return PaymentNotifier();
});

class PaymentView extends ConsumerStatefulWidget {
  const PaymentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView> {
  late File _image;
  late String url;
  String appName = 'AppName';
  String _imageSrc = MyString.loginIcon;
  @override
  Widget build(BuildContext context) {
    bool imageLoading = _imageSrc == MyString.loginIcon;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          width: 1000,
          height: 600,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, bottom: 15, left: 15),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              //image will come here
                              child: Placeholder(),
                            ),
                          ),
                          Padding(
                            padding: AppPadding.leftNormalPadding,
                            child: HomeTextHigh(
                              text: 'Website to App',
                              fountSize: 40,
                              color: MyColor.paymentButton,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: //AppPadding.topPageNormalPadding +
                            AppPadding.textFieldHorizontalPadding,
                        child: MyPaymentTextField(
                            onChanged: (value) {},
                            controller:
                                ref.watch(_paymentProvider.notifier).url,
                            text: 'url'),
                      ),
                      Padding(
                        padding: AppPadding.textFieldPadding,
                        child: MyPaymentTextField(
                            onChanged: (value) {
                              setState(() {
                                appName = value;
                              });
                            },
                            controller:
                                ref.watch(_paymentProvider.notifier).appName,
                            text: 'AppName'),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: AppPadding.topLowPadding +
                                AppPadding.leftLowPadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: PaymentButton(
                                onPressed: () async {
                                  FileUploadInputElement uploadInput =
                                      FileUploadInputElement();
                                  uploadInput.click();

                                  uploadInput.onChange.listen((e) {
                                    final userFile = uploadInput.files!.first;
                                    final reader = FileReader();

                                    reader.onLoadEnd.listen((e) {
                                      setState(() {
                                        _imageSrc = reader.result as String;
                                        _image = userFile;
                                      });
                                    });

                                    reader.readAsDataUrl(userFile);
                                  });
                                },
                                text: 'add image',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: AppPadding.topLowPadding,
                        child: Row(
                          children: [
                            PaymentPriceTable(
                                iconBool:
                                    ref.read(_paymentProvider.notifier).android,
                                onTap: () {
                                  setState(() {
                                    ref
                                        .read(_paymentProvider.notifier)
                                        .androidButton();
                                  });
                                },
                                textOne: 'Android ',
                                textThree: MyString.androidPrice),
                            PaymentPriceTable(
                              iconBool: ref
                                  .watch(_paymentProvider.notifier)
                                  .androidAndIphone,
                              onTap: () {
                                setState(() {
                                  ref
                                      .read(_paymentProvider.notifier)
                                      .androidAndIphoneButton();
                                });
                              },
                              textOne: 'Android\n&Iphone',
                              textThree: MyString.androidAndIosPrice,
                            ),
                            PaymentPriceTable(
                                iconBool:
                                    ref.watch(_paymentProvider.notifier).iphone,
                                onTap: () {
                                  setState(() {
                                    ref
                                        .read(_paymentProvider.notifier)
                                        .iphoneButton();
                                  });
                                },
                                textOne: 'Iphone',
                                textThree: MyString.iphonePrice),
                          ],
                        ),
                      ),
                      Padding(
                        padding: AppPadding.topLowPadding +
                            AppPadding.leftLowPadding,
                        child: PaymentButton(
                          onPressed: () async {
                            final filePath = 'my_path/${DateTime.now()}.png';
                            final storageRef =
                                FirebaseStorage.instance.ref(filePath);
                            final uploadTask = storageRef.putBlob(_image);

                            await uploadTask.whenComplete(() async {
                              url = await storageRef.getDownloadURL();
                            });
                          },
                          text: 'Buy',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Center(
                    child: SizedBox(
                      width: 250,
                      height: 500,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: AppPadding.leftLowPadding,
                            child: Image.network(
                              MyString.paymentPhone,
                              width: 250,
                              height: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: imageLoading
                                ? SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Image.network(
                                    _imageSrc,
                                    fit: BoxFit.fill,
                                    width: 150,
                                    height: 150,
                                  ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 80),
                              child: Text(
                                appName.isEmpty ? 'AppName' : appName,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
