import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/cart_product.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/circle_btn.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(context), body: _buildBody());
  }

  Widget _buildBody() {
    return Column(children: [_buildCartList()]);
  }

  Widget _buildCartList() {
    return Expanded(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CartProduct();
        },
      ),
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
