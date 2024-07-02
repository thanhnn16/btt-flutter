import 'dart:convert';

import 'package:bongtuyettrang/data/responses/gemini/gemini_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../app/utils/const.dart';
import '../gemini.dart';
import 'gemini_state.dart';

class GeminiCubit extends Cubit<GeminiState> {
  GeminiCubit(super.initialState);

  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: dotenv.env['GEMINI_API_KEY'] ?? '',
    generationConfig: GenerationConfig(
        temperature: 0.5,
        topK: 50,
        topP: 0.95,
        maxOutputTokens: 2000,
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
  String subMessage = """
    Tên: Nguyễn Thành,
    Số điện thoại: 0879159499,
    Địa chỉ: 362/29/11 Thống Nhất, P.16, Q.Gò Vấp, TP.HCM,
    Giới tính: Nam,
    """; // Thông tin khách hàng cần thêm vào cuộc trò chuyện

  Future<void> sendMessage(String message) async {
    addChatHistory(ChatMessage(message: message, role: ChatRole.user));
    addChatHistory(ChatMessage(
      message: 'Typing...',
      role: ChatRole.loading,
    ));

    emit(state.copyWith(isLoading: true));
    final chat = model.startChat();

    Content content = Content.text(message + subMessage);
    GenerateContentResponse response = await chat.sendMessage(content);

    emit(state.copyWith(chatHistory: state.chatHistory..removeLast()));
    try {
      final chatResponseJson = jsonDecode(response.text ?? '');
      final chatResponse = GeminiResponse.fromJson(chatResponseJson);
      print('Chat response: ${chatResponse.message}');
      emit(state.copyWith(response: chatResponse, isLoading: false));
      addChatHistory(ChatMessage(
        message: chatResponse.message,
        role: ChatRole.modal,
      ));
    } catch (e) {
      print('Error processing your request. Please try again later. Error: $e');
      addChatHistory(ChatMessage(
        message: 'Error processing your request. Please try again later.',
        role: ChatRole.modal,
      ));
    }
  }

  void reset() {
    emit(state.copyWith(response: null, chatHistory: []));
  }

  void addChatHistory(ChatMessage message) {
    emit(state.copyWith(chatHistory: [...state.chatHistory, message]));
  }
}
