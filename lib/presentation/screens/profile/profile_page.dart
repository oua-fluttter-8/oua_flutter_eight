import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.black,
                ),
                const SizedBox(height: 20),
                const Text("Leonardo",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Leonardo@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Açık gri gölge
                        spreadRadius: 2,
                        blurRadius: 9,
                        offset:
                        const Offset(0, 3), // Gölgenin yönü ve uzaklığı
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Ödül Puanları',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('360',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange.shade500,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Seyahatler',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('12',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange.shade500,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Listeler',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('10',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange.shade500,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                itemProfile("Profil Bilgilerim", CupertinoIcons.person),
                const SizedBox(height: 10),
                itemProfile("Listelerim", CupertinoIcons.bookmark),
                const SizedBox(height: 10),
                itemProfile("Seyehatlerim ", CupertinoIcons.map),
                const SizedBox(height: 10),
                itemProfile("Ayarlar", CupertinoIcons.gear),
                const SizedBox(height: 10),
                itemProfile("Yardım", CupertinoIcons.globe),
              ],

            ),
          ),
        ),
      ),
    );
  }


  itemProfile(String title, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), // Açık gri gölge
            spreadRadius: 2,
            blurRadius: 9,
            offset:
            const Offset(0, 3), // Gölgenin yönü ve uzaklığı
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(iconData),
        trailing: Icon(CupertinoIcons.arrow_right),
        tileColor: Colors.grey.shade50,
      ),
    );
  }

}