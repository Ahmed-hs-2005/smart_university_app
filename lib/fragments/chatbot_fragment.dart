import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ChatbotFragment extends StatefulWidget {
  const ChatbotFragment({super.key});

  @override
  State<ChatbotFragment> createState() =>
      _ChatbotFragmentState();
}

class _ChatbotFragmentState extends State<ChatbotFragment> {
  final controller = TextEditingController();
  String answer = "";
  bool loading = false;

  void ask() async {
    setState(() => loading = true);

    final result =
    await ApiService.askChatbot(controller.text);

    setState(() {
      answer = result['answer'];
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            "assets/gifs/ai_chat.gif",
            height: 120,
          ),

          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Ask something about development",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: ask,
            child: const Text("Ask AI"),
          ),

          const SizedBox(height: 20),

          if (loading)
            Image.asset(
              "assets/gifs/loading.gif",
              height: 80,
            )
          else
            Text(
              answer,
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }
}