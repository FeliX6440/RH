import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'speech_to_text_model.dart';
export 'speech_to_text_model.dart';

class SpeechToTextWidget extends StatefulWidget {
  const SpeechToTextWidget({super.key});

  @override
  _SpeechToTextWidgetState createState() => _SpeechToTextWidgetState();
}

class _SpeechToTextWidgetState extends State<SpeechToTextWidget> {
  late SpeechToTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpeechToTextModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: double.infinity,
      height: 500.0,
      child: custom_widgets.CustomSpeechToText(
        width: double.infinity,
        height: 500.0,
        containerHeight: 100.0,
        containerWidth: 100.0,
        glowColor: FlutterFlowTheme.of(context).primary,
        buttonColor: FlutterFlowTheme.of(context).primary,
        resetButtonColor: const Color(0x2EA9ADC6),
        dropdownListValue: FFAppState().languageList,
      ),
    );
  }
}
