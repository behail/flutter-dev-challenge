//Question: Reverse a string without using built-in functions.
//Solution:

import '../widgets.dart';

class AnswerForQ1 extends StatefulWidget {
  const AnswerForQ1({super.key});

  @override
  State<AnswerForQ1> createState() => _AnswerForQ1State();
}

class _AnswerForQ1State extends State<AnswerForQ1> {
  final TextEditingController _strController = TextEditingController();
  String _reversedString = '';

  void _handleStrReverse() {
    setState(() {
      _reversedString = reverseString(_strController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.indigo[50],
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _strController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText:
                          'Enter a string and press the button to reverse it',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _handleStrReverse,
                    child: const Text('Reverse'),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: 'Reversed String: ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: _reversedString,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
