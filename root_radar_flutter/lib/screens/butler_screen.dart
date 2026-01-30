import 'package:flutter/material.dart';
import 'package:root_radar_client/root_radar_client.dart';
import '../main.dart';

class ButlerScreen extends StatefulWidget {
  final bool showHeader;
  const ButlerScreen({super.key, this.showHeader = false});

  @override
  State<ButlerScreen> createState() => _ButlerScreenState();
}

class _ButlerScreenState extends State<ButlerScreen> {
  List<ButlerMessage> _messages = [];
  bool _isLoading = true;
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    setState(() => _isLoading = true);
    try {
      final messages = await client.butler.getMessages();
      setState(() {
        _messages = messages;
        _isLoading = false;
      });
      _scrollToBottom();
    } catch (e) {
      debugPrint('Error loading messages: $e');
      setState(() => _isLoading = false);
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _chatController.text.trim();
    if (text.isEmpty) return;

    _chatController.clear();
    setState(() => _isLoading = true);

    try {
      await client.butler.chatWithButler(text);
      await _loadMessages();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending message: $e')),
        );
      }
      setState(() => _isLoading = false);
    }
  }

  Future<void> _triggerBriefing() async {
    setState(() => _isLoading = true);
    try {
      await client.butler.triggerBriefing();
      await Future.delayed(const Duration(seconds: 2));
      await _loadMessages();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error triggering briefing: $e')),
        );
      }
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final butlerWidget = Column(
      children: [
        // Blue Morpho Butler Header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueGrey.shade100, width: 2),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/mascot.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blue Morpho Butler',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade800,
                      ),
                    ),
                    const Text(
                      'At your service, Sir.',
                      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _triggerBriefing,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade800,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.6),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.auto_awesome, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            const Text('Morning Briefing', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Message List
        Expanded(
          child: _isLoading && _messages.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : _messages.isEmpty
                  ? const Center(
                      child: Text(
                        '"Awaiting your command, Sir."',
                        style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final msg = _messages[index];
                        final isUser = msg.type == 'user';
                        
                        return Align(
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            padding: const EdgeInsets.all(12),
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                            decoration: BoxDecoration(
                              color: isUser ? Colors.blueGrey.shade800 : Colors.white,
                              borderRadius: BorderRadius.circular(15).copyWith(
                                bottomRight: isUser ? Radius.zero : null,
                                bottomLeft: !isUser ? Radius.zero : null,
                              ),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2)),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!isUser) ...[
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _getIconForType(msg.type),
                                      const SizedBox(width: 4),
                                      Text(
                                        msg.type.toUpperCase(),
                                        style: TextStyle(fontSize: 10, color: Colors.blueGrey.shade300, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                ],
                                Text(
                                  msg.message,
                                  style: TextStyle(
                                    color: isUser ? Colors.white : Colors.blueGrey.shade800,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  msg.timestamp.toString().substring(11, 16),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: isUser ? Colors.white70 : Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),

        // Chat Input
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _chatController,
                  decoration: InputDecoration(
                    hintText: 'Speak to the Butler...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey.shade50,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _sendMessage,
                icon: Icon(Icons.send, color: Colors.blueGrey.shade800),
              ),
            ],
          ),
        ),
      ],
    );

    if (widget.showHeader) {
      return Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          title: const Text('Blue Morpho Butler'),
          backgroundColor: Colors.blueGrey.shade900,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadMessages,
            ),
          ],
        ),
        body: butlerWidget,
      );
    }
    return butlerWidget;
  }

  Widget _getIconForType(String? type) {
    switch (type) {
      case 'alert':
        return const Icon(Icons.warning, color: Colors.red);
      case 'weather':
        return const Icon(Icons.wb_sunny, color: Colors.orange);
      case 'info':
      default:
        return const Icon(Icons.info, color: Colors.blue);
    }
  }
}
