// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';  //This imports the english words
import 'package:flutter/material.dart';     //Lets the scaffold function be used that is called below

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {       //Makes the app into a widget with this line describing the stateless widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {      //build, a method that describes how to display the widget in terms of lower level widgets
    final wordPairingVariable = WordPair.random();  //This line came from the package:english words library to make a random word
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(                       //A widget from the material library, provides a default app bar and holds widget tree
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        //body: const Center(                 //body consists of the Center widget, the center widget has a child widget called Text
        //  child: Text('Hello World'),       //Text prints based on Center as a subtree of Center to the application
        body: Center(                                     //Replaced the  body above with this, note that it is no longer const
          child: Text(wordPairingVariable.asPascalCase),  //Here we print the text using the variable declared above that is random
        ),
        ),
      ); //Note that the Matrial App has a semi colon afterwards
  }
}