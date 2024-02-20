import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_to_app/feature/payment/payment_riverpod.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/my_payment_textfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html';

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
  late String _imageSrc =
      'https://firebasestorage.googleapis.com/v0/b/web-to-app-f77bb.appspot.com/o/AppIcon%2Fpngegg.png?alt=media&token=bc0278d0-b8dc-4dc9-b66e-a3a2b77b08a9';
  late String _url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
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
                      Padding(
                        padding: AppPadding.textFieldPadding,
                        child: MyPaymentTextField(
                            controller:
                                ref.watch(_paymentProvider.notifier).url,
                            text: 'url'),
                      ),
                      Padding(
                        padding: AppPadding.textFieldPadding,
                        child: MyPaymentTextField(
                            controller:
                                ref.watch(_paymentProvider.notifier).appName,
                            text: 'AppName'),
                      ),
                      Padding(
                        padding: AppPadding.topLowPadding +
                            AppPadding.leftLowPadding,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
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
                            child: const Text('add image'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: AppPadding.topLowPadding,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: AppPadding.leftLowPadding,
                                child: SizedBox(
                                  height: 300,
                                  child: Text('android'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: AppPadding.leftLowPadding,
                                child: SizedBox(
                                  height: 300,
                                  child: Text('iphone'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: AppPadding.leftLowPadding,
                                child: SizedBox(
                                  height: 300,
                                  child: Text('android and iphone'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: AppPadding.topLowPadding +
                            AppPadding.leftLowPadding,
                        child: ElevatedButton(
                          onPressed: () async {
                            final filePath = 'my_path/${DateTime.now()}.png';
                            final storageRef =
                                FirebaseStorage.instance.ref(filePath);
                            final uploadTask = storageRef.putBlob(_image);

                            await uploadTask.whenComplete(() async {
                              _url = await storageRef.getDownloadURL();
                            });
                          },
                          child: const Text('Buy'),
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
                  child: Container(
                    width: 250,
                    height: 500,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            _imageSrc,
                            fit: BoxFit.fill,
                            width: 250,
                            height: 500,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: AppPadding.topLowPadding,
                            child: Text(
                              'AppName',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
