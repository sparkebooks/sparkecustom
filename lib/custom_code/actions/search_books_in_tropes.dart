// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<BooksRow>> searchBooksInTropes(
  String searchText,
  List<String> preferredTropes,
) async {
  // Add your function code here!
  List<BooksRow> searchedBooks = [];
  searchedBooks = await BooksTable().queryRows(
    queryFn: (q) => q
        .or('title.ilike.%$searchText%,blurb.ilike.%$searchText%')
        // .filter('tropes', 'cs', '{${preferredTropes.join(',')}}')
        .order('book_score', ascending: false),
  );

  return searchedBooks;
}
