import 'package:chatapp/easychat/presentation/pages/home_page.dart';
import 'package:chatapp/easychat/presentation/pages/login_page.dart';
import 'package:chatapp/easychat/providerfile/auth_provider.dart';
import 'package:chatapp/easychat/providerfile/chat_provider.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthProvider()),
      ChangeNotifierProvider(create: (_)=>ChatProvider()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: AuthenticationWrapper(),
    ),
    
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context,authProvider,child){
      if(authProvider.isSignedIn){
        return Home_page();
      }
      else{
        return Login_page();
      }

    });
  }
}