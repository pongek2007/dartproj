//import 'package:cli/cli.dart' as cli;
import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help'){
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    // print('Search command recognized!');
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);

  } else { 
    printUsage(); 
  }
}

void searchWikipedia(List<String>? arguments) async { // Add this new function and add ? to arguments type
  // print('searchWikipedia received arguments: $arguments');

  final String? articleTitle;
  if (arguments == null || arguments.isEmpty) {
    print('please provide an article title.');
    final inputFromStdin = stdin.readLineSync();
    // articleTitle = stdin.readLineSync() ?? '';
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting...');
      return;
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  // print('current article title : $articleTitle');
  print('looking up articles about : "$articleTitle". please wait....');

  // call the API and await the result 
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent);
}

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'wikipedia <ARTICLE-TITLE>'"
  );
}

Future<String> getWikipediaArticle(String articleTitle) async{

  final url = Uri.https(
    'en.wikipedia.org', // wikipedia API domain
    '/wiki/Api.rest_v1/page/summary/$articleTitle',  // API path for article summary
  );
  
  final response = await http.get(url);    // Make the http request
  if (response.statusCode == 200) {
    return response.body;      // return the response body if successful 
  }

  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}