class PastChargeModel{
  final String title;
  final String invoiceNumber;
  final String amount;
  final String status;

  PastChargeModel({
   required this.title,
   required this.invoiceNumber,
   required this.amount,
   required this.status
});

  static final demo = <PastChargeModel>[
    PastChargeModel(title: 'title', invoiceNumber: 'invoiceNumber', amount: 'amount', status: 'status'),
    PastChargeModel(title: 'title', invoiceNumber: 'invoiceNumber', amount: 'amount', status: 'status'),
    PastChargeModel(title: 'title', invoiceNumber: 'invoiceNumber', amount: 'amount', status: 'status'),
    PastChargeModel(title: 'title', invoiceNumber: 'invoiceNumber', amount: 'amount', status: 'status'),
    PastChargeModel(title: 'title', invoiceNumber: 'invoiceNumber', amount: 'amount', status: 'status'),
    PastChargeModel(title: 'title', invoiceNumber: 'invoiceNumber', amount: 'amount', status: 'status'),
  ];
}