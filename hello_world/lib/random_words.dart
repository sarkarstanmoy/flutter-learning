import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords with ChangeNotifier {
  String word = '';
  getWords() {
    word = generateWordPairs().take(1).toList().first.toString();
    notifyListeners();
  }
}
