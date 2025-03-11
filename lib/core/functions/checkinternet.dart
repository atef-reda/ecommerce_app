import 'dart:async';
import 'dart:io';

Future<bool> checkInternet() async {
  List<String> testSites = ["google.com", "facebook.com", "instagram.com"];

  for (String site in testSites) {
    try {
      final result = await InternetAddress.lookup(site);
      print('-------------------------');
      print(result);
      print('-------------------------');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // Internet is available
      }
    } on SocketException catch (_) {
      print('-----------site--------------');

      continue; // Try the next site
    } on TimeoutException catch (_) {
      continue; // Timeout, try the next site
    }
  }

  return false; // No internet connection
}
