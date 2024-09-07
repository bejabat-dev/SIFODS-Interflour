import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MessageStates { loading, loaded, error }

class MessageStateData {
  final MessageStates state;
  final String data;

  MessageStateData({required this.state, required this.data});

  MessageStateData copyWith({MessageStates? state, String? data}) {
    return MessageStateData(
        state: state ?? this.state, data: data ?? this.data);
  }
}

class MessagesStateNotifier extends StateNotifier<MessageStateData> {
  MessagesStateNotifier()
      : super(MessageStateData(
            state: MessageStates.loaded, data: 'Data masih kosong'));

  void setData() async {
    try {
      state = MessageStateData(state: MessageStates.loading, data: 'Memuat');
      await Future.delayed(const Duration(seconds: 1));
      state =
          MessageStateData(state: MessageStates.loaded, data: 'Data dimuat');
    } on Exception catch (e) {
      state = MessageStateData(state: MessageStates.error, data: e.toString());
    }
  }
}

final messagesProvider =
    StateNotifierProvider<MessagesStateNotifier, MessageStateData>((ref) {
  return MessagesStateNotifier();
});
