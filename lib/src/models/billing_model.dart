class BillingModel{
  final String title;
  final String desc;
  final double amount;
  final String date;

  BillingModel({
    required this.title,
    required this.date,
    required this.desc,
    required this.amount
});

  static final demo = <BillingModel>[
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Subscription', date: '12/12/2022', desc: 'Pro subscription plan for site “8558 Green Rd.”', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
    BillingModel(title: 'Invoice', date: '12/12/2022', desc: 'Auctor est in urna ante eros ornare.', amount: 123.00),
  ];
}