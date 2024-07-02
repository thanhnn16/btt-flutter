import 'package:bongtuyettrang/gen/assets.gen.dart';
import 'package:bongtuyettrang/presentation/gemini/cubit/gemini_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../app/utils/check_permission.dart';
import 'cubit/gemini_state.dart';

class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({super.key});

  @override
  State<GeminiChatScreen> createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final _messageController = TextEditingController();
  final SpeechToText _speechToText = SpeechToText();
  bool _isListening = false;
  bool _hasAudioPermission = false;
  late GeminiCubit _geminiCubit;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _speechToText.initialize();
    _checkAudioPermission();
    _geminiCubit = GeminiCubit(const GeminiState());
  }

  @override
  void dispose() {
    _messageController.dispose();
    _geminiCubit.close();
    super.dispose();
  }

  void _checkAudioPermission() async {
    _hasAudioPermission = await checkAudioPermission();
    if (!_hasAudioPermission) {
      requestAudioPermission();
    }
  }

  void _sendMessage(String message) {
    _geminiCubit.sendMessage(message);
  }

  void _startListening() {
    if (!_speechToText.isAvailable) {
      showAdaptiveDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Lỗi'),
              content:
                  const Text('Thiết bị của bạn không hỗ trợ chức năng này.'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isListening = false;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Đóng'),
                ),
              ],
            );
          });
    }
    if (!_isListening) {
      _speechToText.listen(onResult: (result) {
        _messageController.text = result.recognizedWords;
        // _sendMessage(result.recognizedWords);
      });
      setState(() {
        _isListening = true;
      });
    } else {
      _speechToText.stop();
      setState(() {
        _isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _geminiCubit,
      child: BlocBuilder<GeminiCubit, GeminiState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Trợ lý ảo Bông Tuyết Trắng'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.chatHistory.length,
                  itemBuilder: (context, index) {
                    final message = state.chatHistory[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: message.role == ChatRole.user
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: message.role == ChatRole.user
                                ? Colors.blue
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            children: [
                              if (message.role == ChatRole.loading)
                                Lottie.asset(Assets.animations.typing.path,
                                    width: 100, height: 100),
                              Text(message.message),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  controller: _scrollController,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    if (!_isListening)
                      IconButton(
                        onPressed: _startListening,
                        icon: const Icon(Icons.mic),
                      )
                    else
                      IconButton(
                        onPressed: _startListening,
                        icon: const Icon(Icons.stop),
                      ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Nhập tin nhắn...',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) {
                          _messageController.clear();
                          _sendMessage(value);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _sendMessage(_messageController.text);
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ChatMessage {
  final String message;
  final ChatRole role;

  ChatMessage({required this.message, required this.role});
}

enum ChatRole { user, modal, loading }
