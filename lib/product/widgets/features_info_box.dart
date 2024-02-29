import 'package:flutter/material.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';

class FeaturesInfoBox extends StatelessWidget {
  const FeaturesInfoBox({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.image,
     this.height,
    this.width,
  });
  final String textOne;
  final String textTwo;
  final String image;
  final double? width  ;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: MyColor.featuresBorderColor),
                  borderRadius: const BorderRadius.all(Radius.circular(40))),
              child: Center(
                child: Image.network(
                  image,
                  width: width ?? 30,
                  height: height ?? 30,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textOne,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Padding(
                  padding: AppPadding.topLowPadding,
                  child: Text(
                    textTwo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
