import 'package:flutter/cupertino.dart';

import '../Utilize/style.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) => Row(
              children: [
                Text(
                  '${title[index]}',
                  style: Styles.style18,
                ),
                Spacer(),
                Text(
                  '\$${value[index]}',
                  style: Styles.style18,
                )
              ],
            ));
  }
}

List title = ['Order Subtotal', 'Discount', 'Shipping'];
List value = [42.97, 0, 8];
