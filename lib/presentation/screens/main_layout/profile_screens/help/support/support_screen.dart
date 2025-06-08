// import 'package:flutter/material.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:investa4/core/routes_manager/colors_managers.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final _openAI = OpenAI.instance.build(
//     token: 'YOUR_OPENAI_API_KEY',
//     baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 1)),
//     enableLog: true,
//   );
//
//   final ChatUser _currentUser = ChatUser(id: "1", firstName: "User");
//   final ChatUser _gptUser = ChatUser(id: "2", firstName: "GPT");
//
//   final List<ChatMessage> _messages = [];
//   final List<ChatUser> _typingUsers = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManagers.white,
//       appBar: AppBar(
//
//         title: const Text("Investa"),
//         backgroundColor: ColorsManagers.white,
// elevation: 1,
//       ),
//       body: DashChat(
//         currentUser: _currentUser,
//         messages: _messages,
//         typingUsers: _typingUsers,
//         onSend: _handleSend,
//         messageOptions: const MessageOptions(
//           currentUserContainerColor: Colors.blueAccent,
//           textColor: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   void _handleSend(ChatMessage message) async {
//     setState(() {
//       _messages.insert(0, message);
//       _typingUsers.add(_gptUser);
//     });
//
//     List<Map<String, dynamic>> history = _messages.reversed.map((msg) {
//       return {
//         "role": msg.user.id == _currentUser.id ? "user" : "assistant",
//         "content": msg.text,
//       };
//     }).toList();
//
//     final request = ChatCompleteText(
//       model: GptTurbo0301ChatModel(),
//       messages: history,
//       maxToken: 200,
//     );
//
//     final response = await _openAI.onChatCompletion(request: request);
//
//     if (response != null && response.choices.isNotEmpty) {
//       final reply = response.choices.first.message;
//       if (reply != null) {
//         setState(() {
//           _messages.insert(
//             0,
//             ChatMessage(
//               user: _gptUser,
//               createdAt: DateTime.now(),
//               text: reply.content,
//             ),
//           );
//         });
//       }
//     }
//
//     setState(() {
//       _typingUsers.remove(_gptUser);
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

import '../../../../../../core/assets_managers.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _openAI = OpenAI.instance.build(
    token: 'YOUR_OPENAI_API_KEY', // ← استبدلها بالتوكن الحقيقي
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 30), // ← مهم جداً
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id: "1", firstName: "User");
  final ChatUser _gptUser = ChatUser(id: "2", firstName: "GPT");

  final List<ChatMessage> _messages = [];
  final List<ChatUser> _typingUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManagers.darkBlue,
          ),
          child: IconButton(
            icon: const ImageIcon(
              AssetImage(AssetsManagers.existIcon),
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min, // يخلي حجم الـ Row على قد المحتوى
          children: [
            Image.asset(
              AssetsManagers.splashLogo, // ← غيّر المسار حسب صورتك
              width: 72,
              height: 72,
            ),
            const SizedBox(width: 1), // مسافة بين الصورة والنص
            const Padding(
              padding: EdgeInsets.only(top: 14, right: 15),
              child: Text(
                'INVESTA ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
      ),

      body: DashChat(
        currentUser: _currentUser,
        messages: _messages,
        typingUsers: _typingUsers,
        onSend: _handleSend,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.blueAccent,
          textColor: Colors.white,
        ),
      ),
    );
  }

  void _handleSend(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
      _typingUsers.add(_gptUser);
    });

    List<Map<String, dynamic>> history =
        _messages.reversed.map((msg) {
          return {
            "role": msg.user.id == _currentUser.id ? "user" : "assistant",
            "content": msg.text,
          };
        }).toList();

    final request = ChatCompleteText(
      model:
          GptTurbo0301ChatModel(), // ممكن تستبدلها بـ GptTurboChatModel() لو القديم مش شغال
      messages: history,
      maxToken: 200,
    );

    try {
      final response = await _openAI.onChatCompletion(request: request);

      if (response != null && response.choices.isNotEmpty) {
        final reply = response.choices.first.message;
        if (reply != null) {
          setState(() {
            _messages.insert(
              0,
              ChatMessage(
                user: _gptUser,
                createdAt: DateTime.now(),
                text: reply.content,
              ),
            );
          });
        }
      }
    } catch (e) {
      debugPrint("ChatGPT error: $e");
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _gptUser,
            createdAt: DateTime.now(),
            text: "حصل خطأ في الاتصال بالبوت 😔",
          ),
        );
      });
    }

    setState(() {
      _typingUsers.remove(_gptUser);
    });
  }
}
