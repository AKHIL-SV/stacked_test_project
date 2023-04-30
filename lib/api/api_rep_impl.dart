import 'package:dartz/dartz.dart';
import 'package:stacked_test_project/api/model/user/user_model.dart';
import 'package:stacked_test_project/repository/api_repository.dart';
import '../app/app.locator.dart';
import 'api_client/apiclient.dart';

class ApiImpl extends ApiRepository {
  ApiClient client = locator<ApiClient>();
  @override
  Future<Either<String, List<UserModel>>> getUserList(id) async {
    try {
      var response = await client.getUsers(id);
      if (response.code == 200) {
        return Right(response.data);
      } else {
        return const Left('Failed to fetch data');
      }
    } catch (e) {
      return const Left('Failed to fetch data');
    }
  }
}
