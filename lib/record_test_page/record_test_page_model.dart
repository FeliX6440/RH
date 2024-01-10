import '/flutter_flow/flutter_flow_util.dart';
import '/form_components/speech_to_text/speech_to_text_widget.dart';
import 'record_test_page_widget.dart' show RecordTestPageWidget;
import 'package:flutter/material.dart';

class RecordTestPageModel extends FlutterFlowModel<RecordTestPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SpeechToText component.
  late SpeechToTextModel speechToTextModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    speechToTextModel = createModel(context, () => SpeechToTextModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    speechToTextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
