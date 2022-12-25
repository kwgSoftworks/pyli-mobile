class StringHelper{
  StringHelper._();

  static String creditCardFormatter(String card){
    return '**** **** ${card.substring(8, 12)} ${card.substring(12, card.length)}';
  }

  static String getBalance(double amount) => '\$${amount.toStringAsFixed(2)}';
}