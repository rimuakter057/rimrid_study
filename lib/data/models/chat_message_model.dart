enum ChatSender { user, ai }

class ChatMessageModel {
  final String id;
  final ChatSender sender;
  final String text;
  final DateTime timestamp;

  const ChatMessageModel({
    required this.id,
    required this.sender,
    required this.text,
    required this.timestamp,
  });
}
