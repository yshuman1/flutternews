import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import 'dart:async';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> FetchTopIds() async {
    final response = await client.get('$_root/topstories.json');
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> FetchItem(int id) async {
    final response = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
