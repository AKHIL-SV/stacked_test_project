import 'package:dartz/dartz.dart';
import 'package:stacked_test_project/api/model/user/user_model.dart';

abstract class ApiRepository {
  Future<Either<String, List<UserModel>>> getUserList( String id);
  
}
