import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/cart_product.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/circle_btn.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/cus_btn.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/row_info.dart';
import 'package:flutter2026/Assignment/A/check_out_screen.dart';
import 'package:flutter2026/constant/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
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

  Widget _buildBody() {
    return Column(children: [_buildCartList(), _buildSummary()]);
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

  Widget _buildCartList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CartProduct();
      },
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
      title: Text("Cart"),
      actionsPadding: EdgeInsets.only(right: 16),
      actions: [CircleBtn(icon: Icons.more_vert_outlined, onTap: () {})],
    );
  }
}
