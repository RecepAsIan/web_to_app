import 'package:flutter/material.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';

class PaymentPriceTable extends StatelessWidget {
  const PaymentPriceTable({
    super.key,
    required this.textOne,
    required this.textThree,
    required this.onTap,
    required this.iconBool,
  });
  final String textOne;
  final String textThree;
  final Function() onTap;
  final bool iconBool;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: AppPadding.leftLowPadding,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.paymentButton,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: MyColor.paymentContainerBorder),
            ),
            height: 150,
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Icon(
                        iconBool
                            ? Icons.check_box_outline_blank_outlined
                            : Icons.check_box_outlined,
                        color: MyColor.paymentButtonText,
                      ),
                    ),
                  ),
                  Text(
                    textOne,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColor.paymentButtonText),
                  ),
                  const Text(
                    'Only one price',
                    style: TextStyle(
                        color: MyColor.paymentButtonText,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    textThree,
                    style: TextStyle(
                        color: MyColor.paymentButtonText, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
