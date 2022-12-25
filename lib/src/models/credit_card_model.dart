class CreditCardModel{
  final String name;
  final String number;
  final String validity;

  CreditCardModel({
    required this.name,
    required this.number,
    required this.validity
});

  static final demo = <CreditCardModel>[
    CreditCardModel(name: 'Joshua Okwe', number: '1112334456789876', validity: '12/26'),
    CreditCardModel(name: 'Joshua Okwe', number: '6677554432147865', validity: '05/28'),
  ];
}