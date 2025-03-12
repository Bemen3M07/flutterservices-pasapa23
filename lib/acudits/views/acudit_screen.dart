// lib/views/joke_screen.dart
import 'package:flutter/material.dart';
import '../controllers/acudit_controlador.dart';
import '../models/acudit.dart';

class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  final JokeController _controller = JokeController();
  Joke? _currentJoke;
  bool _isLoading = false;

  void _getNewJoke() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Joke joke = await _controller.fetchJoke();
      setState(() {
        _currentJoke = joke;
      });
    } catch (e) {
      setState(() {
        _currentJoke = Joke(setup: "Error carregant l'acudit", punchline: "");
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getNewJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Acudit Aleatori")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _currentJoke != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentJoke!.setup,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          _currentJoke!.punchline,
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _getNewJoke,
                          child: Text("Un altre acudit!"),
                        ),
                      ],
                    ),
                  )
                : Text("No s'ha pogut carregar l'acudit"),
      ),
    );
  }
}