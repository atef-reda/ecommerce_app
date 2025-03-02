import 'dart:async';
import 'dart:io';

Future<bool> checkInternet() async {
  List<String> testSites = [
    "google.com",
    "cloudflare.com",
    "github.com"
  ];

  for (String site in testSites) {
    try {
      final result = await InternetAddress.lookup(site).timeout(Duration(seconds: 3));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // Internet is available
      }
    } on SocketException catch (_) {
      continue; // Try the next site
    } on TimeoutException catch (_) {
      continue; // Timeout, try the next site
    }
  }

  return false; // No internet connection
}
