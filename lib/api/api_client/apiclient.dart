import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stacked_test_project/api/response/user_list_response/user_list_reponse.dart';
part 'apiclient.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public-api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  static ApiClient create() {
    final dio = Dio();
    return ApiClient(dio);
  }

  @GET('/users?page={id}')
  Future<UserListResponse> getUsers(
    @Path('id') String id,
  );
}
