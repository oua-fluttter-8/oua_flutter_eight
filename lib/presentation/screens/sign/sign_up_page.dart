import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SafeArea(
        child:  Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // hello again!
                const Text(
                  "Hemen Kaydol",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:26,
                  ),
                ),
                const SizedBox(height: 10),
                Text("Kaydolmak için lütfen kutucukları doldurunuz",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize:16,
                  ),
                ),
                const SizedBox(height: 50),
                //username textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Açık gri gölge
                          spreadRadius: 2,
                          blurRadius: 9,
                          offset: Offset(0, 3), // Gölgenin yönü ve uzaklığı
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ad Soyad",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Açık gri gölge
                          spreadRadius: 2,
                          blurRadius: 9,
                          offset: Offset(0, 3), // Gölgenin yönü ve uzaklığı
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                ),

                // password textfield
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Açık gri gölge
                          spreadRadius: 2,
                          blurRadius: 9,
                          offset: Offset(0, 3), // Gölgenin yönü ve uzaklığı
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(FontAwesomeIcons.eyeSlash, size: 20.0,),
                          border: InputBorder.none,
                          hintText: "Şifre",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                // forget password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: (){},
                        child:  Text("Şifre en az 8 karakter olmalıdır",
                          style: TextStyle(
                            fontSize:14,
                            color: Colors.orange.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // LOGIN  button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    child: ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 20,
                        backgroundColor: Colors.blue.shade300,
                        shadowColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),

                      ),
                      child: const Center(
                        child: Text(
                          "Kaydol",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),),
                  ),
                ),

                const SizedBox(height: 25),
                // not a member? register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    Text("Hesabın zaten var mı",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child:  Text("Giriş yap", style: TextStyle(
                        color: Colors.orange.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


