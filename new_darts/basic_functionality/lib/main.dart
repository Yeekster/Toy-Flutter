// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//import 'dart:js';

import 'package:english_words/english_words.dart';  //This imports the english words
import 'package:flutter/material.dart';     //Lets the scaffold function be used that is called below

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {       //Makes the app into a widget with this line describing the stateless widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {      //build, a method that describes how to display the widget in terms of lower level widgets
    //Commented out the line below which was associated with the body that generated the random word pairs
    //final wordPairingVariable = WordPair.random();  //This line came from the package:english words library to make a random word
    return MaterialApp(
      //title: 'Welcome to Flutter',  //Not sure what the title is for in general since it can be removed and still run
      title: 'A name generator flutter application',
      home: Scaffold(                       //A widget from the material library, provides a default app bar and holds widget tree
        appBar: AppBar(
          title: const Text('Name Generator'),
        ),
        //body: const Center(                 //body consists of the Center widget, the center widget has a child widget called Text
        //  child: Text('Hello World'),       //Text prints based on Center as a subtree of Center to the application
        
        //body: Center(                                     //Replaced the  body above with this, note that it is no longer const
        //  child: Text(wordPairingVariable.asPascalCase),  //Here we print the text using the variable declared above that is random
        //),

        body: const Center(                   //Replaced the body above that generated words with the widget to generate random words
          child: RandomWordsWidget(),         //Calling the child widget which which will generate the random words instead
        ),
        ),
      ); //Note that the Matrial App has a semi colon afterwards
  }
}

//created this automatically more or less by writting the keyword stful and intellisense created the general outline of the stateful widget
class RandomWordsWidget extends StatefulWidget {
  const RandomWordsWidget({super.key});

  @override
  State<RandomWordsWidget> createState() => _RandomWordsWidgetState();
}
//This one was created as in conjunction with the above stateful widget automatically when stful was typed in
class _RandomWordsWidgetState extends State<RandomWordsWidget> {
  final _pairSuggestions = <WordPair>[];              //Created a list called pair suggestions to save word pairings
  final _biggerFont = const TextStyle(fontSize: 18);  //Added a bigger font variable to make the font size larger

  @override
  Widget build(BuildContext context) {
    //final wordPairVar = WordPair.random();  //added the wordPairVar variable to generate a random word pair
    return ListView.builder(                //note that ListView is a built in widget, I didn't choose this widgets name
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){            //the itemBuilder widget is called once per row
        if (i.isOdd){                       //if the item count i, is odd, then make a divider
          return const Divider(height: 2,); //this creates a divider with a default height of 1 without arguments, here it has a height of 2 pixels
        }
        final index = i ~/ 2;               //divide i by 2 and return the result to be saved into index, note 1/2 == 0 and 3/2 == 1
                                            // this results in 0, 1, 1, 2, 2, 3... this is used to calculate the amount of word pairs shown
        if (index >= _pairSuggestions.length){  //if the end of the list has been reached, i.e. word pair index > the current amount of suggestions listed
          _pairSuggestions.addAll(generateWordPairs().take(10));  //Then, generate 10 morea nd add them to the list
        }
        //return Text(_pairSuggestions[index].asPascalCase);  
        return ListTile(                    //A ListTile is a fixed height row that contains text as well as leading or trailing icons/widgets
          title: Text(                      //This is like the Text widget as above except enclosed in a tile
            _pairSuggestions[index].asPascalCase, //This makes sure that each pair is in pascal case
            style: _biggerFont,             //This indicates that the text should have the bigger font using the variable at the beginning of the state class
          ) //Optionally can have a comma here, the documentation example has one
        );  //Again, semicolon at the end of the returns
      }
    );
    
    //return Text(wordPairVar.asPascalCase);  //Then return the text widget of the word pair in pascal case
    //return Container();                   //Commented out the default return
  }
}



