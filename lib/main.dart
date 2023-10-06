import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Views/Screens/homepage.dart';
import 'Views/Screens/imgDetail.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => HomePage(),
        'imgDetail': (context) => ImgDetail(),
      },
    ),
  );
}
