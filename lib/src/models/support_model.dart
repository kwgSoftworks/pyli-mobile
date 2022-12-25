class SupportModel{
  final String image;
  final String name;
  final String email;
  final String phone;
  final String address;
  SupportModel({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.address
});

  static final demo = <SupportModel>[
    SupportModel(image: 'https://www.pngitem.com/pimgs/m/545-5452266_indian-company-logo-png-png-download-indian-companies.png', name: 'Support Tech LTD', email: 'supp@gmail.com', phone: '(573) 636-6878-111', address: '3125 Moreau View DrJefferson City, Missouri(MO), 65101'),
    SupportModel(image: 'https://seekvectorlogo.com/wp-content/uploads/2020/06/empire-company-limited-vector-logo.png', name: 'Empire Company LTD', email: 'empcom@gmail.com', phone: '(123) 456-123-998', address: '526 Austin StCarthage, Texas(TX), 75633'),
  ];
}