import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/search_text_field.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class HomeNavPage extends StatelessWidget {
  HomeNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header section
              _header(),

              /// Body section
              _body(),
            ],
          ),

          /// Make transaction (Send, Request, Bank)
          _makeTransaction(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: SupportColors.blue,
      leading: InkWell(
        onTap: () {
          Get.off(RouteNames.registration);
        },
        child: Image.asset(
          'assets/images/trophy.png',
          color: Colors.white,
        ),
      ),
      title: SearchTextField(
        hintText: 'Search "Payments"',
        onChanged: (value) {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 24,
          ),
        )
      ],
    );
  }

  Widget _header() {
    return Expanded(
      flex: 1,
      child: Container(
        color: SupportColors.blue,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            verSpace(14),
            Text(
              '\$ 20,000',
              style: TextStyles.displayMedium.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            verSpace(2),
            Text(
              'Available balance',
              style: TextStyles.headlineSmall.copyWith(
                fontWeight: FontWeight.w400,
                color: SupportColors.lightGrey,
              ),
              textAlign: TextAlign.center,
            ),
            verSpace(12),
            Container(
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                color: SupportColors.blue,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: Dimensions.borderRadius50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/wallet.png',
                      color: Colors.white,
                    ),
                    horSpace(8),
                    const Text(
                      'Add Money',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      flex: 2,
      child: Container(
        color: SupportColors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transaction',
                        style: TextStyles.titleLarge,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                  verSpace(12),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: Dimensions.borderRadius12,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final tx = transactions[index];
                        return _transactionList(
                          tx['color'],
                          tx['iconImg'],
                          tx['title'],
                          tx['value'],
                          tx['valueColor'],
                          tx['iconColor'],
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionList(
    Color color,
    String iconImg,
    String title,
    String value,
    Color valueColor,
    Color iconColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Image.asset(
                iconImg,
                color: iconColor,
              ),
            ),
          ),
          horSpace(10),
          Text(
            title,
            style: TextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w400,
              color: valueColor,
            ),
          ),
          horSpace(12),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _makeTransaction(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const redBoxHeight = 80.0;

    return Positioned(
      top: screenHeight / 3.7 - redBoxHeight / 1.7,
      left: 16,
      right: 16,
      child: Container(
          height: redBoxHeight,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/send.png',
                    color: SupportColors.blue,
                  ),
                  verSpace(6),
                  Text(
                    'Send',
                    style: TextStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                height: 24,
                width: 0.5,
                color: SupportColors.lightGrey,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/send.png',
                    color: SupportColors.lighOrange,
                  ),
                  verSpace(6),
                  Text(
                    'Request',
                    style: TextStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                height: 24,
                width: 0.5,
                color: SupportColors.lightGrey,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/bank.png',
                    color: SupportColors.lighOrange,
                  ),
                  verSpace(6),
                  Text(
                    'Bank',
                    style: TextStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  final List<Map<String, dynamic>> transactions = [
    {
      'color': Colors.blue.withOpacity(0.2),
      'iconImg': 'assets/images/spending_wallet.png',
      'title': 'Spending',
      'value': '-\$500',
      'valueColor': Colors.red,
      'iconColor': Colors.blue,
    },
    {
      'color': Colors.green.withOpacity(0.2),
      'iconImg': 'assets/images/income.png',
      'title': 'Income',
      'value': '\$3000',
      'valueColor': Colors.green,
      'iconColor': Colors.green,
    },
    {
      'color': Colors.yellow.withOpacity(0.2),
      'iconImg': 'assets/images/bills.png',
      'title': 'Bills',
      'value': '-\$800',
      'valueColor': Colors.red,
      'iconColor': Colors.yellow,
    },
    {
      'color': Colors.orange.withOpacity(0.2),
      'iconImg': 'assets/images/savings.png',
      'title': 'Savings',
      'value': '\$1000',
      'valueColor': Colors.orange,
      'iconColor': Colors.orange,
    },
  ];
}
