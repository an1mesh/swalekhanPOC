import 'dart:async';

import 'package:flutter/material.dart';

class ImgProvider with ChangeNotifier {
  bool status = false;
  final List<String> alphaList = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  void setStatus() async {
    status = true;
    notifyListeners();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        status = false;
        notifyListeners();
      },
    );
  }

  void correctDialog() {}
}
