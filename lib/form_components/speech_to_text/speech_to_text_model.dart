import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'speech_to_text_widget.dart' show SpeechToTextWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class SpeechToTextModel extends FlutterFlowModel<SpeechToTextWidget> {
  ///  Local state fields for this component.

  bool isRecording = false;

  String sttaudio = 'false';

  ///  State fields for stateful widgets in this component.

  Record? audioRecorder;
  String? audioRecorded;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
