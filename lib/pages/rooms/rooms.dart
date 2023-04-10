import 'package:flutter/material.dart';

import '../../config/colors.dart';

class Rooms extends StatefulWidget {
  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  String text = '';
  String newText = '';
  TextEditingController textController = TextEditingController();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: RangerColors.blueBtn),
                  borderRadius: BorderRadius.circular(10),
                  color: RangerColors.white),
              child: TextField(
                controller: textController,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: 'Enter The Text',
                  hintText: 'Enter The Text',
                ),
                onSubmitted: (value) {
                  setState(() {
                    countLetters(value);
                    isClicked = true;
                    text = newText;

                    newText = '';
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                isClicked ? text : '',
                style: const TextStyle(color: RangerColors.blueBtn),
              ),
            )
          ],
        ),
      ),

    );
  }

  String countLetters(String word) {
    int count = 1;
    String? letter;

    word = word.split(' ').join();

    for (var i = 0; i < word.length - 1; i++) {
      if (word[i] == word[i + 1]) {
        count += 1;
        letter = word[i];
      } else {
        String prefix = '';

        if (count != 1) prefix = '$count';

        newText += '$prefix$letter';

        letter = word[i + 1];
        count = 1;
      }
    }

    newText += '$count$letter'; // aaabbjjabcccjjjjajcbbb
    return newText; // aaajjjdjcjjcjjjjjjjcccjjjj
  }
}
