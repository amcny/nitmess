import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _messname = prefs.getString('ff_messname') ?? _messname;
    });
    _safeInit(() {
      _jsondata = prefs.getStringList('ff_jsondata')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _jsondata;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _messname = '';
  String get messname => _messname;
  set messname(String value) {
    _messname = value;
    prefs.setString('ff_messname', value);
  }

  List<dynamic> _jsondata = [];
  List<dynamic> get jsondata => _jsondata;
  set jsondata(List<dynamic> value) {
    _jsondata = value;
    prefs.setStringList(
        'ff_jsondata', value.map((x) => jsonEncode(x)).toList());
  }

  void addToJsondata(dynamic value) {
    _jsondata.add(value);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void removeFromJsondata(dynamic value) {
    _jsondata.remove(value);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromJsondata(int index) {
    _jsondata.removeAt(index);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void updateJsondataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _jsondata[index] = updateFn(_jsondata[index]);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInJsondata(int index, dynamic value) {
    _jsondata.insert(index, value);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  final _homepageManager = StreamRequestManager<List<MessRecord>>();
  Stream<List<MessRecord>> homepage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MessRecord>> Function() requestFn,
  }) =>
      _homepageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomepageCache() => _homepageManager.clear();
  void clearHomepageCacheKey(String? uniqueKey) =>
      _homepageManager.clearRequest(uniqueKey);

  final _menupageManager = StreamRequestManager<MessRecord>();
  Stream<MessRecord> menupage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<MessRecord> Function() requestFn,
  }) =>
      _menupageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMenupageCache() => _menupageManager.clear();
  void clearMenupageCacheKey(String? uniqueKey) =>
      _menupageManager.clearRequest(uniqueKey);

  final _indexpageManager = StreamRequestManager<List<MessRecord>>();
  Stream<List<MessRecord>> indexpage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MessRecord>> Function() requestFn,
  }) =>
      _indexpageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearIndexpageCache() => _indexpageManager.clear();
  void clearIndexpageCacheKey(String? uniqueKey) =>
      _indexpageManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
