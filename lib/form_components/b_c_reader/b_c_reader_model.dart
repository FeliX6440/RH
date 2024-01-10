import '/flutter_flow/flutter_flow_util.dart';
import 'b_c_reader_widget.dart' show BCReaderWidget;
import 'package:flutter/material.dart';

class BCReaderModel extends FlutterFlowModel<BCReaderWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
