import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  "Giriş Yap",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:26,
                  ),
                ),
                const SizedBox(height: 10),
                 Text("Devam etmek için lütfen giriş yapınız",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize:16,
                  ),
                ),
                const SizedBox(height: 50),

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
                    child:  const Padding(
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){},
                        child:  Text("Şifreni mi unuttun ?",
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
                          "Giriş Yap",
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
                    Text("Henüz bir hesabın yok mu?",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child:  Text("Kaydol", style: TextStyle(
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


