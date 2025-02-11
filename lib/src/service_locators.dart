import 'package:dating/src/data/repositories/mock_user_repository.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'domain/repositories/user_repository.dart';

final sl = GetIt.instance;


void setupServiceLocator() {
  // Network
  sl.registerSingleton<DioClient>(DioClient());


  sl.registerSingleton<UserRepository>(MockUserRepository());
 
}
