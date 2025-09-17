import 'dart:convert';

import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/reyting/data/models/reyting.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/reyting/domain/repositories/reyting_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/reyting_service.dart';

class ImplReytingRepo extends ReytingRepo {
  final ReytingService reytingService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplReytingRepo({required this.reytingService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve reytings from SharedPreferences
  Future<List<Reyting>?> _getReytingsFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? reytingJsonStrings = preferences?.getStringList(
      'Reytings',
    );

    if (reytingJsonStrings == null) {
      return null;
    }

    return reytingJsonStrings.map((reytingJson) {
      return Reyting.fromJson(jsonDecode(reytingJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save reytings to SharedPreferences
  // Future<void> _saveReytingsToPreferences(Reyting reytings) async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String> reytingJsonStrings = reytings.map((reyting) {
  //     return jsonEncode(reyting.toJson());
  //   }).toList();

  //   preferences?.setStringList('Reytings', reytingJsonStrings);
  // }

  @override
  Future<DataState<Reyting>> getReyting(int id) async {
    try {
      final List<Reyting>? reytings = await _getReytingsFromPreferences();
      if (reytings != null && reytings.isNotEmpty) {
        // return DataSuccess<List<Reyting>>(data: reytings);
      }
      final response = await reytingService.getReyting(id);
      // await _saveReytingsToPreferences(response.data);
      return DataSuccess<Reyting>(data: response.data);
    } catch (e) {
      print(e);
      return DataException.getError<Reyting>(e);
    }
  }
}
