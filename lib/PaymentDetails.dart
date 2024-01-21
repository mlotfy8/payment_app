import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_app/thankYouView.dart';
import 'Utilize/style.dart';
import 'Widgets/AnimatedContainer.dart';
import 'home.dart';
import 'package:svg_flutter/svg.dart';
import 'package:get/get.dart';

class PaymentDetailesView extends StatelessWidget {
  PaymentDetailesView({super.key});

  GlobalKey<FormState> fornkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(child: SvgPicture.asset('assetes/Arrow 1.svg')),
        centerTitle: true,
        title: Text('Payment Details',
            textAlign: TextAlign.center, style: Styles.style25),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: AnimateContainer()),
            SliverToBoxAdapter(
              child: CustomeCredit(
                  autovalidateMode: autovalidateMode, formKey: fornkey),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    title: 'Pay',
                    onpress: () {
                      if (fornkey.currentState!.validate()) {
                        fornkey.currentState!.save();
                      } else {
                        Get.to(() => ThankYou());
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CustomeCredit extends StatefulWidget {
  CustomeCredit(
      {super.key, required this.autovalidateMode, required this.formKey});

  final AutovalidateMode autovalidateMode;
  final GlobalKey<FormState> formKey;

  @override
  State<CustomeCredit> createState() => _CustomeCreditState();
}

class _CustomeCreditState extends State<CustomeCredit> {
  @override
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;

  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (value) {},
            isHolderNameVisible: true),
        CreditCardForm(
            autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (CreditCardModel) {
              cardNumber = CreditCardModel.cardNumber;
              expiryDate = CreditCardModel.expiryDate;
              cardHolderName = CreditCardModel.cardHolderName;
              cvvCode = CreditCardModel.cvvCode;
              showBackView = CreditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: widget.formKey),
        //Align(alignment: Alignment.bottomCenter,child: Button(onpress: ,title:'Pay'))
      ],
    );
  }
}
