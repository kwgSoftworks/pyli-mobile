class InvoiceModel{
  final String description;
  final String date;
  final double amount;
  
  InvoiceModel({
    required this.description,
    required this.date,
    required this.amount
});
  
  static final demo = <InvoiceModel>[
    InvoiceModel(description: '1Auctor est in urna ante eros ornare.', date: '15/08/2021', amount: 540.00),
    InvoiceModel(description: '2Auctor est in urna ante eros ornare.', date: '15/08/2021', amount: 540.00),
    InvoiceModel(description: '3Auctor est in urna ante eros ornare.', date: '15/08/2021', amount: 540.00),
    InvoiceModel(description: '4Auctor est in urna ante eros ornare.', date: '15/08/2021', amount: 540.00),
    InvoiceModel(description: '5Auctor est in urna ante eros ornare.', date: '15/08/2021', amount: 540.00),
  ];
}