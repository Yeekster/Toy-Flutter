// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';     //Lets the scaffold function be used that is called below

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {       //Makes the app into a widget with this line describing the stateless widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {      //build, a method that describes how to display the widget in terms of lower level widgets
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(                       //A widget from the material library, provides a default app bar and holds widget tree
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(                 //body consists of the Center widget, the center widget has a child widget called Text
          child: Text('Hello World'),       //Text prints based on Center as a subtree of Center to the application
        ),
      ),
    );
  }
}