import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_place_holder/model.dart';

class PostViewModel {
  List<Post> posts = [];

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      posts = data.map((json) => Post.fromJson(json)).toList();
    }
  }
}
