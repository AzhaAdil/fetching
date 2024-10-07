import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Photos.dart';

class  PhotoRepository {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  @override
  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((photo) => Photo.fromJson(photo)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
