import 'package:flutter/material.dart';
import 'package:new_wey/controller/provider_file.dart';
import 'package:new_wey/controller/provider_file2.dart';
import 'package:new_wey/view/screens/survey_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderFile()),
           ChangeNotifierProvider(create: (context) => ProvederFile2()),
      ],
       child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: SurveyPage(),
         ),
     );
  }
}
