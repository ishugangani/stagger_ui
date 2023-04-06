import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stagger_ui1/screen/home/provider/home_provider.dart';
import 'package:stagger_ui1/screen/home/view/home_view.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
        },
      ),
    )
  );
}