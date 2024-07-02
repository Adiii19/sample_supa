import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sample_supa/constants/image_strings.dart';
import 'package:sample_supa/login_form_widget.dart';
import 'package:sample_supa/profileScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final supabase=Supabase.instance.client;

    void _setupAuthlistener(){
      
       supabase.auth.onAuthStateChange.listen((data){
        final event=data.event;
        if(event==AuthChangeEvent.signedIn)
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
        }
       });

     }

     Future<AuthResponse>_googleSignIn()async{

      const webClientId='397778344920-3t2orbsr0abh424ie0l2f9o60438ieqj.apps.googleusercontent.com';

      const andoridClientId='397778344920-5qn8k08s3nclhmelc5e7bjvrmbutgcj9.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn=GoogleSignIn(
        clientId: andoridClientId,
        serverClientId: webClientId
      );

      final googleUser=await googleSignIn.signIn();
      final googleAuth=await googleUser!.authentication;
      final accesstoken=googleAuth.accessToken;
      final idtoken=googleAuth.idToken;

      if(accesstoken==null){
        throw 'No Access Token Found';
      }
      if(idtoken==null){
        throw 'No Id token found';
      }

      return supabase.auth.signInWithIdToken(provider: OAuthProvider.google, idToken: idtoken,
      accessToken: accesstoken
      );

     }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                      "assets/images/isa-vesit-color-logo.png"),
                  height: size.height * 0.2,
                ),
                SizedBox(height: 15,),
                Text("Welcome Back",
                    style: Theme.of(context).textTheme.headlineMedium),
                const LoginForm(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Image(
                          image: AssetImage(GoogleLogo),
                          width: 20,
                        ),
                        onPressed: () {
                          _googleSignIn();
                        },
                        label: const Text("Sign-In with Google"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Already have an account"))
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
