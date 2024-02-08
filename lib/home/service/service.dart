import 'dart:developer';
import 'dart:io';

final class Service {
  Service._();
  static HttpClient client = HttpClient();

  static Future<HttpClientResponse> fetchService() async {
    final url = Uri.parse(
        'https://my-json-server.typicode.com/ozcanzaferayan/pokedex/pokemons');
    try {
      final request = await client.getUrl(url);
      request.headers.add('Content-Type', 'application/json');
      return await request.close();
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }
}
