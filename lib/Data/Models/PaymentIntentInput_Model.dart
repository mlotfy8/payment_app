class PaymentIntentInput_Model {
  final String amount;
  final String currency;

  PaymentIntentInput_Model(this.amount, this.currency);

  toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
