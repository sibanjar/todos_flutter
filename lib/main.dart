import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todos/homepage.dart';
import 'package:todos/todo_app/provider_model/todo_model.dart';
import 'api_test_app/provider/post_provider.dart';


void main(){
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp( MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (BuildContext context)=>TodosProvider()),
    ChangeNotifierProvider(create: (BuildContext context)=>PostProvider()),
    ],
            child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    // Use builder only if you need to use library outside ScreenUtilInit context
    builder: (_ , child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
        )
      ),
        darkTheme: ThemeData(),
        home: const HOME());
  },
    );
       }
}