import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'template_editor_widget.dart' show TemplateEditorWidget;
import 'package:flutter/material.dart';

class TemplateEditorModel extends FlutterFlowModel<TemplateEditorWidget> {
  ///  Local state fields for this page.

  List<dynamic> firestoreData = [];
  void addToFirestoreData(dynamic item) => firestoreData.add(item);
  void removeFromFirestoreData(dynamic item) => firestoreData.remove(item);
  void removeAtIndexFromFirestoreData(int index) =>
      firestoreData.removeAt(index);
  void insertAtIndexInFirestoreData(int index, dynamic item) =>
      firestoreData.insert(index, item);
  void updateFirestoreDataAtIndex(int index, Function(dynamic) updateFn) =>
      firestoreData[index] = updateFn(firestoreData[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
