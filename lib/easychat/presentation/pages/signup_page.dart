

import 'package:chatapp/easychat/presentation/pages/home_page.dart';
import 'package:chatapp/easychat/presentation/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';



import '../../../core/theme/app_pellete.dart';

import '../widgets/auth_field.dart';
import '../widgets/submit_button.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  
  final _auth=FirebaseAuth.instance;
  final _firestore=FirebaseFirestore.instance;
  
 Future<void>_signup()async{
  try{
     UserCredential userCredential=await _auth.createUserWithEmailAndPassword(
      email: _emailController.text, password: _passController.text);
    // final imageUrl=await _uploadImage(_image!);
   await _firestore.collection('users').doc(userCredential.user!.uid).set({
    'uid':userCredential.user!.uid,
    'name':_nameController.text,
    'email':_emailController.text,
    // 'imageUrl':imageUrl
   

   });
   Fluttertoast.showToast(msg: "Sign up Success");
   Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context)=>Home_page()));

  }
  catch(e){
    print(e);
  }

 }
  @override
  Widget build(BuildContext context) {
        // final authProvider=Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: _pickImage,
                  //   child: Container(
                  //     height: 200,
                  //     width: 200,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       border: Border.all()


                  //     ),
                  //     child: Image==null? Center(
                  //       child: Icon(Icons.camera_alt_rounded,
                  //       size: 50,),
                  //     ) : ClipRRect(
                  //       borderRadius: BorderRadius.circular(100),
                  //       child: Image.file(
                  //         _image!,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     )
                        
                  
                  //       )
                  //     ),


                

                  

                  const Text(
                    "SignUp",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthField(
                    hinttext: "name",
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                    hinttext: "email",
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                    hinttext: "password",
                    controller: _passController,
                    isobscured: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SubmitButton(
                    buttonname: "Sign Up",
                    onpressed: _signup,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login_page()));
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Already have an account? ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                          TextSpan(
                              text: "Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppPallete.gradient2,
                                      fontWeight: FontWeight.bold))
                        ])),
                  )
                ],
              ),
            ),
          
        
      
    );
  }
}
