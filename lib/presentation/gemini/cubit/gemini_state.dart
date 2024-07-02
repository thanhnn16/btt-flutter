import 'package:bongtuyettrang/data/responses/gemini/gemini_response.dart';
import 'package:equatable/equatable.dart';
import '../gemini.dart';

class GeminiState extends Equatable {
  final GeminiResponse? response;
  final List<ChatMessage> chatHistory;
  final bool isLoading;

  const GeminiState({this.response, this.isLoading = false, this.chatHistory = const []});

  GeminiState copyWith({
    GeminiResponse? response,
    bool? isLoading,
    List<ChatMessage>? chatHistory,
  }) {
    return GeminiState(
      response: response ?? this.response,
      isLoading: isLoading ?? this.isLoading,
      chatHistory: chatHistory ?? this.chatHistory,
    );
  }

  @override
  List<Object?> get props => [response, isLoading, chatHistory];
}
