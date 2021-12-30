import 'package:chopper/chopper.dart';
import 'package:eskuad/data/network/api_model.dart';
import 'package:eskuad/data/network/model_converter.dart';

part 'api_service.chopper.dart';

const int apiPerPage = 20;
const String apiUrl = 'https://hn.algolia.com/api/v1/';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(path: 'search_by_date?query=mobile&hitsPerPage=$apiPerPage')
  Future<Response<APIHits>> queryHits(@Query('page') int page);

  static ApiService create() {
    const converter = JsonSerializableConverter({
      APIHits: APIHits.fromJsonFactory,
      APIArticle: APIArticle.fromJsonFactory,
    });

    final client = ChopperClient(
      baseUrl: apiUrl,
      interceptors: [HttpLoggingInterceptor()],
      converter: converter,
      errorConverter: const JsonConverter(),
      services: [
        _$ApiService(),
      ],
    );
    return _$ApiService(client);
  }
}
