// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hopegamings/login_directory/splash_page.dart';
import 'package:hopegamings/test.dart';
import 'package:hopegamings/widgets/ApplogoApi.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // if(kIsWeb){
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyAAwKUZg21Bz4zAHwdrtWA_p_COPP8JliA",
  //       appId: "1:470004766738:web:e94dbbf0bd742858ec20cb",
  //       messagingSenderId: "470004766738",
  //       projectId: "hope-gaming", ), );
  //
  // }else{
  //    await Firebase.initializeApp();

  // }
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
  fetchApplogo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hope Gamings',
          theme: ThemeData(
            primarySwatch: Colors.blue,

          ),

          home: child,
        );
      },
      child: splash(),
    );
  }
}

