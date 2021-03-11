import 'dart:convert';
import 'package:http/http.dart' as http;

class Berita {
  Future<List> getBerita() async {
    final response = await http
        .get(Uri.http('apifarm.000webhostapp.com', 'get_berita.php'));
    return json.decode(response.body);
  }
}
