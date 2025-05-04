import 'package:country_app/model/country.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://restcountries.com/v3.1/')
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);
  @GET('all')
  //future နဲ့ပဲေရးရတာ asynchronous way
  Future<List<Country>> getCountries();
}
