import 'package:http/http.dart';
import 'package:untitled2/models/model.dart';

class API {
 static String baseUrl = 'http://api.weatherapi.com/v1';

 static  String apiKey = '3677bed892474b30b7a122242220806';

  static Future<Response> getWeatherDate({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    return await get(url);
  }
}
