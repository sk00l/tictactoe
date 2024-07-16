import 'package:get_it/get_it.dart';
import 'package:tic_tac/modules/auth/reposiotry/authenticaion_repsitory.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthenticaionRepsitory>(AuthenticaionRepsitory());
}
