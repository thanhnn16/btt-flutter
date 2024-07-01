import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../app/utils/const.dart';

class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({super.key});

  @override
  State<GeminiChatScreen> createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final _chatHistory = <ChatMessage>[];
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: dotenv.env['GEMINI_API_KEY'] ?? '',
      generationConfig: GenerationConfig(
          temperature: 1,
          topK: 64,
          topP: 0.95,
          maxOutputTokens: 200,
          responseMimeType: 'application/json',
          responseSchema: Schema.object(
            properties: {
              'message': Schema.string(),
              'data': Schema.object(properties: {
                'service_category': Schema.string(),
                'service': Schema.string(),
                'date_time': Schema.string(),
              }),
              'available_services': Schema.array(items: Schema.string()),
            },
          )),
      systemInstruction: Content.text(systemInstruction),
    );

    setState(() {
      _chatHistory.add(ChatMessage(
        message: message,
        role: ChatRole.user,
      ));
    });

    final chat = model.startChat();

    _messageController.clear();

    Content content = Content.text(message);
    GenerateContentResponse response = await chat.sendMessage(content);

    try {
      final chatResponseJson = jsonDecode(response.text ?? '');
      final chatResponse = ChatResponse.fromJson(chatResponseJson);
      setState(() {
        _chatHistory.add(ChatMessage(
          message: chatResponse.message,
          role: ChatRole.modal,
        ));
      });
    } catch (e) {
      print('Error parsing Gemini response: $e');
      print('Response text: ${response.text}');
      setState(() {
        _chatHistory.add(ChatMessage(
          message: 'Error processing your request. Please try again later.',
          role: ChatRole.modal,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trợ lý ảo Bông Tuyết Trắng'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatHistory.length,
              itemBuilder: (context, index) {
                final message = _chatHistory[index];
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
                      child: Text(message.message),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Nhập tin nhắn...',
                      border: OutlineInputBorder(),
                    ),
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
  }
}

class ChatMessage {
  final String message;
  final ChatRole role;

  ChatMessage({required this.message, required this.role});
}

class ChatResponse {
  final String message;
  final Map<String, dynamic> data;
  final List<String> availableServices;

  ChatResponse({
    required this.message,
    required this.data,
    required this.availableServices,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      message: json['message'],
      // Assuming the message is under "message"
      data: json['data'] ?? {},
      // Assuming the data is under "data", handle null
      availableServices:
          (json['available_services'] as List<dynamic>?)?.cast<String>() ??
              [], // Handle null and cast to String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data,
      'available_services': availableServices,
    };
  }
}

enum ChatRole { user, modal }
