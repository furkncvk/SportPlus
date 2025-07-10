import 'package:flutter/material.dart';
import 'package:spor/themes.dart';
import 'pages/home.dart';

/*Bu kod, bir Flutter uygulamasının temel yapısını oluşturur. `main.dart` 
dosyasında yer alan `main` fonksiyonu, uygulamanın çalıştırılmasını sağlar ve 
`MyApp` widget'ını çalıştırarak uygulamayı başlatır.

`MyApp` widget'ı, uygulamanın kökü olarak işlev görür. `MaterialApp` 
widget'ını içerir ve uygulamanın genel tema özelliklerini belirler. Benim kodumda, 
uygulamanın genel teması `Poppins` font ailesini kullanacak şekilde ayarlanmıştır.

`MaterialApp` widget'ının `home` özelliği, uygulamanın ilk ekranını belirler. 
Benim uygulamamda, `HomePage` widget'ı ilk ekran olarak belirlenmiştir. 
`HomePage` widget'ı, uygulamanın ana ekranını oluşturan bir widget'tır.

Sonuç olarak, bu kod bir Flutter uygulamasının temel yapı taşlarını oluşturur 
ve uygulamanın başlatılmasını, genel tema ayarlarının yapılmasını ve ana ekranın 
belirlenmesini sağlar. */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(fontFamily: 'Poppins'),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme, 
      themeMode: ThemeMode.dark ,
    
      home: HomePage()
    );
  }
}


