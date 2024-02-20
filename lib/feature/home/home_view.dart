import 'package:flutter/material.dart';
import 'package:web_to_app/feature/admin/admin_view.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/get_started_button.dart';
import 'package:web_to_app/product/widgets/home_app_text_button.dart';
import 'package:web_to_app/product/widgets/home_textfield_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController urlText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.pageNormalPadding,
          child: Column(
            children: [
              SizedBox(
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
                      onPressed: () {},
                    ),
                    HomeAppTextButton(
                      text: MyString.pricing,
                      onPressed: () {},
                    ),
                    HomeAppTextButton(
                      text: MyString.contactUs,
                      onPressed: () {},
                    ),
                    const GetStartedButton()
                  ],
                ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
