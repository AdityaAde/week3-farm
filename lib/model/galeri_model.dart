import 'dart:convert';
import 'package:http/http.dart' as http;

class Galeri {
  Future<List> getGaleri() async {
    final response = await http
        .get(Uri.http('apifarm.000webhostapp.com', 'get_galeri.php'));
    return json.decode(response.body);
  }
}
