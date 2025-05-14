import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/pages/auth/registration/account_info/add_email_page.dart';
import 'package:mtest_app/pages/auth/registration/account_info/address_page.dart';
import 'package:mtest_app/pages/auth/registration/account_info/country_page.dart';
import 'package:mtest_app/pages/auth/registration/account_info/personal_info_page.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  State<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          AddEmailPage(),
          AddressPage(),
          PersonalInfoPage(),
          CountryPage(),
        ],
      ),
    );
  }
}
