import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _audioTextResult = '';
  String get audioTextResult => _audioTextResult;
  set audioTextResult(String value) {
    _audioTextResult = value;
  }

  List<String> _languageList = [
    'English',
    'French',
    'Chinese',
    'Russian',
    'German',
    'Italian'
  ];
  List<String> get languageList => _languageList;
  set languageList(List<String> value) {
    _languageList = value;
  }

  void addToLanguageList(String value) {
    _languageList.add(value);
  }

  void removeFromLanguageList(String value) {
    _languageList.remove(value);
  }

  void removeAtIndexFromLanguageList(int index) {
    _languageList.removeAt(index);
  }

  void updateLanguageListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _languageList[index] = updateFn(_languageList[index]);
  }

  void insertAtIndexInLanguageList(int index, String value) {
    _languageList.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
