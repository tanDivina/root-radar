import 'package:flutter/material.dart';
import '../main.dart';

class GreetingsScreen extends StatefulWidget {
  const GreetingsScreen({super.key});

  @override
  State<GreetingsScreen> createState() => _GreetingsScreenState();
}

class _GreetingsScreenState extends State<GreetingsScreen> {
  String? _resultMessage;
  String? _errorMessage;
  final _textEditingController = TextEditingController();
  bool _isTyping = false;

  void _askButler() async {
    if (_textEditingController.text.isEmpty) return;
    
    setState(() {
      _isTyping = true;
      _errorMessage = null;
    });

    try {
      final result = await client.greeting.hello(_textEditingController.text);
      setState(() {
        _resultMessage = result.message;
        _isTyping = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
        _isTyping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green.shade100,
                radius: 30,
                child: const Icon(Icons.person, size: 35, color: Colors.green),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Butler',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Online and ready to assist'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Ask me anything about your garden, Sir.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'e.g. How are my tomatoes?',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: _askButler,
              ),
            ),
            onSubmitted: (_) => _askButler(),
          ),
          const SizedBox(height: 24),
          if (_isTyping)
            const Center(child: CircularProgressIndicator())
          else if (_resultMessage != null || _errorMessage != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _errorMessage != null ? Colors.red.shade50 : Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _errorMessage != null ? Colors.red.shade200 : Colors.green.shade200,
                ),
              ),
              child: Text(
                _errorMessage ?? _resultMessage!,
                style: TextStyle(
                  color: _errorMessage != null ? Colors.red.shade900 : Colors.green.shade900,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
