import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';

class AppwriteConfig {
  static const endpoint = 'https://cloud.appwrite.io/v1';
  static const projectId = '6a3d90690027e626c87c';
  static const databaseId = '6a3d923c0002ed8f934b';
  static const actasBucketId = '6a3d9d1d003808849750';

  static const usersProfileCollection = 'users_profile';
  static const recintosCollection = 'recintos';
  static const mesasCollection = 'mesas';
  static const actasCollection = 'actas';
  static const actaVotosCollection = 'acta_votos';
  static const organizacionesCollection = 'organizaciones_politicas';
}

class AppwriteModule {
  static void register(GetIt sl) {
    final client = Client()
      ..setEndpoint(AppwriteConfig.endpoint)
      ..setProject(AppwriteConfig.projectId)
      ..setSelfSigned(status: false);

    sl.registerSingleton<Client>(client);
    sl.registerSingleton<Account>(Account(client));
    sl.registerSingleton<Databases>(Databases(client));
    sl.registerSingleton<Storage>(Storage(client));
    sl.registerSingleton<Functions>(Functions(client));
  }
}
