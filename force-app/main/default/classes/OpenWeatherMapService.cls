public with sharing class OpenWeatherMapService {
  public static final String API_KEY = '3cc5b3c41991e7562887f508027b854f'; // Replace with your actual API key
  public static final String BASE_URL = 'https://api.openweathermap.org/data/2.5/weather?q={city}&appid={apiKey}';
  //public static final String BASE_URL = 'https://api.openweathermap.org/data/2.5/weather?q={city}&appid=3cc5b3c41991e7562887f508027b854f';

  @AuraEnabled(cacheable=true)
  public static WeatherData getWeatherData(String city) {
    system.debug('City is===== '+ city);
    String url = BASE_URL.replace('{city}', city).replace('{apiKey}', API_KEY);
    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('GET');

    Http http = new Http();
    HttpResponse res = http.send(req);
    system.debug('response code is ========'+res.getStatusCode());
    if (res.getStatusCode() == 200) {
     /*
        // Parse JSON response safely
      system.debug('inside 200 code result is ====='+ res.getBody());
      Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

      // Extract weather data
      String cityName = (String) results.get('name');
      Map<String, Object> main = (Map<String, Object>) results.get('main');
      List<Map<String, Object>> weather = (List<Map<String, Object>>) results.get('weather');

      WeatherData weatherData = new WeatherData();
      weatherData.city = cityName;
      weatherData.temperature = (Decimal) main.get('temp');
      weatherData.humidity = (Decimal) main.get('humidity');
      weatherData.condition = (String) weather.get(0).get('description');

      return weatherData;*/
      system.debug('inside 200 code result is ====='+ res.getBody());
      Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

      WeatherData weatherData = new WeatherData();
      weatherData.city = (String) results.get('name');
      Map<String, Object> main = (Map<String, Object>) results.get('main');
      weatherData.temperature = (Decimal) main.get('temp');
      weatherData.humidity = (Decimal) main.get('humidity');
     // Map<String, Object> weather = (Map<String, Object>) results.get('weather');
     // weatherData.condition = (String) weather.get('description');

      return weatherData;
    } else {
      system.debug('error');
      return null;
    }
  }

  public class WeatherData {
    @AuraEnabled public String city;
    @AuraEnabled public Decimal temperature;
    @AuraEnabled public Decimal humidity;
    @AuraEnabled public String condition;
  }
}