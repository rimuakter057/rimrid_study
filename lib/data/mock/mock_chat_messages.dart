import '../models/chat_message_model.dart';

class MockChatMessages {
  MockChatMessages._();

  static const List<String> suggestedQuestions = [
    'Explain this simply',
    'Summarize this lesson',
    'Generate a quiz',
    'Give me an example',
    "I don't understand this",
  ];

  static List<ChatMessageModel> seedConversation() {
    final now = DateTime.now();
    return [
      ChatMessageModel(
        id: 'seed_1',
        sender: ChatSender.ai,
        text:
            "Hi Rimu! I'm your AI study assistant. Ask me to explain a "
            "concept, summarize a lesson, or quiz you on what you've "
            "learned — I'm here whenever you're stuck.",
        timestamp: now.subtract(const Duration(minutes: 12)),
      ),
      ChatMessageModel(
        id: 'seed_2',
        sender: ChatSender.user,
        text: "Can you explain what GetX's Obx widget does?",
        timestamp: now.subtract(const Duration(minutes: 11)),
      ),
      ChatMessageModel(
        id: 'seed_3',
        sender: ChatSender.ai,
        text:
            "Sure! Obx is a small reactive widget from GetX. It watches any "
            "\".obs\" variable used inside its builder function, and "
            "automatically rebuilds itself whenever that variable changes — "
            "without needing setState() or a StatefulWidget.",
        timestamp: now.subtract(const Duration(minutes: 10)),
      ),
    ];
  }

  static String responseFor(String prompt) {
    final p = prompt.toLowerCase();

    if (p.contains('explain')) {
      return "Think of it like a recipe: break the concept into small "
          "steps, understand what each step does on its own, then see how "
          "they combine. Want me to apply this to a specific topic from "
          "your current lesson?";
    }
    if (p.contains('summar')) {
      return "Here's a quick summary: this lesson covers the core idea, "
          "walks through a hands-on example, calls out common mistakes, "
          "and ends with a short recap. The key takeaway is to practice "
          "the concept in your own small project.";
    }
    if (p.contains('quiz')) {
      return "Great idea — testing yourself helps retention. I've noted a "
          "few questions based on this lesson. You can find a full quiz "
          "for this course from the Upcoming section on your Home tab or "
          "your Study Planner.";
    }
    if (p.contains('example')) {
      return "Here's a simple example: imagine you're organizing a "
          "bookshelf. Each rule you apply (by author, by color, by size) "
          "is like a function — same shelf, different logic applied to "
          "get a different, useful result.";
    }
    if (p.contains("don't understand") || p.contains('dont understand')) {
      return "No worries, that's what I'm here for! Tell me which part "
          "feels unclear — the concept itself, the code syntax, or how it "
          "fits into the bigger picture — and I'll break it down further.";
    }

    return "Good question! Based on what you're learning, focus on the "
        "practical example in the current lesson first — it usually makes "
        "the concept click faster than the theory alone. Ask me to "
        "explain any specific part in more detail.";
  }
}
