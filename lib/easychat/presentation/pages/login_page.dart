import 'package:chatapp/easychat/presentation/pages/home_page.dart';
import 'package:chatapp/easychat/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_pellete.dart';
import '../../providerfile/auth_provider.dart';
import '../widgets/auth_field.dart';
import '../widgets/submit_button.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}


class _Login_pageState extends State<Login_page> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: 
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "SignIn",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
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
                    buttonname: "Login",
                    onpressed: () async{
                      try{
                        await authProvider.signin(

                          _emailController.text,_passController.text);
                          Fluttertoast.showToast(msg:"Login success");
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder:(context)=>Home_page() ));
                        

                      }
                        catch(e){
                      print(e);

                     }
                      }
                    
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Doesn't have an account? ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                          TextSpan(
                              text: "Sign Up",
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