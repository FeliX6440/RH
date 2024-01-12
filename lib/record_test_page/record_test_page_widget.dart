import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/form_components/speech_to_text/speech_to_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'record_test_page_model.dart';
export 'record_test_page_model.dart';

class RecordTestPageWidget extends StatefulWidget {
  const RecordTestPageWidget({super.key});

  @override
  _RecordTestPageWidgetState createState() => _RecordTestPageWidgetState();
}

class _RecordTestPageWidgetState extends State<RecordTestPageWidget> {
  late RecordTestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordTestPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
            child: wrapWithModel(
              model: _model.speechToTextModel,
              updateCallback: () => setState(() {}),
              child: const SpeechToTextWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
