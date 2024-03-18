import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<ListItem> listItems = [
    ListItem(
      leadingIcon: Icons.notifications_active_outlined,
      title: 'Bildirimler',
      trailingIcon: Icons.arrow_forward_ios,
    ),
    ListItem(
      leadingIcon: Icons.volume_up,
      title: 'Ses ve Görüntü',
      trailingIcon: Icons.arrow_forward_ios,
    ),
    ListItem(
      leadingIcon: Icons.language,
      title: 'Dil',
      trailingIcon: Icons.arrow_forward_ios,
    ),
    ListItem(
      leadingIcon: Icons.accessibility,
      title: 'Erişilebilirlik',
      trailingIcon: Icons.arrow_forward_ios,
    ),
    ListItem(
      leadingIcon: Icons.security,
      title: 'Gizlilik ve Güvenlik',
      trailingIcon: Icons.arrow_forward_ios,
    ),

    // ... diğer öğeler için kod ekleyin
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ayarlar"),
        ),
        body: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            final item = listItems[index];
            return Card(
              child: ListTile(
                leading: Icon(item.leadingIcon),
                title: Text(item.title),
                trailing: Icon(item.trailingIcon),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListItem {
  final IconData leadingIcon;
  final String title;
  final IconData trailingIcon;

  ListItem({
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
  });
}
