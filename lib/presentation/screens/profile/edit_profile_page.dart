import 'package:flutter/material.dart';
import 'package:oua_flutter_eight/presentation/widgets/profile/profile_textfield_widget.dart';
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        // Burada gerekli boyutlar ve diğer stillendirmeleri yapabilirsiniz
                      ),
                      const SizedBox(width: 8.0), // Ok ile yazı arasında boşluk bırakmak için
                      const Text(
                        "Profil Ayarları",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade500,// Örneğin mavi renk kullanıldı, isteğinize göre değiştirebilirsiniz
                        ),
                      ),
                    ],
                  ),
                ),

                  const SizedBox(height: 30),
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
                   Text("Profil resmini değiştir",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                        color: Colors.orange.shade500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const ProfileTextField_widgets(title: "Ad",subtitle: "Leonardo"),
                  const SizedBox(height: 20),
                  const ProfileTextField_widgets(title: "Soyad",subtitle: "Aka"),
                  const SizedBox(height: 20),
                  const ProfileTextField_widgets(title: "Konum",subtitle: "Türkiye"),
                  const SizedBox(height: 190),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


