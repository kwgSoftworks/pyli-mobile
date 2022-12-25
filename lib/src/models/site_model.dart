class SiteModel{
  final String title;
  final String subtitle;

  SiteModel({
    required this.title,
    required this.subtitle
});

  static final demo = <SiteModel>[
    SiteModel(title: 'Site 1', subtitle: '4140 Parker Rd. Allentown, New Mexico 31134'),
    SiteModel(title: 'Site 2', subtitle: '1901 Thornridge Cir. Shiloh, Hawaii 81063'),
    SiteModel(title: 'Site 3', subtitle: '2118 Thornridge Cir. Syracuse, 35624'),
    SiteModel(title: 'Site 4', subtitle: '1234 Abcs lade, SER, Siberia, 12344'),
  ];
}