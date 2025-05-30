// chat_bot_view.dart
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // شيل علامة // لو هتستخدم مكتبة http
// import 'dart:convert'; // شيل علامة // لو هتستخدم jsonDecode/jsonEncode

class ChatBotView extends StatefulWidget {
  // تأكد إن اسم الكلاس هنا هو "ChatBotView" بالظبط
  const ChatBotView({super.key});

  @override
  State<ChatBotView> createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatBotView> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = []; // هنا هنخزن الرسائل اللي بتظهر في الشات

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add('أنت: ${_messageController.text}');
        // هنا المفروض تبعت رسالة المستخدم للشات بوت AI وتستقبل الرد
        // لغرض المثال، هضيف رد بسيط افتراضي
        _messages.add(
            'بوت: ${'أهلاً بك! لقد تلقيت رسالتك: "${_messageController.text}"'}');
      });
      _messageController.clear();
      // ممكن تعمل scroll للأسفل تلقائياً لو عندك ScrollController
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, How Can I Help You'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // لإغلاق البوب أب
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: _messages[index].startsWith('أنت:')
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: _messages[index].startsWith('أنت:')
                          ? Colors.blue[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(_messages[index]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالتك...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                    ),
                    onSubmitted: (_) =>
                        _sendMessage(), // إرسال بالضغط على Enter
                  ),
                ),
                const SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  mini: true,
                  backgroundColor: Colors.blue[800],
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
          // جزء لإضافة مسافة أسفل لو الكيبورد ظهرت (خاصة بالـ BottomSheet)
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom)),
        ],
      ),
    );
  }
}
