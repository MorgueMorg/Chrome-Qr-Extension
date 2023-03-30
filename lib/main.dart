import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _textController;
  late final FocusNode _textFocus;

  String qrText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'QR Text',
                labelStyle: const TextStyle(
                  color: Color(0xFF80919F),
                ),
                hintText: 'Enter text / URL',
                hintStyle: const TextStyle(
                  color: Color(0xFF80919F),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onChanged: (value) => setState(() {
                qrText = value;
                // prefs.setString('qrText', qrText);
              }),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: QrImage(
                data: qrText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
