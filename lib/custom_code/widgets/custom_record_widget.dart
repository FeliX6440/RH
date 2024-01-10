// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:avatar_glow/avatar_glow.dart';

class CustomRecordWidget extends StatefulWidget {
  const CustomRecordWidget({
    Key? key,
    this.width,
    this.height,
    required this.glowColor,
    required this.onRecord,
    required this.onStopRecord,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color glowColor;
  final Future<dynamic> Function() onRecord;
  final Future<dynamic> Function() onStopRecord;

  @override
  _CustomRecordWidgetState createState() => _CustomRecordWidgetState();
}

class _CustomRecordWidgetState extends State<CustomRecordWidget> {
  bool isRecord = false;
  bool _animate = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        setState(() {
          isRecord = true;
          _animate = true;
          widget.onRecord;
        });
      },
      onTapUp: (details) {
        setState(() {
          isRecord = false;
          _animate = false;
          widget.onStopRecord;
        });
      },
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: AvatarGlow(
          glowBorderRadius: BorderRadius.circular(5),
          glowColor: const Color(0xff4B29D6),
          glowShape: BoxShape.rectangle,
          animate: _animate,
          curve: Curves.linear,
          glowCount: 1,
          glowRadiusFactor: 0.2,
          child: Card(
            child: Center(
              child: isRecord
                  ? const Icon(
                      Icons.mic,
                      size: 35,
                    )
                  : const Icon(
                      Icons.mic_off,
                      size: 35,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
