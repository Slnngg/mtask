import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/search_text_field.dart';
import 'package:mtest_app/pages/send/controller/send_controller.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class SendPage extends GetView<SendController> {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SupportColors.backgroundColor,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title and description section
                    _titleDesc(),
                    verSpace(18),

                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: Dimensions.borderRadius12,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Search section
                          _searchField(),
                          verSpace(12),

                          /// Most recent section
                          _mostRecent(),
                          verSpace(12),

                          /// Most recent transction list
                          _list(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Scan qpay button
            _button(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: SupportColors.backgroundColor,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 16,
        ),
      ),
    );
  }

  Widget _titleDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Recipient',
          style: TextStyles.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verSpace(4),
        Text(
          'Please select your recipient to send money.',
          style: TextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _searchField() {
    return SearchTextField(
      hintText: 'Search "Recipient Email"',
      isSend: true,
      onChanged: (value) {},
    );
  }

  Widget _mostRecent() {
    return Text(
      'Most Recent',
      style: TextStyles.bodyLarge.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _list() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: 5,
      itemBuilder: (context, index) {
        return _transactionList(
          'Lee Min Ho',
          'hellominho@gmail.com',
          '-\$100',
          'assets/images/leeminho.jpg',
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
          ),
          child: Container(
            height: 0.5,
            color: SupportColors.lightGrey,
          ),
        );
      },
    );
  }

  Widget _transactionList(
    String title,
    String desc,
    String value,
    String imgPath,
  ) {
    return InkWell(
      onTap: () {
        controller.selectReceiver(title, desc, imgPath);

        Get.toNamed(RouteNames.selectPurpose);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  imgPath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            horSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: SupportColors.blue,
              shape: BoxShape.circle,
            ),
            height: 58,
            width: 58,
            child: const Icon(
              Icons.qr_code_scanner_sharp,
              color: Colors.white,
            ),
          ),
        ),
        verSpace(6),
        Text(
          'Scan Pay',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
