import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/home.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() {
 // Stripe.publishableKey
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      home:  myCardView(),
    );
  }
}
