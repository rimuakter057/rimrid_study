import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/mock/mock_chat_messages.dart';
import '../../../data/models/chat_message_model.dart';

class AiAssistantController extends GetxController {
  final RxList<ChatMessageModel> messages = <ChatMessageModel>[].obs;
  final RxBool isTyping = false.obs;
  final textController = TextEditingController();
  final scrollController = ScrollController();

  List<String> get suggestions => MockChatMessages.suggestedQuestions;

  @override
  void onInit() {
    super.onInit();
    messages.addAll(MockChatMessages.seedConversation());
  }

  void sendMessage([String? presetText]) {
    final text = (presetText ?? textController.text).trim();
    if (text.isEmpty) return;

    messages.add(
      ChatMessageModel(
        id: 'm_${DateTime.now().millisecondsSinceEpoch}',
        sender: ChatSender.user,
        text: text,
        timestamp: DateTime.now(),
      ),
    );
    textController.clear();
    _scrollToBottom();

    isTyping.value = true;
    Future.delayed(const Duration(milliseconds: 900), () {
      messages.add(
        ChatMessageModel(
          id: 'm_${DateTime.now().millisecondsSinceEpoch}_ai',
          sender: ChatSender.ai,
          text: MockChatMessages.responseFor(text),
          timestamp: DateTime.now(),
        ),
      );
      isTyping.value = false;
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 120,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
