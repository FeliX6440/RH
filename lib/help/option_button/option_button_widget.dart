import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'option_button_model.dart';
export 'option_button_model.dart';

class OptionButtonWidget extends StatefulWidget {
  const OptionButtonWidget({super.key});

  @override
  _OptionButtonWidgetState createState() => _OptionButtonWidgetState();
}

class _OptionButtonWidgetState extends State<OptionButtonWidget> {
  late OptionButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).lineColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.add_circle_outline,
            color: Color(0xFF39D1A9),
            size: 24.0,
          ),
          Text(
            'Hello World',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
      ),
    );
  }
}
