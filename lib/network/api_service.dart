import 'package:chopper/chopper.dart';
import 'package:eskuad/network/api_model.dart';
import 'package:eskuad/network/model_converter.dart';

part 'api_service.chopper.dart';

const String apiUrl =
    'https://hn.algolia.com/api/v1/search_by_date?query=mobile';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response<APIHits>> queryHits();

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
