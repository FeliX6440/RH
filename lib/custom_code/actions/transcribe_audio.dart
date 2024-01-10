// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:dart_openai/dart_openai.dart';

Future transcribeAudio(String? audioPath) async {
  // Add your function code here!
  if (audioPath != null) {
    OpenAIAudioModel transcription =
        await OpenAI.instance.audio.createTranscription(
      file: File(audioPath),
      model: "whisper-1",
      responseFormat: OpenAIAudioResponseFormat.json,
    );
    FFAppState().audioTextResult = transcription.text;
  }
}
