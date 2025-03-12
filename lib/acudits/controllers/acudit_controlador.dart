// lib/controllers/acudit_controlador.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/acudit.dart';

class JokeController {
  static const String apiUrl = "https://api.sampleapis.com/jokes/goodJokes";

  Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jokes = jsonDecode(response.body);
      if (jokes.isNotEmpty) {
        final randomJoke = jokes[0]; // Pots canviar això per un acudit aleatori
        return Joke.fromJson(randomJoke);
      }
    }
    throw Exception("No s'ha pogut carregar l'acudit");
  }
}