import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import 'Utilize/style.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 350,
              height: 672,
              decoration: ShapeDecoration(
                color: Color(0xFFEDEDED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              bottom: Get.height * .2,
              left: -20,
            ),
            Positioned(
                child: Text(
                  '----------------------------',
                  style: Styles.style25.copyWith(color: Color(0xFFB7B7B7)),
                ),
                bottom: Get.height * .21,
                left: 42),
            Positioned(
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              bottom: Get.height * .2,
              right: -20,
            ),
            Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 50,
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.check,color: Colors.white,
                      size: 40,
                    ),
                    backgroundColor: Color(0xff34A853),
                  ),
                  backgroundColor: Color(0xFFEDEDED),
                )),
            ThankContent(),
            Positioned(top: -34,child: SvgPicture.asset('assetes/Arrow 1.svg')),
          ],
        ),
      ),
    );
  }
}

class ThankContent extends StatelessWidget {
  const ThankContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50 + 16),
      child: Column(
        children: [
          Text('Thank you!',
              textAlign: TextAlign.center, style: Styles.style25),
          Text('Your transaction was successful',
              textAlign: TextAlign.center, style: Styles.style20),
          SizedBox(
            height: 42,
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
                itemCount: title.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        children: [
                          Text(
                            '${title[index]}',
                            style: Styles.style18,
                          ),
                          Spacer(),
                          Text(
                            '${value[index]}',
                            style: Styles.style18
                                .copyWith(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 16,right: 16),
            width: 305,
            height: 73,
            child: Row(
              children: [
                SizedBox(width: 23,),
                SvgPicture.asset('assetes/logo.svg',),SizedBox(width: 23,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Credit Card ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Mastercard **78 ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.699999988079071),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    )

              ],
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(FontAwesomeIcons.barcode,size: 50,),
                Container(
                  width: 113,
                  height: 58,child: Center(
                    child: Text(
                    'PAID',
                    textAlign: TextAlign.center,
                    style:Styles.style25.copyWith(color: Color(0xFF34A853))
                ),
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List title = ['Date', 'Time', 'To'];
List value = ['01/24/2023', '10:15 AM', 'Sam Louis'];
