// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';

class CustomSpeechToText extends StatefulWidget {
  const CustomSpeechToText({
    Key? key,
    this.width,
    this.height,
    this.containerHeight,
    this.containerWidth,
    required this.glowColor,
    required this.buttonColor,
    required this.resetButtonColor,
    required this.dropdownListValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? containerHeight;
  final double? containerWidth;
  final Color glowColor;
  final Color buttonColor;
  final Color resetButtonColor;
  final List<String> dropdownListValue;

  @override
  _CustomSpeechToTextState createState() => _CustomSpeechToTextState();
}

class _CustomSpeechToTextState extends State<CustomSpeechToText> {
  final SpeechToText speechToText = SpeechToText();
  bool _isAnimate = false;
  String text = '';
  bool available = false;
  TextEditingController _textEditingController = TextEditingController();

  bool _isLoading = false;
  bool _isSummaryLoading = false;
  String? _dropDownValue;
  late Dio _dio;
  Map<String, dynamic> header = {'Content-Type': 'application/json'};

  Future<void> _translateWord() async {
    setState(() {
      _isLoading = true;
    });
    await _dio
        .postUri(
            Uri.parse("https://rainconnect-cool-api.onrender.com/translate"),
            data: {
              'text': _textEditingController.text,
              'lang': _dropDownValue ?? 'English'
            },
            options: Options(
              headers: header,
            ))
        .then((value) {
      _textEditingController.text = value.data['text'];
      setState(() {
        _isLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _isLoading = false;
      });
      print(error);
    });
  }

  Future<void> _summarizeWord() async {
    setState(() {
      _isSummaryLoading = true;
    });
    await _dio
        .postUri(
            Uri.parse("https://rainconnect-cool-api.onrender.com/summarize"),
            data: {
              'text': _textEditingController.text,
            },
            options: Options(
              headers: header,
            ))
        .then((value) {
      _textEditingController.text = value.data['text'];
      setState(() {
        _isSummaryLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _isSummaryLoading = false;
      });
      print(error);
    });
  }

  @override
  void initState() {
    _dio = Dio();
    Future.microtask(() async {
      available = await speechToText.initialize();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: [
          AvatarGlow(
            glowBorderRadius: BorderRadius.circular(5),
            glowColor: widget.glowColor,
            glowShape: BoxShape.rectangle,
            animate: _isAnimate,
            curve: Curves.linear,
            glowCount: 1,
            glowRadiusFactor: 0.2,
            child: GestureDetector(
              onTapDown: (details) async {
                // bool available = await speechToText.initialize();
                setState(() {
                  _isAnimate = true;
                });
                if (available) {
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                        FFAppState().update(
                          () {
                            _textEditingController.text = text;
                            FFAppState().audioTextResult =
                                _textEditingController.text;
                          },
                        );
                      });
                    },
                  );
                }
              },
              onTapUp: (details) async {
                await speechToText.stop();

                // returnedText = await chat(text);
                setState(() {
                  _isAnimate = false;
                });
              },
              child: SizedBox(
                height: widget.containerHeight,
                width: widget.containerWidth,
                child: AvatarGlow(
                  glowBorderRadius: BorderRadius.circular(5),
                  glowColor: widget.glowColor,
                  glowShape: BoxShape.rectangle,
                  animate: _isAnimate,
                  curve: Curves.linear,
                  glowCount: 1,
                  glowRadiusFactor: 0.2,
                  child: Card(
                    child: Center(
                      child: _isAnimate
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
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(0),
            child: TextFormField(
              controller: _textEditingController,
              maxLines: 4,
              onChanged: (value) {
                FFAppState().update(
                  () {
                    FFAppState().audioTextResult = value;
                  },
                );
              },
              decoration: InputDecoration(
                suffix: GestureDetector(
                    onTap: () {
                      FFAppState().audioTextResult = '';
                      _textEditingController.clear();
                    },
                    child: const Icon(Icons.clear)),
                hintText: 'Output voice',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 2,
                      color: widget.glowColor,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 2, color: Colors.grey)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: 'Translate',
                  onTap: _translateWord,
                  isLoading: _isLoading,
                  color: widget.buttonColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(.3)),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      underline: const SizedBox(),
                      value: _dropDownValue,
                      hint: const Text('Select Lang'),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      items: widget.dropdownListValue.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _dropDownValue = value;
                        });
                      }),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            color: widget.buttonColor,
            title: 'Summarize',
            onTap: _summarizeWord,
            isLoading: _isSummaryLoading,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            color: widget.resetButtonColor,
            title: 'Reset',
            onTap: () {
              _textEditingController.clear();
            },
            isLoading: false,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String title;
  final Color color;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.isLoading,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3.5,
                    ),
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
