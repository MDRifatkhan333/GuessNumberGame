import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math';

class GuessNumber extends StatefulWidget {
  const GuessNumber({super.key});

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  TextEditingController _controller = TextEditingController();
  String _guessNumber = '';

  int randomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    return randomNumber;
  }

  void _checkGuessNumber() {
    int? textFieldValue = int.tryParse(_controller.text);
    int RandomNumber = randomNumber();
    print("Text Field Value $textFieldValue");
    print("Random Number $RandomNumber");

    setState(
      () {
        if (textFieldValue == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Please enter a number',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else if (textFieldValue == RandomNumber) {
          _guessNumber = 'You guessed right!';

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('You guessed right!'),
            ),
          );
        } else {
          _guessNumber = 'You guessed wrong!';
          print(_guessNumber);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You guessed wrong!'),
            ),
          );
        }
        _controller.clear();
        _guessNumber = '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Guess Number')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  hintText: 'Enter your guess Number',
                  labelText: 'Enter your guess',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _checkGuessNumber,
                child: const Text('Check Guess Number'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
