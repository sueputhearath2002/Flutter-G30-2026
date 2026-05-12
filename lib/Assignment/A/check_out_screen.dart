import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/circle_btn.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/cus_btn.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/row_info.dart';
import 'package:flutter2026/Assignment/A/model/payment_model.dart';
import 'package:flutter2026/constant/colors.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final List<PaymentModel> payments = [
    PaymentModel(
      code: "PAYPAL",
      imgLogo:
          'https://play-lh.googleusercontent.com/iQ8f5plIFy9rrY46Q2TNRwq_8nCvh9LZVwytqMBpOEcfnIU3vTkICQ6L1-RInWS93oQg',
      title: 'Paypal',
    ),
    PaymentModel(
      code: "CREDIT-CARD",
      imgLogo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL0JEg4NoKjbvShSG0FzXyQmNe4Eljkwc7FQ&s',
      title: 'Credit Card',
    ),
    PaymentModel(
      code: "CASH",
      imgLogo:
          'https://s2.coinmarketcap.com/static/img/coins/200x200/36632.png',
      title: 'Cash',
    ),
  ];

  String getPaymentType = "";

  void getPaymentTypeFun(String code) {
    setState(() {
      getPaymentType = code;
    });
    print("========code==${getPaymentType}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [_buildInfo(), _buildSummary(), _buildPayment()],
      ),
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: CusBtn(
            btnName: "Check Out",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOutScreen()),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPayment() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose payment method",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListView.builder(
            itemCount: payments.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              bool isSelectType = getPaymentType == payments[index].code;
              return ListTile(
                onTap: () => getPaymentTypeFun(payments[index].code),
                leading: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: payments[index].imgLogo,
                  height: 30,
                  width: 30,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                title: Text(
                  payments[index].title,
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
                trailing: Icon(
                  isSelectType ? Icons.check_circle : Icons.circle,
                  color: !isSelectType
                      ? ColorStyle.greyColor
                      : ColorStyle.mainColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorStyle.greyColor,
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          RowInfo(rightText: 'Item', leftText: '3'),
          RowInfo(rightText: 'SubTotal', leftText: '\$100'),
          RowInfo(rightText: 'Discount', leftText: '\$50'),
          RowInfo(rightText: 'Delivery fee', leftText: '\$0'),

          Divider(color: Colors.black45),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total ", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("\$200 ", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        ListTile(
          leading: CircleBtn(
            icon: Icons.location_on_rounded,
            iconColor: ColorStyle.mainColor,
          ),
          title: Text(
            "325 15th Eighth Avenue, NewYork",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Saepe eaque fugiat ea voluptatum veniam.",
            style: TextStyle(color: Colors.black45),
          ),
        ),
        ListTile(
          leading: CircleBtn(
            icon: Icons.timer,
            iconColor: ColorStyle.mainColor,
          ),
          title: Text(
            "6:00 pm, Wednesday 20",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return AppBar(
      leadingWidth: 65,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8),
        child: CircleBtn(
          icon: Icons.arrow_back,
          onTap: () => Navigator.pop(context),
        ),
      ),
      title: Text("Check Out"),
      actionsPadding: EdgeInsets.only(right: 16),
    );
  }
}
