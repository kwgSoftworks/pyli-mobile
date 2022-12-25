import 'package:customerapp/src/resources/_resources.dart';

class DrawerItemModel{
  final String label;
  final String icon;

  DrawerItemModel({
    required this.label,
    required this.icon,
});

  static final drawerItems = <DrawerItemModel>[
    DrawerItemModel(
      label: 'Home',
      icon: CIcons.home
    ),
    DrawerItemModel(
      label: 'Files',
      icon: CIcons.file_icon
    ),
    DrawerItemModel(
      label: 'Invoice',
      icon: CIcons.group
    ),
    DrawerItemModel(
      label: 'Contract',
      icon: CIcons.transaction
    ),
    DrawerItemModel(
      label: 'Billing',
      icon: CIcons.credit_card
    ),
    DrawerItemModel(
      label: 'Account',
      icon: CIcons.person
    ),
    DrawerItemModel(
      label: 'FAQ',
      icon: CIcons.help
    ),
    DrawerItemModel(
      label: 'Support',
      icon: CIcons.customer_service
    )
  ];
}