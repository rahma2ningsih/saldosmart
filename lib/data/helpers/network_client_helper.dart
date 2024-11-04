// import 'package:appwrite/appwrite.dart';
// import '../../core/constants.dart';

// class NetworkClientHelper {
//   // APPWRITE CLIENT HELPER
//   static final Client _appwriteClient =
//       Client().setEndpoint(appwriteEndpoint).setProject(projectId);

//   NetworkClientHelper._();

//   static final instance = NetworkClientHelper._();

//   Client get appwriteClient => _appwriteClient;

//   //how to use: NetworkClientHelper.instance.appwriteClient();
// }

import 'package:appwrite/appwrite.dart';

Client getAppwriteClient() {
  Client client = Client();
  client
    .setEndpoint('https://cloud.appwrite.io/v1') // Set your Appwrite API Endpoint
    .setProject('66e515170024113d12b5'); // Set your Project ID
  return client;
}
