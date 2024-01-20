import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:get/get.dart';

import 'PaymentDetails.dart';
import 'Utilize/style.dart';
import 'Widgets/OrderInfo.dart';

class myCardView extends StatelessWidget {
  const myCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(child: SvgPicture.asset('assetes/Arrow 1.svg')),
        centerTitle: true,
        title:
            Text('My Cart', textAlign: TextAlign.center, style: Styles.style25),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Expanded(child: Image.asset('assetes/Group 6.png')),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 63,
              child: OrderInfo(),
            ),
            Divider(
              height: 32,
              endIndent: 35,
              indent: 35,
              thickness: 2,
              color: Color(0xFFC6C6C6),
            ),
            Row(
              children: [
                Text(
                  'Total',
                  style: Styles.style25,
                ),
                Spacer(),
                Text(
                  '\$50.97',
                  style: Styles.style25,
                )
              ],
            ),
            Button(onpress: () => Get.to(()=>PaymentDetailesView()),title:'Complete Payment')
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
   Button({
    super.key, this.onpress, required this.title,
  });
   final void  Function()? onpress;
   final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
   onTap: onpress,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 21),
        width: 350,
        height: 73,
        decoration: ShapeDecoration(
          color: Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text('$title',
              textAlign: TextAlign.center, style: Styles.style22),
        ),
      ),
    );
  }
}
