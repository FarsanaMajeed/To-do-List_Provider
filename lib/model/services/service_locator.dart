//import 'package:get_it/get_it.dart';
//import 'package:ilean/logic/view_models/account_page_manager.dart';
//import 'package:ilean/logic/view_models/motivation_manager.dart';
//import 'package:ilean/logic/view_models/page_manager.dart';
//import 'package:ilean/logic/view_models/authentication_manager.dart';
//import 'package:ilean/logic/view_models/subscription_manager.dart';
//import 'package:ilean/logic/view_models/vision_board_manager.dart';
//import 'package:ilean/models/services/motivation_service.dart';
//import 'package:ilean/models/services/playlist_repository.dart';
//import 'package:ilean/models/services/storage_service.dart';
//import 'package:ilean/models/services/subscription_service.dart';
//import 'package:ilean/models/services/user_service.dart';
//import 'package:ilean/models/services/vision_board_service.dart';
//import 'package:shared_preferences/shared_preferences.dart';


import 'package:get_it/get_it.dart';

import '../../logic/view_models/authentication.dart';
import 'auth_service.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // services
 // getIt.registerSingleton<AudioHandler>(await initAudioService());
  //getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  getIt.registerSingleton<AuthService>(AuthService());
  //getIt.registerSingleton<SubscriptionService>(SubscriptionService());
 // getIt.registerLazySingleton<UserService>(() => UserService());
  //getIt.registerLazySingleton<StorageService>(() => StorageService());
  //getIt.registerLazySingleton<VisionBoardService>(() => VisionBoardService());
  //getIt.registerLazySingleton<PlaylistRepository>(() => DemoPlaylist());
  //getIt.registerLazySingleton<MotivationService>(() => MotivationService());
  // page state
  //getIt.registerLazySingleton<PageManager>(() => PageManager());
  getIt.registerLazySingleton<Authentication>(() => Authentication());
  //getIt.registerLazySingleton<AccountPageManager>(() => AccountPageManager());
  //getIt.registerLazySingleton<VisionBoardManager>(() => VisionBoardManager());
  //getIt.registerLazySingleton<SubscriptionManager>(() => SubscriptionManager());
  //getIt.registerLazySingleton<MotivationManager>(() => MotivationManager());

}